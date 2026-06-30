#!/bin/bash

# --- Color formatting ---
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# =========================================================================
# IR GENERATION CONFIGURATION
# =========================================================================
OPT_LEVEL="-O2" # The optimization level to inspect (O2 is where the anomaly happens)
BENCHMARKS=("nettle-sha256" "matmult-int")
IR_OUT_DIR="ir"

# We assume the passes were already compiled by your main test.sh script
PASS_NAIVE_SO="out/InstCountCSV_naive.so"
PASS_REFINED_SO="out/InstCountCSV_refined.so"

echo -e "${CYAN}================================================${NC}"
echo -e "${CYAN}   LLVM IR Extraction Pipeline                  ${NC}"
echo -e "${CYAN}================================================${NC}\n"

# 1. Prerequisite Checks
if [ ! -f "$PASS_NAIVE_SO" ] || [ ! -f "$PASS_REFINED_SO" ]; then
    echo -e "${RED}[ERROR] Compiled LLVM passes not found in 'out/'. Please run your test.sh script first to compile them.${NC}"
    exit 1
fi

rm -rf "$IR_OUT_DIR"
mkdir -p "$IR_OUT_DIR"
echo -e "${GREEN}[OK] Dedicated IR output directory '$IR_OUT_DIR/' ready.${NC}\n"

# =========================================================================
# IR EXTRACTION LOOP
# =========================================================================

for BENCH_NAME in "${BENCHMARKS[@]}"; do
    echo -e "${YELLOW}Extracting IR for: ${BENCH_NAME}...${NC}"
    
    CURRENT_IR_DIR="$IR_OUT_DIR/$BENCH_NAME"
    mkdir -p "$CURRENT_IR_DIR"

    # 1. Generate individual un-instrumented IR files
    clang $OPT_LEVEL -DWARMUP_HEAT=1 -DGLOBAL_SCALE_FACTOR=1 -S -emit-llvm main.c -o "$CURRENT_IR_DIR/main.ll" || exit 1
    clang $OPT_LEVEL -DWARMUP_HEAT=1 -DGLOBAL_SCALE_FACTOR=1 -S -emit-llvm "${BENCH_NAME}.c" -o "$CURRENT_IR_DIR/${BENCH_NAME}.ll" || exit 1
    clang $OPT_LEVEL -DWARMUP_HEAT=1 -DGLOBAL_SCALE_FACTOR=1 -S -emit-llvm dummy_board.c -o "$CURRENT_IR_DIR/dummy_board.ll" || exit 1
    clang $OPT_LEVEL -DWARMUP_HEAT=1 -DGLOBAL_SCALE_FACTOR=1 -S -emit-llvm beebsc.c -o "$CURRENT_IR_DIR/beebsc.ll" || exit 1

    # 2. Link into a single base IR file
    llvm-link "$CURRENT_IR_DIR/main.ll" "$CURRENT_IR_DIR/${BENCH_NAME}.ll" "$CURRENT_IR_DIR/dummy_board.ll" "$CURRENT_IR_DIR/beebsc.ll" -S -o "$CURRENT_IR_DIR/base_combined.ll" || exit 1

    # 3. Inject Naive Pass
    opt -load-pass-plugin="$PASS_NAIVE_SO" -passes="inst-count-csv" "$CURRENT_IR_DIR/base_combined.ll" -S -o "$CURRENT_IR_DIR/instrumented_naive.ll" || exit 1

    # 4. Inject Refined Pass
    opt -load-pass-plugin="$PASS_REFINED_SO" -passes="inst-count-csv" "$CURRENT_IR_DIR/base_combined.ll" -S -o "$CURRENT_IR_DIR/instrumented_refined.ll" || exit 1

    # 5. Clean up the individual clutter, keeping only the final 3 important files
    rm "$CURRENT_IR_DIR/main.ll" "$CURRENT_IR_DIR/${BENCH_NAME}.ll" "$CURRENT_IR_DIR/dummy_board.ll" "$CURRENT_IR_DIR/beebsc.ll"

    echo -e "${GREEN}   -> Saved: base_combined.ll${NC}"
    echo -e "${GREEN}   -> Saved: instrumented_naive.ll${NC}"
    echo -e "${GREEN}   -> Saved: instrumented_refined.ll${NC}"
    echo ""
done

echo -e "${CYAN}================================================${NC}"
echo -e "${GREEN}IR Extraction complete. Open the '$IR_OUT_DIR/' folder.${NC}"
echo -e "${CYAN}================================================${NC}"