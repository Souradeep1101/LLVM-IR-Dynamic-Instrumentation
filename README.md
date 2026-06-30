# LLVM-IR-Dynamic-Instrumentation

This repository contains a custom LLVM optimization pass engineered for efficient dynamic Intermediate Representation (IR) instrumentation. The tool profiles runtime execution frequencies by categorizing LLVM IR instructions into 6 distinct architectural types.

## Key Features & Engineering
* **Dynamic IR Profiling:** Implements instrumentation to track execution frequency across 6 specific architectural instruction categories.
* **Performance Optimization:** Significantly decreased instrumented binary size and execution overhead by optimizing state updates. 
* **Aggregated Injections:** Replaced high-overhead per-instruction routines (load/add/store) with singular basic-block terminator injections.
* **Validation:** Performance and correctness validated using the [EmBench-iot](https://embench.org/) suite across `O0`–`O2` optimization levels.

## How it works


The instrumentation pass operates during the LLVM middle-end phase. By aggregating instrumentation logic into basic-block terminators, we reduce the total instruction count in the instrumented binary, minimizing the performance impact of runtime profiling.

## Benchmarking
The implementation was rigorously tested against the EmBench-iot suite to ensure that the profiling overhead remained minimal while maintaining accurate instruction frequency counts across varying optimization levels.

---
*Developed as part of advanced LLVM compiler infrastructure research.*