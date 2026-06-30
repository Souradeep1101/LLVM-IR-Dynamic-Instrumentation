#include "llvm/IR/Function.h"
#include "llvm/IR/InstIterator.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Plugins/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/ADT/StringMap.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/GlobalVariable.h"
#include "llvm/IR/Constants.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Instructions.h"

using namespace llvm;

namespace 
{
    class InstCountCSVPass : public PassInfoMixin<InstCountCSVPass> 
    {
        public:
            PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM)
            {
                LLVMContext &Ctx = M.getContext();

                Type *Int64Ty = Type::getInt64Ty(Ctx);
                Constant *InitZero = ConstantInt::get(Int64Ty, 0);
                GlobalVariable *MemReadCount = new GlobalVariable(M, Int64Ty, false, GlobalValue::InternalLinkage, InitZero, "DynMemReadCount");
                GlobalVariable *MemWriteCount = new GlobalVariable(M, Int64Ty, false, GlobalValue::InternalLinkage, InitZero, "DynMemWriteCount");
                GlobalVariable *ControlFlowCount = new GlobalVariable(M, Int64Ty, false, GlobalValue::InternalLinkage, InitZero, "DynControlFlowCount");
                GlobalVariable *ALUCount = new GlobalVariable(M, Int64Ty, false, GlobalValue::InternalLinkage, InitZero, "DynALUCount");
                GlobalVariable *AddressMathCount = new GlobalVariable(M, Int64Ty, false, GlobalValue::InternalLinkage, InitZero, "DynAddressMathCount");
                GlobalVariable *VectorCount = new GlobalVariable(M, Int64Ty, false, GlobalValue::InternalLinkage, InitZero, "DynVectorCount");
                GlobalVariable *CastCount = new GlobalVariable(M, Int64Ty, false, GlobalValue::InternalLinkage, InitZero, "DynCastCount");

                // OPTIMIZATION 1: A helper lambda that only injects code if the static tally > 0
                auto InjectBatchedUpdate = [&](Instruction *InsertPoint, GlobalVariable *Counter, uint64_t Amount) 
                {
                    if (Amount == 0) return; // If there were no instructions of this type in the block, do nothing!
                    
                    IRBuilder<> Builder(InsertPoint);
                    LoadInst *CurrentVal = Builder.CreateLoad(Int64Ty, Counter);
                    // Instead of adding 1, we add the compile-time calculated batch amount
                    Value *NewVal = Builder.CreateAdd(CurrentVal, ConstantInt::get(Int64Ty, Amount));
                    Builder.CreateStore(NewVal, Counter);
                };

                for (Function &F : M) 
                {
                    if (F.isDeclaration()) continue;
                    
                    // OPTIMIZATION 2: Iterate by BasicBlock, not flat instructions
                    for (BasicBlock &BB : F) 
                    {
                        // 1. Setup local static counters for this specific block
                        uint64_t BlockMemReads = 0;
                        uint64_t BlockMemWrites = 0;
                        uint64_t BlockAddressMath = 0;
                        uint64_t BlockControlFlow = 0;
                        uint64_t BlockALU = 0;
                        uint64_t BlockVector = 0;
                        uint64_t BlockCast = 0;

                        // 2. Tally up the instructions statically (at compile-time)
                        for (Instruction &I : BB) 
                        {
                            if (isa<LoadInst>(&I)) BlockMemReads++;
                            else if (isa<StoreInst>(&I)) BlockMemWrites++;
                            else if (isa<GetElementPtrInst>(&I)) BlockAddressMath++;
                            else if (I.isTerminator()) BlockControlFlow++;
                            else if (I.isBinaryOp() || isa<ICmpInst>(&I) || isa<FCmpInst>(&I)) BlockALU++;
                            else if (I.getType()->isVectorTy()) BlockVector++;
                            else if (I.isCast()) BlockCast++;
                        }

                        // 3. Find the end of the block (the terminator instruction)
                        Instruction *Terminator = BB.getTerminator();

                        // 4. Inject exactly ONE update per category, right before the block exits
                        InjectBatchedUpdate(Terminator, MemReadCount, BlockMemReads);
                        InjectBatchedUpdate(Terminator, MemWriteCount, BlockMemWrites);
                        InjectBatchedUpdate(Terminator, AddressMathCount, BlockAddressMath);
                        InjectBatchedUpdate(Terminator, ControlFlowCount, BlockControlFlow);
                        InjectBatchedUpdate(Terminator, ALUCount, BlockALU);
                        InjectBatchedUpdate(Terminator, VectorCount, BlockVector);
                        InjectBatchedUpdate(Terminator, CastCount, BlockCast);
                    }
                }

                // --- The rest of the pass remains identical (CSV formatting and main() injection) ---
                PointerType *Int8PtrTy = PointerType::getUnqual(Ctx);
                FunctionType *PrintfTy = FunctionType::get(Type::getInt32Ty(Ctx), {Int8PtrTy}, true);
                FunctionCallee PrintfFunc = M.getOrInsertFunction("printf", PrintfTy);

                IRBuilder<> GlobalBuilder(Ctx);
                Value *FormatString = GlobalBuilder.CreateGlobalString(
                    "--- Dynamic Execution Profile ---\n"
                    "Instruction Category,Count\n"
                    "Memory Reads,%lu\n"
                    "Memory Writes,%lu\n"
                    "Address Math,%lu\n"
                    "Control Flow,%lu\n"
                    "ALU & Math,%lu\n"
                    "Vector/SIMD,%lu\n"
                    "Type Casts,%lu\n",
                    "CSVFormatString", 
                    0,
                    &M
                );

                Function *MainFunc = M.getFunction("main");

                if (MainFunc) 
                {
                    for (BasicBlock &BB : *MainFunc) {
                        Instruction *Terminator = BB.getTerminator();
                        
                        if (ReturnInst *Ret = dyn_cast_or_null<ReturnInst>(Terminator)) 
                        {
                            IRBuilder<> Builder(Ret);
                            Value *ReadVal = Builder.CreateLoad(Int64Ty, MemReadCount);
                            Value *WriteVal = Builder.CreateLoad(Int64Ty, MemWriteCount);
                            Value *AddrVal = Builder.CreateLoad(Int64Ty, AddressMathCount);
                            Value *FlowVal = Builder.CreateLoad(Int64Ty, ControlFlowCount);
                            Value *ALUVal = Builder.CreateLoad(Int64Ty, ALUCount);
                            Value *VectorVal = Builder.CreateLoad(Int64Ty, VectorCount);
                            Value *CastVal = Builder.CreateLoad(Int64Ty, CastCount);
                            Builder.CreateCall(PrintfFunc, 
                                {FormatString, ReadVal, WriteVal, AddrVal, FlowVal, ALUVal, VectorVal, CastVal}
                            );
                        }
                    }
                }
                
                return PreservedAnalyses::all();
            }
    };

    llvm::PassPluginLibraryInfo getInstCountCSVPluginInfo()
    {
        return 
        {
            LLVM_PLUGIN_API_VERSION, "InstCountCSV", LLVM_VERSION_STRING, 
            [](PassBuilder &PB) 
            {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, ModulePassManager &MPM,
                        ArrayRef<PassBuilder::PipelineElement>)
                        {
                            if (Name == "inst-count-csv")
                            {
                                MPM.addPass(InstCountCSVPass());
                                return true;
                            }
                            return false;
                        }
                    );
            }
        };
    }
}

extern "C" LLVM_ATTRIBUTE_WEAK::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo()
{
    return getInstCountCSVPluginInfo();
}