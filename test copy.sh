#!/bin/bash

# --- Color formatting for terminal outputs ---
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# =========================================================================
# EXPERIMENT CONFIGURATION
# Set to -O0, -O1, or -O2. The script will automatically handle optnone rules.
OPT_LEVEL="-O0"
# =========================================================================

# --- Variables ---
PASS_SO="./InstCountCSV.so"
MAIN_SRC="main.c"
BENCH_SRC="nettle-sha256.c"
SUPPORT_SRC="dummy_board.c beebsc.c"
BASE_BIN="benchmark_baseline"
INST_BIN="benchmark_instrumented"

echo -e "${CYAN}================================================${NC}"
echo -e "${CYAN}   Embench-IoT LLVM Dynamic Profiling Pipeline  ${NC}"
echo -e "${CYAN}   Optimization Level Target: ${YELLOW}${OPT_LEVEL}${NC}"
echo -e "${CYAN}================================================${NC}\n"

# --- Automatic optnone Firewall Handling ---
FRONTEND_FLAGS="$OPT_LEVEL"
if [ "$OPT_LEVEL" == "-O0" ]; then
    echo -e "${YELLOW}[INFO] -O0 detected. Unlocking IR attributes (-disable-O0-optnone).${NC}"
    FRONTEND_FLAGS="-O0 -Xclang -disable-O0-optnone"
fi

# 1. Prerequisite Checks
echo -e "${YELLOW}Step 1: Checking prerequisites...${NC}"
for file in $PASS_SO $MAIN_SRC $BENCH_SRC "dummy_board.c" "beebsc.c" "support.h" "beebsc.h"; do
    if [ ! -f "$file" ]; then
        echo -e "${RED}[ERROR] Required file '$file' not found in the current directory.${NC}"
        exit 1
    fi
done
echo -e "${GREEN}[OK] All required source and plugin files present.${NC}\n"

# 2. Generate Shared Intermediate IR
echo -e "${YELLOW}Step 2: Generating Shared Intermediate IR (${OPT_LEVEL})...${NC}"
clang $FRONTEND_FLAGS -DWARMUP_HEAT=1 -DGLOBAL_SCALE_FACTOR=1 -S -emit-llvm $MAIN_SRC $BENCH_SRC $SUPPORT_SRC || {
    echo -e "${RED}[ERROR] Failed to generate initial LLVM IR.${NC}"
    exit 1
}
llvm-link main.ll nettle-sha256.ll dummy_board.ll beebsc.ll -S -o combined.ll || {
    echo -e "${RED}[ERROR] Failed to merge LLVM IR files via llvm-link.${NC}"
    exit 1
}
echo -e "${GREEN}[OK] Shared combined.ll generated successfully.${NC}\n"

# 3. Compile Baseline Binary (Symmetric Path)
echo -e "${YELLOW}Step 3: Compiling Baseline Binary (${OPT_LEVEL})...${NC}"
clang $OPT_LEVEL combined.ll -o $BASE_BIN || {
    echo -e "${RED}[ERROR] Baseline compilation failed.${NC}"
    exit 1
}
echo -e "${GREEN}[OK] Baseline compiled successfully.${NC}\n"

# 4. Compile Instrumented Binary (Symmetric Path)
echo -e "${YELLOW}Step 4: Compiling Instrumented Binary (${OPT_LEVEL})...${NC}"
opt -load-pass-plugin="$PASS_SO" \
    -passes="inst-count-csv" \
    combined.ll -S -o instrumented.ll || {
    echo -e "${RED}[ERROR] LLVM pass 'inst-count-csv' crashed or failed.${NC}"
    exit 1
}
clang $OPT_LEVEL instrumented.ll -o $INST_BIN || {
    echo -e "${RED}[ERROR] Final instrumented binary compilation failed.${NC}"
    exit 1
}
echo -e "${GREEN}[OK] Instrumented binary compiled successfully.${NC}\n"

# 5. Execution & Benchmarking (Elevated Privileges)
echo -e "${CYAN}================================================${NC}"
echo -e "${CYAN}               Execution Metrics                ${NC}"
echo -e "${CYAN}================================================${NC}\n"

# Run Baseline
echo -e "${YELLOW}>>> 1. BASELINE EXECUTION <<<${NC}"
sudo nice -n -20 /usr/bin/time -v ./$BASE_BIN 2> time_baseline.txt || {
    echo -e "${RED}[ERROR] Baseline execution failed.${NC}"
    exit 1
}
grep "User time" time_baseline.txt
grep "Maximum resident set size" time_baseline.txt
echo ""

# Run Instrumented
echo -e "${YELLOW}>>> 2. INSTRUMENTED EXECUTION <<<${NC}"
sudo nice -n -20 /usr/bin/time -v ./$INST_BIN 2> time_instrumented.txt || {
    echo -e "${RED}[ERROR] Instrumented execution failed.${NC}"
    exit 1
}
echo ""
echo -e "${YELLOW}--- Instrumented Overhead Metrics ---${NC}"
grep "User time" time_instrumented.txt
grep "Maximum resident set size" time_instrumented.txt

echo -e "\n${GREEN}[SUCCESS] Pipeline complete! Full timing logs saved to time_baseline.txt and time_instrumented.txt.${NC}"