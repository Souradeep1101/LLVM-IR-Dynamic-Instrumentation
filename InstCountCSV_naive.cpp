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

                auto IncrementCounter = [&](Instruction *InsertPoint, GlobalVariable *Counter) 
                {
                    IRBuilder<> Builder(InsertPoint);
                    LoadInst *CurrentVal = Builder.CreateLoad(Int64Ty, Counter);
                    Value *NewVal = Builder.CreateAdd(CurrentVal, ConstantInt::get(Int64Ty, 1));
                    Builder.CreateStore(NewVal, Counter);
                };

                for (Function &F : M) 
                {
                    if (F.isDeclaration()) continue;
                    for (auto &I : instructions(F)) 
                    {
                        if (isa<LoadInst>(&I)) 
                        {
                            IncrementCounter(&I, MemReadCount);
                        } 
                        else if (isa<StoreInst>(&I)) 
                        {
                            IncrementCounter(&I, MemWriteCount);
                        } 
                        else if (isa<GetElementPtrInst>(&I)) 
                        {
                            IncrementCounter(&I, AddressMathCount);
                        } 
                        else if (I.isTerminator()) 
                        {
                            IncrementCounter(&I, ControlFlowCount);
                        } 
                        else if (I.isBinaryOp() || isa<ICmpInst>(&I) || isa<FCmpInst>(&I)) 
                        {
                            IncrementCounter(&I, ALUCount);
                        } 
                        else if (I.getType()->isVectorTy()) 
                        {
                            IncrementCounter(&I, VectorCount);
                        } 
                        else if (I.isCast()) 
                        {
                            IncrementCounter(&I, CastCount);
                        }
                    }
                }

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