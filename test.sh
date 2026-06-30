#!/bin/bash

# --- Color formatting for terminal outputs ---
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# =========================================================================
# EXPERIMENT CONFIGURATION
# =========================================================================
OPT_LEVELS=("-O0" "-O1" "-O2")
BENCHMARKS=("nettle-sha256" "matmult-int")
PASS_NAIVE_SRC="InstCountCSV_naive.cpp"
PASS_REFINED_SRC="InstCountCSV_refined.cpp"
TRIALS=5
GLOBAL_OUT_DIR="out"

# --- NEW BENCHMARKING RIGOR VARIABLES ---
FLUSH_CACHE=1       # Set to 1 to clear OS cache before every approach (Requires Sudo)
REVERSE_ORDER=0     # 0 = Base->Naive->Refined | 1 = Refined->Naive->Base

PASS_NAIVE_SO="$GLOBAL_OUT_DIR/InstCountCSV_naive.so"
PASS_REFINED_SO="$GLOBAL_OUT_DIR/InstCountCSV_refined.so"

echo -e "${CYAN}================================================${NC}"
echo -e "${CYAN}   Strict Micro-Benchmarking Profiling Pipeline ${NC}"
echo -e "${CYAN}================================================${NC}\n"

# Request sudo privileges upfront so the script doesn't pause mid-run for a password
if [ "$FLUSH_CACHE" -eq 1 ]; then
    echo -e "${YELLOW}Requesting sudo privileges for OS Cache flushing...${NC}"
    sudo -v || { echo -e "${RED}[ERROR] Sudo required for cache flushing.${NC}"; exit 1; }
fi

# 1. Prerequisite Checks
echo -e "${YELLOW}Step 1: Checking prerequisites...${NC}"
for file in "$PASS_NAIVE_SRC" "$PASS_REFINED_SRC" "main.c" "dummy_board.c" "beebsc.c" "support.h" "beebsc.h"; do
    if [ ! -f "$file" ]; then
        echo -e "${RED}[ERROR] Required core file '$file' not found.${NC}"
        exit 1
    fi
done

for bench in "${BENCHMARKS[@]}"; do
    if [ ! -f "${bench}.c" ]; then
        echo -e "${RED}[ERROR] Required benchmark file '${bench}.c' not found.${NC}"
        exit 1
    fi
done

if ! command -v pdflatex &> /dev/null || ! command -v pdftoppm &> /dev/null; then
    echo -e "${RED}[ERROR] Missing LaTeX or poppler. Please install texlive-basic and poppler.${NC}"
    exit 1
fi

rm -rf "$GLOBAL_OUT_DIR"
mkdir -p "$GLOBAL_OUT_DIR"
echo -e "${GREEN}[OK] Prerequisites met. Output directory ready.${NC}\n"

# 1.5 Compile Passes
echo -e "${YELLOW}Step 1.5: Compiling LLVM Pass Plugins...${NC}"
clang++ -O3 -shared -fPIC $(llvm-config --cxxflags) "$PASS_NAIVE_SRC" -o "$PASS_NAIVE_SO" || exit 1
clang++ -O3 -shared -fPIC $(llvm-config --cxxflags) "$PASS_REFINED_SRC" -o "$PASS_REFINED_SO" || exit 1
echo -e "${GREEN}[OK] Pass plugins compiled successfully.${NC}\n"

# =========================================================================
# BENCHMARK EXECUTION LOOP
# =========================================================================

for BENCH_NAME in "${BENCHMARKS[@]}"; do
    CURRENT_OUT_DIR="$GLOBAL_OUT_DIR/$BENCH_NAME"
    mkdir -p "$CURRENT_OUT_DIR"
    SRC_FILES=("main.c" "${BENCH_NAME}.c" "dummy_board.c" "beebsc.c")

    echo -e "${CYAN}================================================${NC}"
    echo -e "${CYAN}   PROCESSING BENCHMARK: ${YELLOW}${BENCH_NAME}${NC}"
    echo -e "${CYAN}================================================${NC}"

    run_pipeline_for_opt() {
        local OPT=$1
        local FRONTEND_FLAGS="$OPT"
        
        if [ "$OPT" == "-O0" ]; then
            FRONTEND_FLAGS="-O0 -Xclang -disable-O0-optnone"
        fi

        # Compilation & Pass Injection
        local LL_FILES=()
        for src in "${SRC_FILES[@]}"; do
            local base_name="${src%.*}"
            clang $FRONTEND_FLAGS -DWARMUP_HEAT=1 -DGLOBAL_SCALE_FACTOR=1 -S -emit-llvm "$src" -o "$CURRENT_OUT_DIR/${base_name}_${OPT}.ll" || exit 1
            LL_FILES+=("$CURRENT_OUT_DIR/${base_name}_${OPT}.ll")
        done
        llvm-link "${LL_FILES[@]}" -S -o "$CURRENT_OUT_DIR/combined_${OPT}.ll" || exit 1
        clang $OPT "$CURRENT_OUT_DIR/combined_${OPT}.ll" -o "$CURRENT_OUT_DIR/base_bin_${OPT}" || exit 1
        
        opt -load-pass-plugin="$PASS_NAIVE_SO" -passes="inst-count-csv" "$CURRENT_OUT_DIR/combined_${OPT}.ll" -S -o "$CURRENT_OUT_DIR/naive_${OPT}.ll" || exit 1
        clang $OPT "$CURRENT_OUT_DIR/naive_${OPT}.ll" -o "$CURRENT_OUT_DIR/naive_bin_${OPT}" || exit 1

        opt -load-pass-plugin="$PASS_REFINED_SO" -passes="inst-count-csv" "$CURRENT_OUT_DIR/combined_${OPT}.ll" -S -o "$CURRENT_OUT_DIR/refined_${OPT}.ll" || exit 1
        clang $OPT "$CURRENT_OUT_DIR/refined_${OPT}.ll" -o "$CURRENT_OUT_DIR/refined_bin_${OPT}" || exit 1

        # Strict execution wrapper
        run_and_average() {
            local approach=$1
            local bin_name=""
            
            if [ "$approach" == "Baseline" ]; then bin_name="base_bin_${OPT}"; fi
            if [ "$approach" == "Naive" ]; then bin_name="naive_bin_${OPT}"; fi
            if [ "$approach" == "Refined" ]; then bin_name="refined_bin_${OPT}"; fi
            
            local total_time=0

            # 1. Flush the OS Cache to force a "Cold Cache" state
            if [ "$FLUSH_CACHE" -eq 1 ]; then
                sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'
            fi

            for ((i=1; i<=TRIALS; i++)); do
                /usr/bin/time -f "%U" -o "$CURRENT_OUT_DIR/time_tmp_${OPT}_${approach}.txt" "./$CURRENT_OUT_DIR/$bin_name" > /dev/null 2>&1
                local utime=$(cat "$CURRENT_OUT_DIR/time_tmp_${OPT}_${approach}.txt")
                total_time=$(awk "BEGIN {print $total_time + $utime}")
            done
            
            local avg_time=$(awk "BEGIN {printf \"%.2f\", $total_time / $TRIALS}")
            echo "${OPT},${approach},${avg_time}" >> "$CURRENT_OUT_DIR/res_${OPT}.csv"
        }

        # 2. Execute based on configured order constraint
        if [ "$REVERSE_ORDER" -eq 1 ]; then
            echo -e "   -> Running ${OPT} (Order: Refined -> Naive -> Baseline)"
            run_and_average "Refined"
            run_and_average "Naive"
            run_and_average "Baseline"
        else
            echo -e "   -> Running ${OPT} (Order: Baseline -> Naive -> Refined)"
            run_and_average "Baseline"
            run_and_average "Naive"
            run_and_average "Refined"
        fi
    }

    echo -e "${YELLOW}Compiling and Benchmarking (Sequentially across O0, O1, O2)...${NC}"
    # Removed backgrounding (&) to prevent CPU resource thrashing
    for OPT in "${OPT_LEVELS[@]}"; do
        run_pipeline_for_opt "$OPT"
    done

    echo "Optimization,Approach,AvgUserTime_s" > "$CURRENT_OUT_DIR/execution_results.csv"
    cat "$CURRENT_OUT_DIR"/res_-O0.csv "$CURRENT_OUT_DIR"/res_-O1.csv "$CURRENT_OUT_DIR"/res_-O2.csv >> "$CURRENT_OUT_DIR/execution_results.csv"
    rm -f "$CURRENT_OUT_DIR"/res_*.csv "$CURRENT_OUT_DIR"/time_tmp_*.txt "$CURRENT_OUT_DIR"/*.ll "$CURRENT_OUT_DIR"/*_bin_*

    # --- LATEX & PNG GENERATION ---
    extract_val() { grep -- "$1,$2," "$CURRENT_OUT_DIR/execution_results.csv" | cut -d',' -f3; }

    B_O0=$(extract_val "-O0" "Baseline"); B_O1=$(extract_val "-O1" "Baseline"); B_O2=$(extract_val "-O2" "Baseline")
    N_O0=$(extract_val "-O0" "Naive");    N_O1=$(extract_val "-O1" "Naive");    N_O2=$(extract_val "-O2" "Naive")
    R_O0=$(extract_val "-O0" "Refined");  R_O1=$(extract_val "-O1" "Refined");  R_O2=$(extract_val "-O2" "Refined")

    cat << EOF > "$CURRENT_OUT_DIR/graph_naive.tex"
\documentclass[tikz, border=10pt]{standalone}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={\textbf{Execution Time: Naive Instrumentation ($BENCH_NAME)}},
    ybar=5pt, enlarge x limits=0.3, ylabel={Execution Time (Seconds)},
    symbolic x coords={O0, O1, O2}, xtick=data, bar width=25pt,
    nodes near coords, every node near coord/.append style={font=\footnotesize},
    legend style={at={(0.5,-0.15)}, anchor=north, legend columns=-1},
    width=14cm, height=8cm, grid=major, ymin=0
]
\addplot[fill=gray!40, draw=gray!80!black] coordinates {(O0, $B_O0) (O1, $B_O1) (O2, $B_O2)};
\addplot[fill=red!60, draw=red!80!black] coordinates {(O0, $N_O0) (O1, $N_O1) (O2, $N_O2)};
\legend{Baseline ($TRIALS-Trial Avg), Naive Instrumented ($TRIALS-Trial Avg)}
\end{axis}
\end{tikzpicture}
\end{document}
EOF

    cat << EOF > "$CURRENT_OUT_DIR/graph_refined.tex"
\documentclass[tikz, border=10pt]{standalone}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={\textbf{Execution Time: Refined Batched Instrumentation ($BENCH_NAME)}},
    ybar=5pt, enlarge x limits=0.3, ylabel={Execution Time (Seconds)},
    symbolic x coords={O0, O1, O2}, xtick=data, bar width=25pt,
    nodes near coords, every node near coord/.append style={font=\footnotesize},
    legend style={at={(0.5,-0.15)}, anchor=north, legend columns=-1},
    width=14cm, height=8cm, grid=major, ymin=0
]
\addplot[fill=gray!40, draw=gray!80!black] coordinates {(O0, $B_O0) (O1, $B_O1) (O2, $B_O2)};
\addplot[fill=blue!50, draw=blue!80!black] coordinates {(O0, $R_O0) (O1, $R_O1) (O2, $R_O2)};
\legend{Baseline ($TRIALS-Trial Avg), Refined Instrumented ($TRIALS-Trial Avg)}
\end{axis}
\end{tikzpicture}
\end{document}
EOF

    cat << EOF > "$CURRENT_OUT_DIR/graph_combined.tex"
\documentclass[tikz, border=10pt]{standalone}
\usepackage{pgfplots}
\pgfplotsset{compat=1.18}
\begin{document}
\begin{tikzpicture}
\begin{axis}[
    title={\textbf{Execution Time: Complete Architecture Comparison ($BENCH_NAME)}},
    ybar=3pt, enlarge x limits=0.3, ylabel={Execution Time (Seconds)},
    symbolic x coords={O0, O1, O2}, xtick=data, bar width=18pt,
    nodes near coords, every node near coord/.append style={font=\scriptsize},
    legend style={at={(0.5,-0.15)}, anchor=north, legend columns=-1},
    width=14cm, height=8cm, grid=major, ymin=0
]
\addplot[fill=gray!40, draw=gray!80!black] coordinates {(O0, $B_O0) (O1, $B_O1) (O2, $B_O2)};
\addplot[fill=red!60, draw=red!80!black] coordinates {(O0, $N_O0) (O1, $N_O1) (O2, $N_O2)};
\addplot[fill=blue!50, draw=blue!80!black] coordinates {(O0, $R_O0) (O1, $R_O1) (O2, $R_O2)};
\legend{Baseline ($TRIALS-Trial), Naive ($TRIALS-Trial), Refined ($TRIALS-Trial)}
\end{axis}
\end{tikzpicture}
\end{document}
EOF

    pdflatex -interaction=batchmode -output-directory="$CURRENT_OUT_DIR" "$CURRENT_OUT_DIR/graph_naive.tex" > /dev/null
    pdflatex -interaction=batchmode -output-directory="$CURRENT_OUT_DIR" "$CURRENT_OUT_DIR/graph_refined.tex" > /dev/null
    pdflatex -interaction=batchmode -output-directory="$CURRENT_OUT_DIR" "$CURRENT_OUT_DIR/graph_combined.tex" > /dev/null
    
    pdftoppm -png -r 300 "$CURRENT_OUT_DIR/graph_naive.pdf" "$CURRENT_OUT_DIR/graph_naive"
    pdftoppm -png -r 300 "$CURRENT_OUT_DIR/graph_refined.pdf" "$CURRENT_OUT_DIR/graph_refined"
    pdftoppm -png -r 300 "$CURRENT_OUT_DIR/graph_combined.pdf" "$CURRENT_OUT_DIR/graph_combined"
    
    mv "$CURRENT_OUT_DIR/graph_naive-1.png" "$CURRENT_OUT_DIR/graph_naive.png"
    mv "$CURRENT_OUT_DIR/graph_refined-1.png" "$CURRENT_OUT_DIR/graph_refined.png"
    mv "$CURRENT_OUT_DIR/graph_combined-1.png" "$CURRENT_OUT_DIR/graph_combined.png"

    rm -f "$CURRENT_OUT_DIR"/*.aux "$CURRENT_OUT_DIR"/*.log
    echo -e "${GREEN}[SUCCESS] Finished $BENCH_NAME.${NC}\n"
done

echo -e "${CYAN}================================================${NC}"
echo -e "${GREEN}All benchmarks complete. Check the '/out' folder.${NC}"
echo -e "${CYAN}================================================${NC}"