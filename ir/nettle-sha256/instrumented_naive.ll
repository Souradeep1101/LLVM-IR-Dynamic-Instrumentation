; ModuleID = 'ir/nettle-sha256/base_combined.ll'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sha256_ctx = type { [8 x i32], i64, [64 x i8], i32 }

@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"
@sha256_init.H0 = internal unnamed_addr constant [8 x i32] [i32 1779033703, i32 -1150833019, i32 1013904242, i32 -1521486534, i32 1359893119, i32 -1694144372, i32 528734635, i32 1541459225], align 16
@K = internal constant [64 x i32] [i32 1116352408, i32 1899447441, i32 -1245643825, i32 -373957723, i32 961987163, i32 1508970993, i32 -1841331548, i32 -1424204075, i32 -670586216, i32 310598401, i32 607225278, i32 1426881987, i32 1925078388, i32 -2132889090, i32 -1680079193, i32 -1046744716, i32 -459576895, i32 -272742522, i32 264347078, i32 604807628, i32 770255983, i32 1249150122, i32 1555081692, i32 1996064986, i32 -1740746414, i32 -1473132947, i32 -1341970488, i32 -1084653625, i32 -958395405, i32 -710438585, i32 113926993, i32 338241895, i32 666307205, i32 773529912, i32 1294757372, i32 1396182291, i32 1695183700, i32 1986661051, i32 -2117940946, i32 -1838011259, i32 -1564481375, i32 -1474664885, i32 -1035236496, i32 -949202525, i32 -778901479, i32 -694614492, i32 -200395387, i32 275423344, i32 430227734, i32 506948616, i32 659060556, i32 883997877, i32 958139571, i32 1322822218, i32 1537002063, i32 1747873779, i32 1955562222, i32 2024104815, i32 -2067236844, i32 -1933114872, i32 -1866530822, i32 -1538233109, i32 -1090935817, i32 -965641998], align 16
@.str = private unnamed_addr constant [7 x i8] c"sha256\00", align 1
@nettle_sha256 = dso_local local_unnamed_addr constant { ptr, i32, i32, i32, [4 x i8], ptr, ptr, ptr } { ptr @.str, i32 112, i32 32, i32 64, [4 x i8] zeroinitializer, ptr @sha256_init, ptr @sha256_update, ptr @sha256_digest }, align 8
@msg = dso_local local_unnamed_addr global [56 x i8] c"abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq", align 16
@hash = dso_local local_unnamed_addr global [32 x i8] c"$\8Dja\D2\068\B8\E5\C0&\93\0C>`9\A3<\E4Yd\FF!g\F6\EC\ED\D4\19\DB\06\C1", align 16
@buffer = dso_local global [32 x i8] zeroinitializer, align 16
@seed = internal unnamed_addr global i64 0, align 8
@heap_ptr = internal unnamed_addr global ptr null, align 8
@heap_end = internal unnamed_addr global ptr null, align 8
@heap_requested = internal unnamed_addr global i64 0, align 8
@DynMemReadCount = internal global i64 0
@DynMemWriteCount = internal global i64 0
@DynControlFlowCount = internal global i64 0
@DynALUCount = internal global i64 0
@DynAddressMathCount = internal global i64 0
@DynVectorCount = internal global i64 0
@DynCastCount = internal global i64 0
@CSVFormatString = private unnamed_addr constant [177 x i8] c"--- Dynamic Execution Profile ---\0AInstruction Category,Count\0AMemory Reads,%lu\0AMemory Writes,%lu\0AAddress Math,%lu\0AControl Flow,%lu\0AALU & Math,%lu\0AVector/SIMD,%lu\0AType Casts,%lu\0A\00", align 1

; Function Attrs: nounwind sspstrong uwtable
define dso_local range(i32 0, 2) i32 @main(i32 %0, ptr readnone captures(none) %1) #0 {
  %3 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  tail call void @initialise_board() #17
  tail call void @initialise_benchmark() #17
  tail call void @warm_caches(i32 noundef 1) #17
  tail call void @start_trigger() #17
  %4 = load i64, ptr @DynControlFlowCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynControlFlowCount, align 8
  br label %27

6:                                                ; preds = %27
  tail call void @stop_trigger() #17
  %7 = load i64, ptr @DynMemReadCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynMemReadCount, align 8
  %9 = load volatile i32, ptr %3, align 4, !tbaa !1
  %10 = tail call i32 @verify_benchmark(i32 noundef %9) #17
  %11 = load i64, ptr @DynALUCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynALUCount, align 8
  %13 = icmp eq i32 %10, 0
  %14 = load i64, ptr @DynCastCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynCastCount, align 8
  %16 = zext i1 %13 to i32
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %17 = load i64, ptr @DynControlFlowCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynControlFlowCount, align 8
  %19 = load i64, ptr @DynMemReadCount, align 8
  %20 = load i64, ptr @DynMemWriteCount, align 8
  %21 = load i64, ptr @DynAddressMathCount, align 8
  %22 = load i64, ptr @DynControlFlowCount, align 8
  %23 = load i64, ptr @DynALUCount, align 8
  %24 = load i64, ptr @DynVectorCount, align 8
  %25 = load i64, ptr @DynCastCount, align 8
  %26 = call i32 (ptr, ...) @printf(ptr @CSVFormatString, i64 %19, i64 %20, i64 %21, i64 %22, i64 %23, i64 %24, i64 %25)
  ret i32 %16

27:                                               ; preds = %27, %2
  %28 = phi i32 [ 0, %2 ], [ %37, %27 ]
  %29 = tail call i32 @benchmark() #17
  %30 = load i64, ptr @DynMemWriteCount, align 8
  %31 = add i64 %30, 1
  store i64 %31, ptr @DynMemWriteCount, align 8
  store volatile i32 %29, ptr %3, align 4, !tbaa !1
  %32 = load i64, ptr @DynMemReadCount, align 8
  %33 = add i64 %32, 1
  store i64 %33, ptr @DynMemReadCount, align 8
  %34 = load volatile i32, ptr %3, align 4, !tbaa !1
  tail call void asm sideeffect "", "r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 %34) #17, !srcloc !9
  %35 = load i64, ptr @DynALUCount, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr @DynALUCount, align 8
  %37 = add nuw nsw i32 %28, 1
  %38 = load i64, ptr @DynALUCount, align 8
  %39 = add i64 %38, 1
  store i64 %39, ptr @DynALUCount, align 8
  %40 = icmp eq i32 %37, 10000
  %41 = load i64, ptr @DynControlFlowCount, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr @DynControlFlowCount, align 8
  br i1 %40, label %6, label %27, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @sha256_init(ptr noundef writeonly captures(none) initializes((0, 40), (104, 108)) %0) #2 {
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  %2 = load i64, ptr @DynAddressMathCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynAddressMathCount, align 8
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %5 = load i64, ptr @DynMemWriteCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynMemWriteCount, align 8
  store i64 0, ptr %4, align 8, !tbaa !12
  %7 = load i64, ptr @DynAddressMathCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynAddressMathCount, align 8
  %9 = getelementptr inbounds nuw i8, ptr %0, i64 104
  %10 = load i64, ptr @DynMemWriteCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynMemWriteCount, align 8
  store i32 0, ptr %9, align 8, !tbaa !15
  %12 = load i64, ptr @DynControlFlowCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @sha256_update(ptr noundef captures(none) %0, i64 noundef %1, ptr noundef readonly captures(none) %2) #3 {
  %4 = load i64, ptr @DynAddressMathCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynAddressMathCount, align 8
  %6 = getelementptr inbounds nuw i8, ptr %0, i64 104
  %7 = load i64, ptr @DynMemReadCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynMemReadCount, align 8
  %9 = load i32, ptr %6, align 8, !tbaa !15
  %10 = load i64, ptr @DynALUCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynALUCount, align 8
  %12 = icmp eq i32 %9, 0
  %13 = load i64, ptr @DynControlFlowCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynControlFlowCount, align 8
  br i1 %12, label %68, label %15

15:                                               ; preds = %3
  %16 = load i64, ptr @DynCastCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynCastCount, align 8
  %18 = zext i32 %9 to i64
  %19 = load i64, ptr @DynALUCount, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr @DynALUCount, align 8
  %21 = sub i32 64, %9
  %22 = load i64, ptr @DynCastCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynCastCount, align 8
  %24 = zext i32 %21 to i64
  %25 = load i64, ptr @DynALUCount, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr @DynALUCount, align 8
  %27 = icmp ult i64 %1, %24
  %28 = load i64, ptr @DynAddressMathCount, align 8
  %29 = add i64 %28, 1
  store i64 %29, ptr @DynAddressMathCount, align 8
  %30 = getelementptr inbounds nuw i8, ptr %0, i64 40
  %31 = load i64, ptr @DynAddressMathCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynAddressMathCount, align 8
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 %18
  %34 = load i64, ptr @DynControlFlowCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynControlFlowCount, align 8
  br i1 %27, label %56, label %36

36:                                               ; preds = %15
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %33, ptr align 1 %2, i64 %24, i1 false)
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %30, ptr noundef nonnull @K)
  %37 = load i64, ptr @DynAddressMathCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynAddressMathCount, align 8
  %39 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %40 = load i64, ptr @DynMemReadCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynMemReadCount, align 8
  %42 = load i64, ptr %39, align 8, !tbaa !12
  %43 = load i64, ptr @DynALUCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynALUCount, align 8
  %45 = add i64 %42, 1
  %46 = load i64, ptr @DynMemWriteCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynMemWriteCount, align 8
  store i64 %45, ptr %39, align 8, !tbaa !12
  %48 = load i64, ptr @DynAddressMathCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynAddressMathCount, align 8
  %50 = getelementptr inbounds nuw i8, ptr %2, i64 %24
  %51 = load i64, ptr @DynALUCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynALUCount, align 8
  %53 = sub nuw i64 %1, %24
  %54 = load i64, ptr @DynControlFlowCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynControlFlowCount, align 8
  br label %68

56:                                               ; preds = %15
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %33, ptr align 1 %2, i64 %1, i1 false)
  %57 = load i64, ptr @DynMemReadCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynMemReadCount, align 8
  %59 = load i32, ptr %6, align 8, !tbaa !15
  %60 = load i64, ptr @DynCastCount, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr @DynCastCount, align 8
  %62 = trunc nuw i64 %1 to i32
  %63 = load i64, ptr @DynALUCount, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr @DynALUCount, align 8
  %65 = add i32 %59, %62
  %66 = load i64, ptr @DynControlFlowCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynControlFlowCount, align 8
  br label %115

68:                                               ; preds = %36, %3
  %69 = phi ptr [ %50, %36 ], [ %2, %3 ]
  %70 = phi i64 [ %53, %36 ], [ %1, %3 ]
  %71 = load i64, ptr @DynALUCount, align 8
  %72 = add i64 %71, 1
  store i64 %72, ptr @DynALUCount, align 8
  %73 = icmp ugt i64 %70, 63
  %74 = load i64, ptr @DynControlFlowCount, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr @DynControlFlowCount, align 8
  br i1 %73, label %76, label %104

76:                                               ; preds = %68
  %77 = load i64, ptr @DynAddressMathCount, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr @DynAddressMathCount, align 8
  %79 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %80 = load i64, ptr @DynControlFlowCount, align 8
  %81 = add i64 %80, 1
  store i64 %81, ptr @DynControlFlowCount, align 8
  br label %82

82:                                               ; preds = %82, %76
  %83 = phi i64 [ %70, %76 ], [ %98, %82 ]
  %84 = phi ptr [ %69, %76 ], [ %95, %82 ]
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef %84, ptr noundef nonnull @K)
  %85 = load i64, ptr @DynMemReadCount, align 8
  %86 = add i64 %85, 1
  store i64 %86, ptr @DynMemReadCount, align 8
  %87 = load i64, ptr %79, align 8, !tbaa !12
  %88 = load i64, ptr @DynALUCount, align 8
  %89 = add i64 %88, 1
  store i64 %89, ptr @DynALUCount, align 8
  %90 = add i64 %87, 1
  %91 = load i64, ptr @DynMemWriteCount, align 8
  %92 = add i64 %91, 1
  store i64 %92, ptr @DynMemWriteCount, align 8
  store i64 %90, ptr %79, align 8, !tbaa !12
  %93 = load i64, ptr @DynAddressMathCount, align 8
  %94 = add i64 %93, 1
  store i64 %94, ptr @DynAddressMathCount, align 8
  %95 = getelementptr inbounds nuw i8, ptr %84, i64 64
  %96 = load i64, ptr @DynALUCount, align 8
  %97 = add i64 %96, 1
  store i64 %97, ptr @DynALUCount, align 8
  %98 = add i64 %83, -64
  %99 = load i64, ptr @DynALUCount, align 8
  %100 = add i64 %99, 1
  store i64 %100, ptr @DynALUCount, align 8
  %101 = icmp ugt i64 %98, 63
  %102 = load i64, ptr @DynControlFlowCount, align 8
  %103 = add i64 %102, 1
  store i64 %103, ptr @DynControlFlowCount, align 8
  br i1 %101, label %82, label %104, !llvm.loop !16

104:                                              ; preds = %82, %68
  %105 = phi ptr [ %69, %68 ], [ %95, %82 ]
  %106 = phi i64 [ %70, %68 ], [ %98, %82 ]
  %107 = load i64, ptr @DynAddressMathCount, align 8
  %108 = add i64 %107, 1
  store i64 %108, ptr @DynAddressMathCount, align 8
  %109 = getelementptr inbounds nuw i8, ptr %0, i64 40
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %109, ptr align 1 %105, i64 %106, i1 false)
  %110 = load i64, ptr @DynCastCount, align 8
  %111 = add i64 %110, 1
  store i64 %111, ptr @DynCastCount, align 8
  %112 = trunc nuw nsw i64 %106 to i32
  %113 = load i64, ptr @DynControlFlowCount, align 8
  %114 = add i64 %113, 1
  store i64 %114, ptr @DynControlFlowCount, align 8
  br label %115

115:                                              ; preds = %104, %56
  %116 = phi i32 [ %65, %56 ], [ %112, %104 ]
  %117 = load i64, ptr @DynMemWriteCount, align 8
  %118 = add i64 %117, 1
  store i64 %118, ptr @DynMemWriteCount, align 8
  store i32 %116, ptr %6, align 8, !tbaa !15
  %119 = load i64, ptr @DynControlFlowCount, align 8
  %120 = add i64 %119, 1
  store i64 %120, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @sha256_digest(ptr noundef captures(none) %0, i64 noundef %1, ptr noundef writeonly captures(none) %2) #3 {
  %4 = load i64, ptr @DynALUCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynALUCount, align 8
  %6 = icmp ult i64 %1, 33
  %7 = load i64, ptr @DynControlFlowCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynControlFlowCount, align 8
  br i1 %6, label %12, label %9

9:                                                ; preds = %9, %3
  %10 = load i64, ptr @DynControlFlowCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynControlFlowCount, align 8
  br label %9

12:                                               ; preds = %3
  %13 = load i64, ptr @DynAddressMathCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynAddressMathCount, align 8
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 104
  %16 = load i64, ptr @DynMemReadCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynMemReadCount, align 8
  %18 = load i32, ptr %15, align 8, !tbaa !15
  %19 = load i64, ptr @DynALUCount, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr @DynALUCount, align 8
  %21 = icmp ult i32 %18, 64
  %22 = load i64, ptr @DynControlFlowCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynControlFlowCount, align 8
  br i1 %21, label %27, label %24

24:                                               ; preds = %24, %12
  %25 = load i64, ptr @DynControlFlowCount, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr @DynControlFlowCount, align 8
  br label %24

27:                                               ; preds = %12
  %28 = load i64, ptr @DynCastCount, align 8
  %29 = add i64 %28, 1
  store i64 %29, ptr @DynCastCount, align 8
  %30 = zext nneg i32 %18 to i64
  %31 = load i64, ptr @DynAddressMathCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynAddressMathCount, align 8
  %33 = getelementptr inbounds nuw i8, ptr %0, i64 40
  %34 = load i64, ptr @DynALUCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynALUCount, align 8
  %36 = add nuw nsw i32 %18, 1
  %37 = load i64, ptr @DynAddressMathCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynAddressMathCount, align 8
  %39 = getelementptr inbounds nuw i8, ptr %33, i64 %30
  %40 = load i64, ptr @DynMemWriteCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynMemWriteCount, align 8
  store i8 -128, ptr %39, align 1, !tbaa !17
  %42 = load i64, ptr @DynALUCount, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr @DynALUCount, align 8
  %44 = icmp samesign ugt i32 %18, 55
  %45 = load i64, ptr @DynControlFlowCount, align 8
  %46 = add i64 %45, 1
  store i64 %46, ptr @DynControlFlowCount, align 8
  br i1 %44, label %47, label %59

47:                                               ; preds = %27
  %48 = load i64, ptr @DynCastCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynCastCount, align 8
  %50 = zext nneg i32 %36 to i64
  %51 = load i64, ptr @DynAddressMathCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynAddressMathCount, align 8
  %53 = getelementptr inbounds nuw i8, ptr %33, i64 %50
  %54 = load i64, ptr @DynALUCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynALUCount, align 8
  %56 = sub nuw nsw i64 64, %50
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %53, i8 0, i64 %56, i1 false)
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %33, ptr noundef nonnull @K)
  %57 = load i64, ptr @DynControlFlowCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynControlFlowCount, align 8
  br label %59

59:                                               ; preds = %47, %27
  %60 = phi i32 [ 0, %47 ], [ %36, %27 ]
  %61 = load i64, ptr @DynCastCount, align 8
  %62 = add i64 %61, 1
  store i64 %62, ptr @DynCastCount, align 8
  %63 = zext nneg i32 %60 to i64
  %64 = load i64, ptr @DynAddressMathCount, align 8
  %65 = add i64 %64, 1
  store i64 %65, ptr @DynAddressMathCount, align 8
  %66 = getelementptr inbounds nuw i8, ptr %33, i64 %63
  %67 = load i64, ptr @DynALUCount, align 8
  %68 = add i64 %67, 1
  store i64 %68, ptr @DynALUCount, align 8
  %69 = sub nuw nsw i64 56, %63
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %66, i8 0, i64 %69, i1 false)
  %70 = load i64, ptr @DynAddressMathCount, align 8
  %71 = add i64 %70, 1
  store i64 %71, ptr @DynAddressMathCount, align 8
  %72 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %73 = load i64, ptr @DynMemReadCount, align 8
  %74 = add i64 %73, 1
  store i64 %74, ptr @DynMemReadCount, align 8
  %75 = load i64, ptr %72, align 8, !tbaa !12
  %76 = load i64, ptr @DynALUCount, align 8
  %77 = add i64 %76, 1
  store i64 %77, ptr @DynALUCount, align 8
  %78 = shl i64 %75, 9
  %79 = load i64, ptr @DynMemReadCount, align 8
  %80 = add i64 %79, 1
  store i64 %80, ptr @DynMemReadCount, align 8
  %81 = load i32, ptr %15, align 8, !tbaa !15
  %82 = load i64, ptr @DynALUCount, align 8
  %83 = add i64 %82, 1
  store i64 %83, ptr @DynALUCount, align 8
  %84 = shl i32 %81, 3
  %85 = load i64, ptr @DynCastCount, align 8
  %86 = add i64 %85, 1
  store i64 %86, ptr @DynCastCount, align 8
  %87 = zext i32 %84 to i64
  %88 = load i64, ptr @DynALUCount, align 8
  %89 = add i64 %88, 1
  store i64 %89, ptr @DynALUCount, align 8
  %90 = or i64 %78, %87
  %91 = load i64, ptr @DynALUCount, align 8
  %92 = add i64 %91, 1
  store i64 %92, ptr @DynALUCount, align 8
  %93 = lshr i64 %78, 56
  %94 = load i64, ptr @DynCastCount, align 8
  %95 = add i64 %94, 1
  store i64 %95, ptr @DynCastCount, align 8
  %96 = trunc nuw i64 %93 to i8
  %97 = load i64, ptr @DynAddressMathCount, align 8
  %98 = add i64 %97, 1
  store i64 %98, ptr @DynAddressMathCount, align 8
  %99 = getelementptr inbounds nuw i8, ptr %0, i64 96
  %100 = load i64, ptr @DynMemWriteCount, align 8
  %101 = add i64 %100, 1
  store i64 %101, ptr @DynMemWriteCount, align 8
  store i8 %96, ptr %99, align 8, !tbaa !17
  %102 = load i64, ptr @DynALUCount, align 8
  %103 = add i64 %102, 1
  store i64 %103, ptr @DynALUCount, align 8
  %104 = lshr i64 %78, 48
  %105 = load i64, ptr @DynCastCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynCastCount, align 8
  %107 = trunc i64 %104 to i8
  %108 = load i64, ptr @DynAddressMathCount, align 8
  %109 = add i64 %108, 1
  store i64 %109, ptr @DynAddressMathCount, align 8
  %110 = getelementptr inbounds nuw i8, ptr %0, i64 97
  %111 = load i64, ptr @DynMemWriteCount, align 8
  %112 = add i64 %111, 1
  store i64 %112, ptr @DynMemWriteCount, align 8
  store i8 %107, ptr %110, align 1, !tbaa !17
  %113 = load i64, ptr @DynALUCount, align 8
  %114 = add i64 %113, 1
  store i64 %114, ptr @DynALUCount, align 8
  %115 = lshr i64 %78, 40
  %116 = load i64, ptr @DynCastCount, align 8
  %117 = add i64 %116, 1
  store i64 %117, ptr @DynCastCount, align 8
  %118 = trunc i64 %115 to i8
  %119 = load i64, ptr @DynAddressMathCount, align 8
  %120 = add i64 %119, 1
  store i64 %120, ptr @DynAddressMathCount, align 8
  %121 = getelementptr inbounds nuw i8, ptr %0, i64 98
  %122 = load i64, ptr @DynMemWriteCount, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr @DynMemWriteCount, align 8
  store i8 %118, ptr %121, align 2, !tbaa !17
  %124 = load i64, ptr @DynALUCount, align 8
  %125 = add i64 %124, 1
  store i64 %125, ptr @DynALUCount, align 8
  %126 = lshr i64 %78, 32
  %127 = load i64, ptr @DynCastCount, align 8
  %128 = add i64 %127, 1
  store i64 %128, ptr @DynCastCount, align 8
  %129 = trunc i64 %126 to i8
  %130 = load i64, ptr @DynAddressMathCount, align 8
  %131 = add i64 %130, 1
  store i64 %131, ptr @DynAddressMathCount, align 8
  %132 = getelementptr inbounds nuw i8, ptr %0, i64 99
  %133 = load i64, ptr @DynMemWriteCount, align 8
  %134 = add i64 %133, 1
  store i64 %134, ptr @DynMemWriteCount, align 8
  store i8 %129, ptr %132, align 1, !tbaa !17
  %135 = load i64, ptr @DynALUCount, align 8
  %136 = add i64 %135, 1
  store i64 %136, ptr @DynALUCount, align 8
  %137 = lshr i64 %90, 24
  %138 = load i64, ptr @DynCastCount, align 8
  %139 = add i64 %138, 1
  store i64 %139, ptr @DynCastCount, align 8
  %140 = trunc i64 %137 to i8
  %141 = load i64, ptr @DynAddressMathCount, align 8
  %142 = add i64 %141, 1
  store i64 %142, ptr @DynAddressMathCount, align 8
  %143 = getelementptr inbounds nuw i8, ptr %0, i64 100
  %144 = load i64, ptr @DynMemWriteCount, align 8
  %145 = add i64 %144, 1
  store i64 %145, ptr @DynMemWriteCount, align 8
  store i8 %140, ptr %143, align 4, !tbaa !17
  %146 = load i64, ptr @DynALUCount, align 8
  %147 = add i64 %146, 1
  store i64 %147, ptr @DynALUCount, align 8
  %148 = lshr i64 %90, 16
  %149 = load i64, ptr @DynCastCount, align 8
  %150 = add i64 %149, 1
  store i64 %150, ptr @DynCastCount, align 8
  %151 = trunc i64 %148 to i8
  %152 = load i64, ptr @DynAddressMathCount, align 8
  %153 = add i64 %152, 1
  store i64 %153, ptr @DynAddressMathCount, align 8
  %154 = getelementptr inbounds nuw i8, ptr %0, i64 101
  %155 = load i64, ptr @DynMemWriteCount, align 8
  %156 = add i64 %155, 1
  store i64 %156, ptr @DynMemWriteCount, align 8
  store i8 %151, ptr %154, align 1, !tbaa !17
  %157 = load i64, ptr @DynALUCount, align 8
  %158 = add i64 %157, 1
  store i64 %158, ptr @DynALUCount, align 8
  %159 = lshr i64 %90, 8
  %160 = load i64, ptr @DynCastCount, align 8
  %161 = add i64 %160, 1
  store i64 %161, ptr @DynCastCount, align 8
  %162 = trunc i64 %159 to i8
  %163 = load i64, ptr @DynAddressMathCount, align 8
  %164 = add i64 %163, 1
  store i64 %164, ptr @DynAddressMathCount, align 8
  %165 = getelementptr inbounds nuw i8, ptr %0, i64 102
  %166 = load i64, ptr @DynMemWriteCount, align 8
  %167 = add i64 %166, 1
  store i64 %167, ptr @DynMemWriteCount, align 8
  store i8 %162, ptr %165, align 2, !tbaa !17
  %168 = load i64, ptr @DynCastCount, align 8
  %169 = add i64 %168, 1
  store i64 %169, ptr @DynCastCount, align 8
  %170 = trunc i32 %84 to i8
  %171 = load i64, ptr @DynAddressMathCount, align 8
  %172 = add i64 %171, 1
  store i64 %172, ptr @DynAddressMathCount, align 8
  %173 = getelementptr inbounds nuw i8, ptr %0, i64 103
  %174 = load i64, ptr @DynMemWriteCount, align 8
  %175 = add i64 %174, 1
  store i64 %175, ptr @DynMemWriteCount, align 8
  store i8 %170, ptr %173, align 1, !tbaa !17
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %33, ptr noundef nonnull @K)
  %176 = load i64, ptr @DynALUCount, align 8
  %177 = add i64 %176, 1
  store i64 %177, ptr @DynALUCount, align 8
  %178 = lshr i64 %1, 2
  %179 = load i64, ptr @DynCastCount, align 8
  %180 = add i64 %179, 1
  store i64 %180, ptr @DynCastCount, align 8
  %181 = trunc nuw nsw i64 %1 to i32
  %182 = load i64, ptr @DynALUCount, align 8
  %183 = add i64 %182, 1
  store i64 %183, ptr @DynALUCount, align 8
  %184 = and i32 %181, 3
  %185 = load i64, ptr @DynALUCount, align 8
  %186 = add i64 %185, 1
  store i64 %186, ptr @DynALUCount, align 8
  %187 = icmp eq i64 %178, 0
  %188 = load i64, ptr @DynControlFlowCount, align 8
  %189 = add i64 %188, 1
  store i64 %189, ptr @DynControlFlowCount, align 8
  br i1 %187, label %405, label %190

190:                                              ; preds = %59
  %191 = load i64, ptr @DynALUCount, align 8
  %192 = add i64 %191, 1
  store i64 %192, ptr @DynALUCount, align 8
  %193 = and i64 %178, 1
  %194 = load i64, ptr @DynALUCount, align 8
  %195 = add i64 %194, 1
  store i64 %195, ptr @DynALUCount, align 8
  %196 = icmp eq i64 %178, 1
  %197 = load i64, ptr @DynControlFlowCount, align 8
  %198 = add i64 %197, 1
  store i64 %198, ptr @DynControlFlowCount, align 8
  br i1 %196, label %341, label %199

199:                                              ; preds = %190
  %200 = load i64, ptr @DynALUCount, align 8
  %201 = add i64 %200, 1
  store i64 %201, ptr @DynALUCount, align 8
  %202 = and i64 %178, 14
  %203 = load i64, ptr @DynControlFlowCount, align 8
  %204 = add i64 %203, 1
  store i64 %204, ptr @DynControlFlowCount, align 8
  br label %205

205:                                              ; preds = %205, %199
  %206 = phi ptr [ %2, %199 ], [ %326, %205 ]
  %207 = phi i64 [ 0, %199 ], [ %323, %205 ]
  %208 = phi i64 [ 0, %199 ], [ %329, %205 ]
  %209 = load i64, ptr @DynAddressMathCount, align 8
  %210 = add i64 %209, 1
  store i64 %210, ptr @DynAddressMathCount, align 8
  %211 = getelementptr inbounds nuw i32, ptr %0, i64 %207
  %212 = load i64, ptr @DynMemReadCount, align 8
  %213 = add i64 %212, 1
  store i64 %213, ptr @DynMemReadCount, align 8
  %214 = load i32, ptr %211, align 4, !tbaa !1
  %215 = load i64, ptr @DynALUCount, align 8
  %216 = add i64 %215, 1
  store i64 %216, ptr @DynALUCount, align 8
  %217 = lshr i32 %214, 24
  %218 = load i64, ptr @DynCastCount, align 8
  %219 = add i64 %218, 1
  store i64 %219, ptr @DynCastCount, align 8
  %220 = trunc nuw i32 %217 to i8
  %221 = load i64, ptr @DynMemWriteCount, align 8
  %222 = add i64 %221, 1
  store i64 %222, ptr @DynMemWriteCount, align 8
  store i8 %220, ptr %206, align 1, !tbaa !17
  %223 = load i64, ptr @DynMemReadCount, align 8
  %224 = add i64 %223, 1
  store i64 %224, ptr @DynMemReadCount, align 8
  %225 = load i32, ptr %211, align 4, !tbaa !1
  %226 = load i64, ptr @DynALUCount, align 8
  %227 = add i64 %226, 1
  store i64 %227, ptr @DynALUCount, align 8
  %228 = lshr i32 %225, 16
  %229 = load i64, ptr @DynCastCount, align 8
  %230 = add i64 %229, 1
  store i64 %230, ptr @DynCastCount, align 8
  %231 = trunc i32 %228 to i8
  %232 = load i64, ptr @DynAddressMathCount, align 8
  %233 = add i64 %232, 1
  store i64 %233, ptr @DynAddressMathCount, align 8
  %234 = getelementptr inbounds nuw i8, ptr %206, i64 1
  %235 = load i64, ptr @DynMemWriteCount, align 8
  %236 = add i64 %235, 1
  store i64 %236, ptr @DynMemWriteCount, align 8
  store i8 %231, ptr %234, align 1, !tbaa !17
  %237 = load i64, ptr @DynMemReadCount, align 8
  %238 = add i64 %237, 1
  store i64 %238, ptr @DynMemReadCount, align 8
  %239 = load i32, ptr %211, align 4, !tbaa !1
  %240 = load i64, ptr @DynALUCount, align 8
  %241 = add i64 %240, 1
  store i64 %241, ptr @DynALUCount, align 8
  %242 = lshr i32 %239, 8
  %243 = load i64, ptr @DynCastCount, align 8
  %244 = add i64 %243, 1
  store i64 %244, ptr @DynCastCount, align 8
  %245 = trunc i32 %242 to i8
  %246 = load i64, ptr @DynAddressMathCount, align 8
  %247 = add i64 %246, 1
  store i64 %247, ptr @DynAddressMathCount, align 8
  %248 = getelementptr inbounds nuw i8, ptr %206, i64 2
  %249 = load i64, ptr @DynMemWriteCount, align 8
  %250 = add i64 %249, 1
  store i64 %250, ptr @DynMemWriteCount, align 8
  store i8 %245, ptr %248, align 1, !tbaa !17
  %251 = load i64, ptr @DynMemReadCount, align 8
  %252 = add i64 %251, 1
  store i64 %252, ptr @DynMemReadCount, align 8
  %253 = load i32, ptr %211, align 4, !tbaa !1
  %254 = load i64, ptr @DynCastCount, align 8
  %255 = add i64 %254, 1
  store i64 %255, ptr @DynCastCount, align 8
  %256 = trunc i32 %253 to i8
  %257 = load i64, ptr @DynAddressMathCount, align 8
  %258 = add i64 %257, 1
  store i64 %258, ptr @DynAddressMathCount, align 8
  %259 = getelementptr inbounds nuw i8, ptr %206, i64 3
  %260 = load i64, ptr @DynMemWriteCount, align 8
  %261 = add i64 %260, 1
  store i64 %261, ptr @DynMemWriteCount, align 8
  store i8 %256, ptr %259, align 1, !tbaa !17
  %262 = load i64, ptr @DynAddressMathCount, align 8
  %263 = add i64 %262, 1
  store i64 %263, ptr @DynAddressMathCount, align 8
  %264 = getelementptr inbounds nuw i8, ptr %206, i64 4
  %265 = load i64, ptr @DynAddressMathCount, align 8
  %266 = add i64 %265, 1
  store i64 %266, ptr @DynAddressMathCount, align 8
  %267 = getelementptr inbounds nuw i32, ptr %0, i64 %207
  %268 = load i64, ptr @DynAddressMathCount, align 8
  %269 = add i64 %268, 1
  store i64 %269, ptr @DynAddressMathCount, align 8
  %270 = getelementptr inbounds nuw i8, ptr %267, i64 4
  %271 = load i64, ptr @DynMemReadCount, align 8
  %272 = add i64 %271, 1
  store i64 %272, ptr @DynMemReadCount, align 8
  %273 = load i32, ptr %270, align 4, !tbaa !1
  %274 = load i64, ptr @DynALUCount, align 8
  %275 = add i64 %274, 1
  store i64 %275, ptr @DynALUCount, align 8
  %276 = lshr i32 %273, 24
  %277 = load i64, ptr @DynCastCount, align 8
  %278 = add i64 %277, 1
  store i64 %278, ptr @DynCastCount, align 8
  %279 = trunc nuw i32 %276 to i8
  %280 = load i64, ptr @DynMemWriteCount, align 8
  %281 = add i64 %280, 1
  store i64 %281, ptr @DynMemWriteCount, align 8
  store i8 %279, ptr %264, align 1, !tbaa !17
  %282 = load i64, ptr @DynMemReadCount, align 8
  %283 = add i64 %282, 1
  store i64 %283, ptr @DynMemReadCount, align 8
  %284 = load i32, ptr %270, align 4, !tbaa !1
  %285 = load i64, ptr @DynALUCount, align 8
  %286 = add i64 %285, 1
  store i64 %286, ptr @DynALUCount, align 8
  %287 = lshr i32 %284, 16
  %288 = load i64, ptr @DynCastCount, align 8
  %289 = add i64 %288, 1
  store i64 %289, ptr @DynCastCount, align 8
  %290 = trunc i32 %287 to i8
  %291 = load i64, ptr @DynAddressMathCount, align 8
  %292 = add i64 %291, 1
  store i64 %292, ptr @DynAddressMathCount, align 8
  %293 = getelementptr inbounds nuw i8, ptr %206, i64 5
  %294 = load i64, ptr @DynMemWriteCount, align 8
  %295 = add i64 %294, 1
  store i64 %295, ptr @DynMemWriteCount, align 8
  store i8 %290, ptr %293, align 1, !tbaa !17
  %296 = load i64, ptr @DynMemReadCount, align 8
  %297 = add i64 %296, 1
  store i64 %297, ptr @DynMemReadCount, align 8
  %298 = load i32, ptr %270, align 4, !tbaa !1
  %299 = load i64, ptr @DynALUCount, align 8
  %300 = add i64 %299, 1
  store i64 %300, ptr @DynALUCount, align 8
  %301 = lshr i32 %298, 8
  %302 = load i64, ptr @DynCastCount, align 8
  %303 = add i64 %302, 1
  store i64 %303, ptr @DynCastCount, align 8
  %304 = trunc i32 %301 to i8
  %305 = load i64, ptr @DynAddressMathCount, align 8
  %306 = add i64 %305, 1
  store i64 %306, ptr @DynAddressMathCount, align 8
  %307 = getelementptr inbounds nuw i8, ptr %206, i64 6
  %308 = load i64, ptr @DynMemWriteCount, align 8
  %309 = add i64 %308, 1
  store i64 %309, ptr @DynMemWriteCount, align 8
  store i8 %304, ptr %307, align 1, !tbaa !17
  %310 = load i64, ptr @DynMemReadCount, align 8
  %311 = add i64 %310, 1
  store i64 %311, ptr @DynMemReadCount, align 8
  %312 = load i32, ptr %270, align 4, !tbaa !1
  %313 = load i64, ptr @DynCastCount, align 8
  %314 = add i64 %313, 1
  store i64 %314, ptr @DynCastCount, align 8
  %315 = trunc i32 %312 to i8
  %316 = load i64, ptr @DynAddressMathCount, align 8
  %317 = add i64 %316, 1
  store i64 %317, ptr @DynAddressMathCount, align 8
  %318 = getelementptr inbounds nuw i8, ptr %206, i64 7
  %319 = load i64, ptr @DynMemWriteCount, align 8
  %320 = add i64 %319, 1
  store i64 %320, ptr @DynMemWriteCount, align 8
  store i8 %315, ptr %318, align 1, !tbaa !17
  %321 = load i64, ptr @DynALUCount, align 8
  %322 = add i64 %321, 1
  store i64 %322, ptr @DynALUCount, align 8
  %323 = add nuw nsw i64 %207, 2
  %324 = load i64, ptr @DynAddressMathCount, align 8
  %325 = add i64 %324, 1
  store i64 %325, ptr @DynAddressMathCount, align 8
  %326 = getelementptr inbounds nuw i8, ptr %206, i64 8
  %327 = load i64, ptr @DynALUCount, align 8
  %328 = add i64 %327, 1
  store i64 %328, ptr @DynALUCount, align 8
  %329 = add i64 %208, 2
  %330 = load i64, ptr @DynALUCount, align 8
  %331 = add i64 %330, 1
  store i64 %331, ptr @DynALUCount, align 8
  %332 = icmp eq i64 %329, %202
  %333 = load i64, ptr @DynControlFlowCount, align 8
  %334 = add i64 %333, 1
  store i64 %334, ptr @DynControlFlowCount, align 8
  br i1 %332, label %335, label %205, !llvm.loop !18

335:                                              ; preds = %205
  %336 = load i64, ptr @DynALUCount, align 8
  %337 = add i64 %336, 1
  store i64 %337, ptr @DynALUCount, align 8
  %338 = icmp eq i64 %193, 0
  %339 = load i64, ptr @DynControlFlowCount, align 8
  %340 = add i64 %339, 1
  store i64 %340, ptr @DynControlFlowCount, align 8
  br i1 %338, label %405, label %341

341:                                              ; preds = %335, %190
  %342 = phi ptr [ %2, %190 ], [ %326, %335 ]
  %343 = phi i64 [ 0, %190 ], [ %323, %335 ]
  %344 = load i64, ptr @DynALUCount, align 8
  %345 = add i64 %344, 1
  store i64 %345, ptr @DynALUCount, align 8
  %346 = icmp ne i64 %193, 0
  tail call void @llvm.assume(i1 %346)
  %347 = load i64, ptr @DynAddressMathCount, align 8
  %348 = add i64 %347, 1
  store i64 %348, ptr @DynAddressMathCount, align 8
  %349 = getelementptr inbounds nuw i32, ptr %0, i64 %343
  %350 = load i64, ptr @DynMemReadCount, align 8
  %351 = add i64 %350, 1
  store i64 %351, ptr @DynMemReadCount, align 8
  %352 = load i32, ptr %349, align 4, !tbaa !1
  %353 = load i64, ptr @DynALUCount, align 8
  %354 = add i64 %353, 1
  store i64 %354, ptr @DynALUCount, align 8
  %355 = lshr i32 %352, 24
  %356 = load i64, ptr @DynCastCount, align 8
  %357 = add i64 %356, 1
  store i64 %357, ptr @DynCastCount, align 8
  %358 = trunc nuw i32 %355 to i8
  %359 = load i64, ptr @DynMemWriteCount, align 8
  %360 = add i64 %359, 1
  store i64 %360, ptr @DynMemWriteCount, align 8
  store i8 %358, ptr %342, align 1, !tbaa !17
  %361 = load i64, ptr @DynMemReadCount, align 8
  %362 = add i64 %361, 1
  store i64 %362, ptr @DynMemReadCount, align 8
  %363 = load i32, ptr %349, align 4, !tbaa !1
  %364 = load i64, ptr @DynALUCount, align 8
  %365 = add i64 %364, 1
  store i64 %365, ptr @DynALUCount, align 8
  %366 = lshr i32 %363, 16
  %367 = load i64, ptr @DynCastCount, align 8
  %368 = add i64 %367, 1
  store i64 %368, ptr @DynCastCount, align 8
  %369 = trunc i32 %366 to i8
  %370 = load i64, ptr @DynAddressMathCount, align 8
  %371 = add i64 %370, 1
  store i64 %371, ptr @DynAddressMathCount, align 8
  %372 = getelementptr inbounds nuw i8, ptr %342, i64 1
  %373 = load i64, ptr @DynMemWriteCount, align 8
  %374 = add i64 %373, 1
  store i64 %374, ptr @DynMemWriteCount, align 8
  store i8 %369, ptr %372, align 1, !tbaa !17
  %375 = load i64, ptr @DynMemReadCount, align 8
  %376 = add i64 %375, 1
  store i64 %376, ptr @DynMemReadCount, align 8
  %377 = load i32, ptr %349, align 4, !tbaa !1
  %378 = load i64, ptr @DynALUCount, align 8
  %379 = add i64 %378, 1
  store i64 %379, ptr @DynALUCount, align 8
  %380 = lshr i32 %377, 8
  %381 = load i64, ptr @DynCastCount, align 8
  %382 = add i64 %381, 1
  store i64 %382, ptr @DynCastCount, align 8
  %383 = trunc i32 %380 to i8
  %384 = load i64, ptr @DynAddressMathCount, align 8
  %385 = add i64 %384, 1
  store i64 %385, ptr @DynAddressMathCount, align 8
  %386 = getelementptr inbounds nuw i8, ptr %342, i64 2
  %387 = load i64, ptr @DynMemWriteCount, align 8
  %388 = add i64 %387, 1
  store i64 %388, ptr @DynMemWriteCount, align 8
  store i8 %383, ptr %386, align 1, !tbaa !17
  %389 = load i64, ptr @DynMemReadCount, align 8
  %390 = add i64 %389, 1
  store i64 %390, ptr @DynMemReadCount, align 8
  %391 = load i32, ptr %349, align 4, !tbaa !1
  %392 = load i64, ptr @DynCastCount, align 8
  %393 = add i64 %392, 1
  store i64 %393, ptr @DynCastCount, align 8
  %394 = trunc i32 %391 to i8
  %395 = load i64, ptr @DynAddressMathCount, align 8
  %396 = add i64 %395, 1
  store i64 %396, ptr @DynAddressMathCount, align 8
  %397 = getelementptr inbounds nuw i8, ptr %342, i64 3
  %398 = load i64, ptr @DynMemWriteCount, align 8
  %399 = add i64 %398, 1
  store i64 %399, ptr @DynMemWriteCount, align 8
  store i8 %394, ptr %397, align 1, !tbaa !17
  %400 = load i64, ptr @DynAddressMathCount, align 8
  %401 = add i64 %400, 1
  store i64 %401, ptr @DynAddressMathCount, align 8
  %402 = getelementptr inbounds nuw i8, ptr %342, i64 4
  %403 = load i64, ptr @DynControlFlowCount, align 8
  %404 = add i64 %403, 1
  store i64 %404, ptr @DynControlFlowCount, align 8
  br label %405

405:                                              ; preds = %341, %335, %59
  %406 = phi ptr [ %2, %59 ], [ %326, %335 ], [ %402, %341 ]
  %407 = load i64, ptr @DynALUCount, align 8
  %408 = add i64 %407, 1
  store i64 %408, ptr @DynALUCount, align 8
  %409 = icmp eq i32 %184, 0
  %410 = load i64, ptr @DynControlFlowCount, align 8
  %411 = add i64 %410, 1
  store i64 %411, ptr @DynControlFlowCount, align 8
  br i1 %409, label %469, label %412

412:                                              ; preds = %405
  %413 = load i64, ptr @DynAddressMathCount, align 8
  %414 = add i64 %413, 1
  store i64 %414, ptr @DynAddressMathCount, align 8
  %415 = getelementptr inbounds nuw i32, ptr %0, i64 %178
  %416 = load i64, ptr @DynMemReadCount, align 8
  %417 = add i64 %416, 1
  store i64 %417, ptr @DynMemReadCount, align 8
  %418 = load i32, ptr %415, align 4, !tbaa !1
  %419 = load i64, ptr @DynControlFlowCount, align 8
  %420 = add i64 %419, 1
  store i64 %420, ptr @DynControlFlowCount, align 8
  switch i32 %184, label %421 [
    i32 3, label %424
    i32 2, label %444
    i32 1, label %458
  ]

421:                                              ; preds = %412
  %422 = load i64, ptr @DynControlFlowCount, align 8
  %423 = add i64 %422, 1
  store i64 %423, ptr @DynControlFlowCount, align 8
  unreachable

424:                                              ; preds = %412
  %425 = load i64, ptr @DynALUCount, align 8
  %426 = add i64 %425, 1
  store i64 %426, ptr @DynALUCount, align 8
  %427 = lshr i32 %418, 8
  %428 = load i64, ptr @DynCastCount, align 8
  %429 = add i64 %428, 1
  store i64 %429, ptr @DynCastCount, align 8
  %430 = trunc i32 %427 to i8
  %431 = load i64, ptr @DynALUCount, align 8
  %432 = add i64 %431, 1
  store i64 %432, ptr @DynALUCount, align 8
  %433 = and i64 %1, 3
  %434 = load i64, ptr @DynAddressMathCount, align 8
  %435 = add i64 %434, 1
  store i64 %435, ptr @DynAddressMathCount, align 8
  %436 = getelementptr i8, ptr %406, i64 %433
  %437 = load i64, ptr @DynAddressMathCount, align 8
  %438 = add i64 %437, 1
  store i64 %438, ptr @DynAddressMathCount, align 8
  %439 = getelementptr i8, ptr %436, i64 -1
  %440 = load i64, ptr @DynMemWriteCount, align 8
  %441 = add i64 %440, 1
  store i64 %441, ptr @DynMemWriteCount, align 8
  store i8 %430, ptr %439, align 1, !tbaa !17
  %442 = load i64, ptr @DynControlFlowCount, align 8
  %443 = add i64 %442, 1
  store i64 %443, ptr @DynControlFlowCount, align 8
  br label %444

444:                                              ; preds = %424, %412
  %445 = load i64, ptr @DynALUCount, align 8
  %446 = add i64 %445, 1
  store i64 %446, ptr @DynALUCount, align 8
  %447 = lshr i32 %418, 16
  %448 = load i64, ptr @DynCastCount, align 8
  %449 = add i64 %448, 1
  store i64 %449, ptr @DynCastCount, align 8
  %450 = trunc i32 %447 to i8
  %451 = load i64, ptr @DynAddressMathCount, align 8
  %452 = add i64 %451, 1
  store i64 %452, ptr @DynAddressMathCount, align 8
  %453 = getelementptr inbounds nuw i8, ptr %406, i64 1
  %454 = load i64, ptr @DynMemWriteCount, align 8
  %455 = add i64 %454, 1
  store i64 %455, ptr @DynMemWriteCount, align 8
  store i8 %450, ptr %453, align 1, !tbaa !17
  %456 = load i64, ptr @DynControlFlowCount, align 8
  %457 = add i64 %456, 1
  store i64 %457, ptr @DynControlFlowCount, align 8
  br label %458

458:                                              ; preds = %444, %412
  %459 = load i64, ptr @DynALUCount, align 8
  %460 = add i64 %459, 1
  store i64 %460, ptr @DynALUCount, align 8
  %461 = lshr i32 %418, 24
  %462 = load i64, ptr @DynCastCount, align 8
  %463 = add i64 %462, 1
  store i64 %463, ptr @DynCastCount, align 8
  %464 = trunc nuw i32 %461 to i8
  %465 = load i64, ptr @DynMemWriteCount, align 8
  %466 = add i64 %465, 1
  store i64 %466, ptr @DynMemWriteCount, align 8
  store i8 %464, ptr %406, align 1, !tbaa !17
  %467 = load i64, ptr @DynControlFlowCount, align 8
  %468 = add i64 %467, 1
  store i64 %468, ptr @DynControlFlowCount, align 8
  br label %469

469:                                              ; preds = %458, %405
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  %470 = load i64, ptr @DynMemWriteCount, align 8
  %471 = add i64 %470, 1
  store i64 %471, ptr @DynMemWriteCount, align 8
  store i64 0, ptr %72, align 8, !tbaa !12
  %472 = load i64, ptr @DynMemWriteCount, align 8
  %473 = add i64 %472, 1
  store i64 %473, ptr @DynMemWriteCount, align 8
  store i32 0, ptr %15, align 8, !tbaa !15
  %474 = load i64, ptr @DynControlFlowCount, align 8
  %475 = add i64 %474, 1
  store i64 %475, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #4

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @_nettle_sha256_compress(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2) local_unnamed_addr #3 {
  %4 = alloca [16 x i32], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #17
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  br label %7

7:                                                ; preds = %7, %3
  %8 = phi i64 [ 0, %3 ], [ %130, %7 ]
  %9 = phi ptr [ %1, %3 ], [ %133, %7 ]
  %10 = load i64, ptr @DynMemReadCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynMemReadCount, align 8
  %12 = load i8, ptr %9, align 1, !tbaa !17
  %13 = load i64, ptr @DynCastCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynCastCount, align 8
  %15 = zext i8 %12 to i32
  %16 = load i64, ptr @DynALUCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynALUCount, align 8
  %18 = shl nuw i32 %15, 24
  %19 = load i64, ptr @DynAddressMathCount, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr @DynAddressMathCount, align 8
  %21 = getelementptr inbounds nuw i8, ptr %9, i64 1
  %22 = load i64, ptr @DynMemReadCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynMemReadCount, align 8
  %24 = load i8, ptr %21, align 1, !tbaa !17
  %25 = load i64, ptr @DynCastCount, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr @DynCastCount, align 8
  %27 = zext i8 %24 to i32
  %28 = load i64, ptr @DynALUCount, align 8
  %29 = add i64 %28, 1
  store i64 %29, ptr @DynALUCount, align 8
  %30 = shl nuw nsw i32 %27, 16
  %31 = load i64, ptr @DynALUCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynALUCount, align 8
  %33 = or disjoint i32 %30, %18
  %34 = load i64, ptr @DynAddressMathCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynAddressMathCount, align 8
  %36 = getelementptr inbounds nuw i8, ptr %9, i64 2
  %37 = load i64, ptr @DynMemReadCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynMemReadCount, align 8
  %39 = load i8, ptr %36, align 1, !tbaa !17
  %40 = load i64, ptr @DynCastCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynCastCount, align 8
  %42 = zext i8 %39 to i32
  %43 = load i64, ptr @DynALUCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynALUCount, align 8
  %45 = shl nuw nsw i32 %42, 8
  %46 = load i64, ptr @DynALUCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynALUCount, align 8
  %48 = or disjoint i32 %33, %45
  %49 = load i64, ptr @DynAddressMathCount, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr @DynAddressMathCount, align 8
  %51 = getelementptr inbounds nuw i8, ptr %9, i64 3
  %52 = load i64, ptr @DynMemReadCount, align 8
  %53 = add i64 %52, 1
  store i64 %53, ptr @DynMemReadCount, align 8
  %54 = load i8, ptr %51, align 1, !tbaa !17
  %55 = load i64, ptr @DynCastCount, align 8
  %56 = add i64 %55, 1
  store i64 %56, ptr @DynCastCount, align 8
  %57 = zext i8 %54 to i32
  %58 = load i64, ptr @DynALUCount, align 8
  %59 = add i64 %58, 1
  store i64 %59, ptr @DynALUCount, align 8
  %60 = or disjoint i32 %48, %57
  %61 = load i64, ptr @DynAddressMathCount, align 8
  %62 = add i64 %61, 1
  store i64 %62, ptr @DynAddressMathCount, align 8
  %63 = getelementptr inbounds nuw i32, ptr %4, i64 %8
  %64 = load i64, ptr @DynMemWriteCount, align 8
  %65 = add i64 %64, 1
  store i64 %65, ptr @DynMemWriteCount, align 8
  store i32 %60, ptr %63, align 8, !tbaa !1
  %66 = load i64, ptr @DynAddressMathCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynAddressMathCount, align 8
  %68 = getelementptr inbounds nuw i8, ptr %9, i64 4
  %69 = load i64, ptr @DynMemReadCount, align 8
  %70 = add i64 %69, 1
  store i64 %70, ptr @DynMemReadCount, align 8
  %71 = load i8, ptr %68, align 1, !tbaa !17
  %72 = load i64, ptr @DynCastCount, align 8
  %73 = add i64 %72, 1
  store i64 %73, ptr @DynCastCount, align 8
  %74 = zext i8 %71 to i32
  %75 = load i64, ptr @DynALUCount, align 8
  %76 = add i64 %75, 1
  store i64 %76, ptr @DynALUCount, align 8
  %77 = shl nuw i32 %74, 24
  %78 = load i64, ptr @DynAddressMathCount, align 8
  %79 = add i64 %78, 1
  store i64 %79, ptr @DynAddressMathCount, align 8
  %80 = getelementptr inbounds nuw i8, ptr %9, i64 5
  %81 = load i64, ptr @DynMemReadCount, align 8
  %82 = add i64 %81, 1
  store i64 %82, ptr @DynMemReadCount, align 8
  %83 = load i8, ptr %80, align 1, !tbaa !17
  %84 = load i64, ptr @DynCastCount, align 8
  %85 = add i64 %84, 1
  store i64 %85, ptr @DynCastCount, align 8
  %86 = zext i8 %83 to i32
  %87 = load i64, ptr @DynALUCount, align 8
  %88 = add i64 %87, 1
  store i64 %88, ptr @DynALUCount, align 8
  %89 = shl nuw nsw i32 %86, 16
  %90 = load i64, ptr @DynALUCount, align 8
  %91 = add i64 %90, 1
  store i64 %91, ptr @DynALUCount, align 8
  %92 = or disjoint i32 %89, %77
  %93 = load i64, ptr @DynAddressMathCount, align 8
  %94 = add i64 %93, 1
  store i64 %94, ptr @DynAddressMathCount, align 8
  %95 = getelementptr inbounds nuw i8, ptr %9, i64 6
  %96 = load i64, ptr @DynMemReadCount, align 8
  %97 = add i64 %96, 1
  store i64 %97, ptr @DynMemReadCount, align 8
  %98 = load i8, ptr %95, align 1, !tbaa !17
  %99 = load i64, ptr @DynCastCount, align 8
  %100 = add i64 %99, 1
  store i64 %100, ptr @DynCastCount, align 8
  %101 = zext i8 %98 to i32
  %102 = load i64, ptr @DynALUCount, align 8
  %103 = add i64 %102, 1
  store i64 %103, ptr @DynALUCount, align 8
  %104 = shl nuw nsw i32 %101, 8
  %105 = load i64, ptr @DynALUCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynALUCount, align 8
  %107 = or disjoint i32 %92, %104
  %108 = load i64, ptr @DynAddressMathCount, align 8
  %109 = add i64 %108, 1
  store i64 %109, ptr @DynAddressMathCount, align 8
  %110 = getelementptr inbounds nuw i8, ptr %9, i64 7
  %111 = load i64, ptr @DynMemReadCount, align 8
  %112 = add i64 %111, 1
  store i64 %112, ptr @DynMemReadCount, align 8
  %113 = load i8, ptr %110, align 1, !tbaa !17
  %114 = load i64, ptr @DynCastCount, align 8
  %115 = add i64 %114, 1
  store i64 %115, ptr @DynCastCount, align 8
  %116 = zext i8 %113 to i32
  %117 = load i64, ptr @DynALUCount, align 8
  %118 = add i64 %117, 1
  store i64 %118, ptr @DynALUCount, align 8
  %119 = or disjoint i32 %107, %116
  %120 = load i64, ptr @DynAddressMathCount, align 8
  %121 = add i64 %120, 1
  store i64 %121, ptr @DynAddressMathCount, align 8
  %122 = getelementptr inbounds nuw i32, ptr %4, i64 %8
  %123 = load i64, ptr @DynAddressMathCount, align 8
  %124 = add i64 %123, 1
  store i64 %124, ptr @DynAddressMathCount, align 8
  %125 = getelementptr inbounds nuw i8, ptr %122, i64 4
  %126 = load i64, ptr @DynMemWriteCount, align 8
  %127 = add i64 %126, 1
  store i64 %127, ptr @DynMemWriteCount, align 8
  store i32 %119, ptr %125, align 4, !tbaa !1
  %128 = load i64, ptr @DynALUCount, align 8
  %129 = add i64 %128, 1
  store i64 %129, ptr @DynALUCount, align 8
  %130 = add nuw nsw i64 %8, 2
  %131 = load i64, ptr @DynAddressMathCount, align 8
  %132 = add i64 %131, 1
  store i64 %132, ptr @DynAddressMathCount, align 8
  %133 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %134 = load i64, ptr @DynALUCount, align 8
  %135 = add i64 %134, 1
  store i64 %135, ptr @DynALUCount, align 8
  %136 = icmp eq i64 %130, 16
  %137 = load i64, ptr @DynControlFlowCount, align 8
  %138 = add i64 %137, 1
  store i64 %138, ptr @DynControlFlowCount, align 8
  br i1 %136, label %139, label %7, !llvm.loop !19

139:                                              ; preds = %7
  %140 = load i64, ptr @DynMemReadCount, align 8
  %141 = add i64 %140, 1
  store i64 %141, ptr @DynMemReadCount, align 8
  %142 = load i32, ptr %0, align 4, !tbaa !1
  %143 = load i64, ptr @DynAddressMathCount, align 8
  %144 = add i64 %143, 1
  store i64 %144, ptr @DynAddressMathCount, align 8
  %145 = getelementptr inbounds nuw i8, ptr %0, i64 4
  %146 = load i64, ptr @DynMemReadCount, align 8
  %147 = add i64 %146, 1
  store i64 %147, ptr @DynMemReadCount, align 8
  %148 = load i32, ptr %145, align 4, !tbaa !1
  %149 = load i64, ptr @DynAddressMathCount, align 8
  %150 = add i64 %149, 1
  store i64 %150, ptr @DynAddressMathCount, align 8
  %151 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %152 = load i64, ptr @DynMemReadCount, align 8
  %153 = add i64 %152, 1
  store i64 %153, ptr @DynMemReadCount, align 8
  %154 = load i32, ptr %151, align 4, !tbaa !1
  %155 = load i64, ptr @DynAddressMathCount, align 8
  %156 = add i64 %155, 1
  store i64 %156, ptr @DynAddressMathCount, align 8
  %157 = getelementptr inbounds nuw i8, ptr %0, i64 12
  %158 = load i64, ptr @DynMemReadCount, align 8
  %159 = add i64 %158, 1
  store i64 %159, ptr @DynMemReadCount, align 8
  %160 = load i32, ptr %157, align 4, !tbaa !1
  %161 = load i64, ptr @DynAddressMathCount, align 8
  %162 = add i64 %161, 1
  store i64 %162, ptr @DynAddressMathCount, align 8
  %163 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %164 = load i64, ptr @DynMemReadCount, align 8
  %165 = add i64 %164, 1
  store i64 %165, ptr @DynMemReadCount, align 8
  %166 = load i32, ptr %163, align 4, !tbaa !1
  %167 = load i64, ptr @DynAddressMathCount, align 8
  %168 = add i64 %167, 1
  store i64 %168, ptr @DynAddressMathCount, align 8
  %169 = getelementptr inbounds nuw i8, ptr %0, i64 20
  %170 = load i64, ptr @DynMemReadCount, align 8
  %171 = add i64 %170, 1
  store i64 %171, ptr @DynMemReadCount, align 8
  %172 = load i32, ptr %169, align 4, !tbaa !1
  %173 = load i64, ptr @DynAddressMathCount, align 8
  %174 = add i64 %173, 1
  store i64 %174, ptr @DynAddressMathCount, align 8
  %175 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %176 = load i64, ptr @DynMemReadCount, align 8
  %177 = add i64 %176, 1
  store i64 %177, ptr @DynMemReadCount, align 8
  %178 = load i32, ptr %175, align 4, !tbaa !1
  %179 = load i64, ptr @DynAddressMathCount, align 8
  %180 = add i64 %179, 1
  store i64 %180, ptr @DynAddressMathCount, align 8
  %181 = getelementptr inbounds nuw i8, ptr %0, i64 28
  %182 = load i64, ptr @DynMemReadCount, align 8
  %183 = add i64 %182, 1
  store i64 %183, ptr @DynMemReadCount, align 8
  %184 = load i32, ptr %181, align 4, !tbaa !1
  %185 = load i64, ptr @DynControlFlowCount, align 8
  %186 = add i64 %185, 1
  store i64 %186, ptr @DynControlFlowCount, align 8
  br label %283

187:                                              ; preds = %283
  %188 = load i64, ptr @DynMemReadCount, align 8
  %189 = add i64 %188, 1
  store i64 %189, ptr @DynMemReadCount, align 8
  %190 = load i32, ptr %4, align 16
  %191 = load i64, ptr @DynAddressMathCount, align 8
  %192 = add i64 %191, 1
  store i64 %192, ptr @DynAddressMathCount, align 8
  %193 = getelementptr inbounds nuw i8, ptr %4, i64 56
  %194 = load i64, ptr @DynAddressMathCount, align 8
  %195 = add i64 %194, 1
  store i64 %195, ptr @DynAddressMathCount, align 8
  %196 = getelementptr inbounds nuw i8, ptr %4, i64 36
  %197 = load i64, ptr @DynAddressMathCount, align 8
  %198 = add i64 %197, 1
  store i64 %198, ptr @DynAddressMathCount, align 8
  %199 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %200 = load i64, ptr @DynAddressMathCount, align 8
  %201 = add i64 %200, 1
  store i64 %201, ptr @DynAddressMathCount, align 8
  %202 = getelementptr inbounds nuw i8, ptr %4, i64 60
  %203 = load i64, ptr @DynAddressMathCount, align 8
  %204 = add i64 %203, 1
  store i64 %204, ptr @DynAddressMathCount, align 8
  %205 = getelementptr inbounds nuw i8, ptr %4, i64 40
  %206 = load i64, ptr @DynAddressMathCount, align 8
  %207 = add i64 %206, 1
  store i64 %207, ptr @DynAddressMathCount, align 8
  %208 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %209 = load i64, ptr @DynAddressMathCount, align 8
  %210 = add i64 %209, 1
  store i64 %210, ptr @DynAddressMathCount, align 8
  %211 = getelementptr inbounds nuw i8, ptr %4, i64 44
  %212 = load i64, ptr @DynAddressMathCount, align 8
  %213 = add i64 %212, 1
  store i64 %213, ptr @DynAddressMathCount, align 8
  %214 = getelementptr inbounds nuw i8, ptr %4, i64 12
  %215 = load i64, ptr @DynAddressMathCount, align 8
  %216 = add i64 %215, 1
  store i64 %216, ptr @DynAddressMathCount, align 8
  %217 = getelementptr inbounds nuw i8, ptr %4, i64 48
  %218 = load i64, ptr @DynAddressMathCount, align 8
  %219 = add i64 %218, 1
  store i64 %219, ptr @DynAddressMathCount, align 8
  %220 = getelementptr inbounds nuw i8, ptr %4, i64 16
  %221 = load i64, ptr @DynAddressMathCount, align 8
  %222 = add i64 %221, 1
  store i64 %222, ptr @DynAddressMathCount, align 8
  %223 = getelementptr inbounds nuw i8, ptr %4, i64 52
  %224 = load i64, ptr @DynAddressMathCount, align 8
  %225 = add i64 %224, 1
  store i64 %225, ptr @DynAddressMathCount, align 8
  %226 = getelementptr inbounds nuw i8, ptr %4, i64 20
  %227 = load i64, ptr @DynAddressMathCount, align 8
  %228 = add i64 %227, 1
  store i64 %228, ptr @DynAddressMathCount, align 8
  %229 = getelementptr inbounds nuw i8, ptr %4, i64 24
  %230 = load i64, ptr @DynAddressMathCount, align 8
  %231 = add i64 %230, 1
  store i64 %231, ptr @DynAddressMathCount, align 8
  %232 = getelementptr inbounds nuw i8, ptr %4, i64 28
  %233 = load i64, ptr @DynAddressMathCount, align 8
  %234 = add i64 %233, 1
  store i64 %234, ptr @DynAddressMathCount, align 8
  %235 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %236 = load i64, ptr @DynMemReadCount, align 8
  %237 = add i64 %236, 1
  store i64 %237, ptr @DynMemReadCount, align 8
  %238 = load i32, ptr %193, align 8, !tbaa !1
  %239 = load i64, ptr @DynMemReadCount, align 8
  %240 = add i64 %239, 1
  store i64 %240, ptr @DynMemReadCount, align 8
  %241 = load i32, ptr %196, align 4, !tbaa !1
  %242 = load i64, ptr @DynMemReadCount, align 8
  %243 = add i64 %242, 1
  store i64 %243, ptr @DynMemReadCount, align 8
  %244 = load i32, ptr %199, align 4, !tbaa !1
  %245 = load i64, ptr @DynMemReadCount, align 8
  %246 = add i64 %245, 1
  store i64 %246, ptr @DynMemReadCount, align 8
  %247 = load i32, ptr %202, align 4, !tbaa !1
  %248 = load i64, ptr @DynMemReadCount, align 8
  %249 = add i64 %248, 1
  store i64 %249, ptr @DynMemReadCount, align 8
  %250 = load i32, ptr %205, align 8, !tbaa !1
  %251 = load i64, ptr @DynMemReadCount, align 8
  %252 = add i64 %251, 1
  store i64 %252, ptr @DynMemReadCount, align 8
  %253 = load i32, ptr %208, align 8, !tbaa !1
  %254 = load i64, ptr @DynMemReadCount, align 8
  %255 = add i64 %254, 1
  store i64 %255, ptr @DynMemReadCount, align 8
  %256 = load i32, ptr %211, align 4, !tbaa !1
  %257 = load i64, ptr @DynMemReadCount, align 8
  %258 = add i64 %257, 1
  store i64 %258, ptr @DynMemReadCount, align 8
  %259 = load i32, ptr %214, align 4, !tbaa !1
  %260 = load i64, ptr @DynMemReadCount, align 8
  %261 = add i64 %260, 1
  store i64 %261, ptr @DynMemReadCount, align 8
  %262 = load i32, ptr %217, align 16, !tbaa !1
  %263 = load i64, ptr @DynMemReadCount, align 8
  %264 = add i64 %263, 1
  store i64 %264, ptr @DynMemReadCount, align 8
  %265 = load i32, ptr %220, align 16, !tbaa !1
  %266 = load i64, ptr @DynMemReadCount, align 8
  %267 = add i64 %266, 1
  store i64 %267, ptr @DynMemReadCount, align 8
  %268 = load i32, ptr %223, align 4, !tbaa !1
  %269 = load i64, ptr @DynMemReadCount, align 8
  %270 = add i64 %269, 1
  store i64 %270, ptr @DynMemReadCount, align 8
  %271 = load i32, ptr %226, align 4, !tbaa !1
  %272 = load i64, ptr @DynMemReadCount, align 8
  %273 = add i64 %272, 1
  store i64 %273, ptr @DynMemReadCount, align 8
  %274 = load i32, ptr %229, align 8, !tbaa !1
  %275 = load i64, ptr @DynMemReadCount, align 8
  %276 = add i64 %275, 1
  store i64 %276, ptr @DynMemReadCount, align 8
  %277 = load i32, ptr %232, align 4, !tbaa !1
  %278 = load i64, ptr @DynMemReadCount, align 8
  %279 = add i64 %278, 1
  store i64 %279, ptr @DynMemReadCount, align 8
  %280 = load i32, ptr %235, align 16, !tbaa !1
  %281 = load i64, ptr @DynControlFlowCount, align 8
  %282 = add i64 %281, 1
  store i64 %282, ptr @DynControlFlowCount, align 8
  br label %873

283:                                              ; preds = %283, %139
  %284 = phi ptr [ %4, %139 ], [ %870, %283 ]
  %285 = phi i1 [ true, %139 ], [ false, %283 ]
  %286 = phi i32 [ %184, %139 ], [ %621, %283 ]
  %287 = phi i32 [ %178, %139 ], [ %693, %283 ]
  %288 = phi i32 [ %172, %139 ], [ %765, %283 ]
  %289 = phi i32 [ %166, %139 ], [ %837, %283 ]
  %290 = phi i32 [ %160, %139 ], [ %648, %283 ]
  %291 = phi i32 [ %154, %139 ], [ %720, %283 ]
  %292 = phi i32 [ %148, %139 ], [ %792, %283 ]
  %293 = phi i32 [ %142, %139 ], [ %864, %283 ]
  %294 = phi ptr [ %2, %139 ], [ %867, %283 ]
  %295 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 26)
  %296 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 21)
  %297 = load i64, ptr @DynALUCount, align 8
  %298 = add i64 %297, 1
  store i64 %298, ptr @DynALUCount, align 8
  %299 = xor i32 %295, %296
  %300 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 7)
  %301 = load i64, ptr @DynALUCount, align 8
  %302 = add i64 %301, 1
  store i64 %302, ptr @DynALUCount, align 8
  %303 = xor i32 %299, %300
  %304 = load i64, ptr @DynALUCount, align 8
  %305 = add i64 %304, 1
  store i64 %305, ptr @DynALUCount, align 8
  %306 = xor i32 %287, %288
  %307 = load i64, ptr @DynALUCount, align 8
  %308 = add i64 %307, 1
  store i64 %308, ptr @DynALUCount, align 8
  %309 = and i32 %306, %289
  %310 = load i64, ptr @DynALUCount, align 8
  %311 = add i64 %310, 1
  store i64 %311, ptr @DynALUCount, align 8
  %312 = xor i32 %309, %287
  %313 = load i64, ptr @DynMemReadCount, align 8
  %314 = add i64 %313, 1
  store i64 %314, ptr @DynMemReadCount, align 8
  %315 = load i32, ptr %294, align 4, !tbaa !1
  %316 = load i64, ptr @DynMemReadCount, align 8
  %317 = add i64 %316, 1
  store i64 %317, ptr @DynMemReadCount, align 8
  %318 = load i32, ptr %284, align 4, !tbaa !1
  %319 = load i64, ptr @DynALUCount, align 8
  %320 = add i64 %319, 1
  store i64 %320, ptr @DynALUCount, align 8
  %321 = add i32 %286, %303
  %322 = load i64, ptr @DynALUCount, align 8
  %323 = add i64 %322, 1
  store i64 %323, ptr @DynALUCount, align 8
  %324 = add i32 %321, %312
  %325 = load i64, ptr @DynALUCount, align 8
  %326 = add i64 %325, 1
  store i64 %326, ptr @DynALUCount, align 8
  %327 = add i32 %324, %315
  %328 = load i64, ptr @DynALUCount, align 8
  %329 = add i64 %328, 1
  store i64 %329, ptr @DynALUCount, align 8
  %330 = add i32 %327, %318
  %331 = load i64, ptr @DynALUCount, align 8
  %332 = add i64 %331, 1
  store i64 %332, ptr @DynALUCount, align 8
  %333 = add i32 %330, %290
  %334 = tail call i32 @llvm.fshl.i32(i32 %293, i32 %293, i32 30)
  %335 = tail call i32 @llvm.fshl.i32(i32 %293, i32 %293, i32 19)
  %336 = load i64, ptr @DynALUCount, align 8
  %337 = add i64 %336, 1
  store i64 %337, ptr @DynALUCount, align 8
  %338 = xor i32 %334, %335
  %339 = tail call i32 @llvm.fshl.i32(i32 %293, i32 %293, i32 10)
  %340 = load i64, ptr @DynALUCount, align 8
  %341 = add i64 %340, 1
  store i64 %341, ptr @DynALUCount, align 8
  %342 = xor i32 %338, %339
  %343 = load i64, ptr @DynALUCount, align 8
  %344 = add i64 %343, 1
  store i64 %344, ptr @DynALUCount, align 8
  %345 = and i32 %292, %293
  %346 = load i64, ptr @DynALUCount, align 8
  %347 = add i64 %346, 1
  store i64 %347, ptr @DynALUCount, align 8
  %348 = xor i32 %292, %293
  %349 = load i64, ptr @DynALUCount, align 8
  %350 = add i64 %349, 1
  store i64 %350, ptr @DynALUCount, align 8
  %351 = and i32 %291, %348
  %352 = load i64, ptr @DynALUCount, align 8
  %353 = add i64 %352, 1
  store i64 %353, ptr @DynALUCount, align 8
  %354 = xor i32 %351, %345
  %355 = load i64, ptr @DynALUCount, align 8
  %356 = add i64 %355, 1
  store i64 %356, ptr @DynALUCount, align 8
  %357 = add i32 %354, %342
  %358 = load i64, ptr @DynALUCount, align 8
  %359 = add i64 %358, 1
  store i64 %359, ptr @DynALUCount, align 8
  %360 = add i32 %357, %330
  %361 = tail call i32 @llvm.fshl.i32(i32 %333, i32 %333, i32 26)
  %362 = tail call i32 @llvm.fshl.i32(i32 %333, i32 %333, i32 21)
  %363 = load i64, ptr @DynALUCount, align 8
  %364 = add i64 %363, 1
  store i64 %364, ptr @DynALUCount, align 8
  %365 = xor i32 %361, %362
  %366 = tail call i32 @llvm.fshl.i32(i32 %333, i32 %333, i32 7)
  %367 = load i64, ptr @DynALUCount, align 8
  %368 = add i64 %367, 1
  store i64 %368, ptr @DynALUCount, align 8
  %369 = xor i32 %365, %366
  %370 = load i64, ptr @DynALUCount, align 8
  %371 = add i64 %370, 1
  store i64 %371, ptr @DynALUCount, align 8
  %372 = xor i32 %288, %289
  %373 = load i64, ptr @DynALUCount, align 8
  %374 = add i64 %373, 1
  store i64 %374, ptr @DynALUCount, align 8
  %375 = and i32 %333, %372
  %376 = load i64, ptr @DynALUCount, align 8
  %377 = add i64 %376, 1
  store i64 %377, ptr @DynALUCount, align 8
  %378 = xor i32 %375, %288
  %379 = load i64, ptr @DynAddressMathCount, align 8
  %380 = add i64 %379, 1
  store i64 %380, ptr @DynAddressMathCount, align 8
  %381 = getelementptr inbounds nuw i8, ptr %294, i64 4
  %382 = load i64, ptr @DynMemReadCount, align 8
  %383 = add i64 %382, 1
  store i64 %383, ptr @DynMemReadCount, align 8
  %384 = load i32, ptr %381, align 4, !tbaa !1
  %385 = load i64, ptr @DynAddressMathCount, align 8
  %386 = add i64 %385, 1
  store i64 %386, ptr @DynAddressMathCount, align 8
  %387 = getelementptr inbounds nuw i8, ptr %284, i64 4
  %388 = load i64, ptr @DynMemReadCount, align 8
  %389 = add i64 %388, 1
  store i64 %389, ptr @DynMemReadCount, align 8
  %390 = load i32, ptr %387, align 4, !tbaa !1
  %391 = load i64, ptr @DynALUCount, align 8
  %392 = add i64 %391, 1
  store i64 %392, ptr @DynALUCount, align 8
  %393 = add i32 %384, %287
  %394 = load i64, ptr @DynALUCount, align 8
  %395 = add i64 %394, 1
  store i64 %395, ptr @DynALUCount, align 8
  %396 = add i32 %393, %390
  %397 = load i64, ptr @DynALUCount, align 8
  %398 = add i64 %397, 1
  store i64 %398, ptr @DynALUCount, align 8
  %399 = add i32 %396, %378
  %400 = load i64, ptr @DynALUCount, align 8
  %401 = add i64 %400, 1
  store i64 %401, ptr @DynALUCount, align 8
  %402 = add i32 %399, %369
  %403 = load i64, ptr @DynALUCount, align 8
  %404 = add i64 %403, 1
  store i64 %404, ptr @DynALUCount, align 8
  %405 = add i32 %402, %291
  %406 = tail call i32 @llvm.fshl.i32(i32 %360, i32 %360, i32 30)
  %407 = tail call i32 @llvm.fshl.i32(i32 %360, i32 %360, i32 19)
  %408 = load i64, ptr @DynALUCount, align 8
  %409 = add i64 %408, 1
  store i64 %409, ptr @DynALUCount, align 8
  %410 = xor i32 %406, %407
  %411 = tail call i32 @llvm.fshl.i32(i32 %360, i32 %360, i32 10)
  %412 = load i64, ptr @DynALUCount, align 8
  %413 = add i64 %412, 1
  store i64 %413, ptr @DynALUCount, align 8
  %414 = xor i32 %410, %411
  %415 = load i64, ptr @DynALUCount, align 8
  %416 = add i64 %415, 1
  store i64 %416, ptr @DynALUCount, align 8
  %417 = and i32 %360, %293
  %418 = load i64, ptr @DynALUCount, align 8
  %419 = add i64 %418, 1
  store i64 %419, ptr @DynALUCount, align 8
  %420 = xor i32 %360, %293
  %421 = load i64, ptr @DynALUCount, align 8
  %422 = add i64 %421, 1
  store i64 %422, ptr @DynALUCount, align 8
  %423 = and i32 %420, %292
  %424 = load i64, ptr @DynALUCount, align 8
  %425 = add i64 %424, 1
  store i64 %425, ptr @DynALUCount, align 8
  %426 = xor i32 %423, %417
  %427 = load i64, ptr @DynALUCount, align 8
  %428 = add i64 %427, 1
  store i64 %428, ptr @DynALUCount, align 8
  %429 = add i32 %414, %426
  %430 = load i64, ptr @DynALUCount, align 8
  %431 = add i64 %430, 1
  store i64 %431, ptr @DynALUCount, align 8
  %432 = add i32 %429, %402
  %433 = tail call i32 @llvm.fshl.i32(i32 %405, i32 %405, i32 26)
  %434 = tail call i32 @llvm.fshl.i32(i32 %405, i32 %405, i32 21)
  %435 = load i64, ptr @DynALUCount, align 8
  %436 = add i64 %435, 1
  store i64 %436, ptr @DynALUCount, align 8
  %437 = xor i32 %433, %434
  %438 = tail call i32 @llvm.fshl.i32(i32 %405, i32 %405, i32 7)
  %439 = load i64, ptr @DynALUCount, align 8
  %440 = add i64 %439, 1
  store i64 %440, ptr @DynALUCount, align 8
  %441 = xor i32 %437, %438
  %442 = load i64, ptr @DynALUCount, align 8
  %443 = add i64 %442, 1
  store i64 %443, ptr @DynALUCount, align 8
  %444 = xor i32 %333, %289
  %445 = load i64, ptr @DynALUCount, align 8
  %446 = add i64 %445, 1
  store i64 %446, ptr @DynALUCount, align 8
  %447 = and i32 %405, %444
  %448 = load i64, ptr @DynALUCount, align 8
  %449 = add i64 %448, 1
  store i64 %449, ptr @DynALUCount, align 8
  %450 = xor i32 %447, %289
  %451 = load i64, ptr @DynAddressMathCount, align 8
  %452 = add i64 %451, 1
  store i64 %452, ptr @DynAddressMathCount, align 8
  %453 = getelementptr inbounds nuw i8, ptr %294, i64 8
  %454 = load i64, ptr @DynMemReadCount, align 8
  %455 = add i64 %454, 1
  store i64 %455, ptr @DynMemReadCount, align 8
  %456 = load i32, ptr %453, align 4, !tbaa !1
  %457 = load i64, ptr @DynAddressMathCount, align 8
  %458 = add i64 %457, 1
  store i64 %458, ptr @DynAddressMathCount, align 8
  %459 = getelementptr inbounds nuw i8, ptr %284, i64 8
  %460 = load i64, ptr @DynMemReadCount, align 8
  %461 = add i64 %460, 1
  store i64 %461, ptr @DynMemReadCount, align 8
  %462 = load i32, ptr %459, align 4, !tbaa !1
  %463 = load i64, ptr @DynALUCount, align 8
  %464 = add i64 %463, 1
  store i64 %464, ptr @DynALUCount, align 8
  %465 = add i32 %456, %288
  %466 = load i64, ptr @DynALUCount, align 8
  %467 = add i64 %466, 1
  store i64 %467, ptr @DynALUCount, align 8
  %468 = add i32 %465, %462
  %469 = load i64, ptr @DynALUCount, align 8
  %470 = add i64 %469, 1
  store i64 %470, ptr @DynALUCount, align 8
  %471 = add i32 %468, %450
  %472 = load i64, ptr @DynALUCount, align 8
  %473 = add i64 %472, 1
  store i64 %473, ptr @DynALUCount, align 8
  %474 = add i32 %471, %441
  %475 = load i64, ptr @DynALUCount, align 8
  %476 = add i64 %475, 1
  store i64 %476, ptr @DynALUCount, align 8
  %477 = add i32 %474, %292
  %478 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 30)
  %479 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 19)
  %480 = load i64, ptr @DynALUCount, align 8
  %481 = add i64 %480, 1
  store i64 %481, ptr @DynALUCount, align 8
  %482 = xor i32 %478, %479
  %483 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 10)
  %484 = load i64, ptr @DynALUCount, align 8
  %485 = add i64 %484, 1
  store i64 %485, ptr @DynALUCount, align 8
  %486 = xor i32 %482, %483
  %487 = load i64, ptr @DynALUCount, align 8
  %488 = add i64 %487, 1
  store i64 %488, ptr @DynALUCount, align 8
  %489 = and i32 %432, %360
  %490 = load i64, ptr @DynALUCount, align 8
  %491 = add i64 %490, 1
  store i64 %491, ptr @DynALUCount, align 8
  %492 = xor i32 %432, %360
  %493 = load i64, ptr @DynALUCount, align 8
  %494 = add i64 %493, 1
  store i64 %494, ptr @DynALUCount, align 8
  %495 = and i32 %492, %293
  %496 = load i64, ptr @DynALUCount, align 8
  %497 = add i64 %496, 1
  store i64 %497, ptr @DynALUCount, align 8
  %498 = xor i32 %495, %489
  %499 = load i64, ptr @DynALUCount, align 8
  %500 = add i64 %499, 1
  store i64 %500, ptr @DynALUCount, align 8
  %501 = add i32 %486, %498
  %502 = load i64, ptr @DynALUCount, align 8
  %503 = add i64 %502, 1
  store i64 %503, ptr @DynALUCount, align 8
  %504 = add i32 %501, %474
  %505 = tail call i32 @llvm.fshl.i32(i32 %477, i32 %477, i32 26)
  %506 = tail call i32 @llvm.fshl.i32(i32 %477, i32 %477, i32 21)
  %507 = load i64, ptr @DynALUCount, align 8
  %508 = add i64 %507, 1
  store i64 %508, ptr @DynALUCount, align 8
  %509 = xor i32 %505, %506
  %510 = tail call i32 @llvm.fshl.i32(i32 %477, i32 %477, i32 7)
  %511 = load i64, ptr @DynALUCount, align 8
  %512 = add i64 %511, 1
  store i64 %512, ptr @DynALUCount, align 8
  %513 = xor i32 %509, %510
  %514 = load i64, ptr @DynALUCount, align 8
  %515 = add i64 %514, 1
  store i64 %515, ptr @DynALUCount, align 8
  %516 = xor i32 %405, %333
  %517 = load i64, ptr @DynALUCount, align 8
  %518 = add i64 %517, 1
  store i64 %518, ptr @DynALUCount, align 8
  %519 = and i32 %477, %516
  %520 = load i64, ptr @DynALUCount, align 8
  %521 = add i64 %520, 1
  store i64 %521, ptr @DynALUCount, align 8
  %522 = xor i32 %519, %333
  %523 = load i64, ptr @DynAddressMathCount, align 8
  %524 = add i64 %523, 1
  store i64 %524, ptr @DynAddressMathCount, align 8
  %525 = getelementptr inbounds nuw i8, ptr %294, i64 12
  %526 = load i64, ptr @DynMemReadCount, align 8
  %527 = add i64 %526, 1
  store i64 %527, ptr @DynMemReadCount, align 8
  %528 = load i32, ptr %525, align 4, !tbaa !1
  %529 = load i64, ptr @DynAddressMathCount, align 8
  %530 = add i64 %529, 1
  store i64 %530, ptr @DynAddressMathCount, align 8
  %531 = getelementptr inbounds nuw i8, ptr %284, i64 12
  %532 = load i64, ptr @DynMemReadCount, align 8
  %533 = add i64 %532, 1
  store i64 %533, ptr @DynMemReadCount, align 8
  %534 = load i32, ptr %531, align 4, !tbaa !1
  %535 = load i64, ptr @DynALUCount, align 8
  %536 = add i64 %535, 1
  store i64 %536, ptr @DynALUCount, align 8
  %537 = add i32 %528, %289
  %538 = load i64, ptr @DynALUCount, align 8
  %539 = add i64 %538, 1
  store i64 %539, ptr @DynALUCount, align 8
  %540 = add i32 %537, %534
  %541 = load i64, ptr @DynALUCount, align 8
  %542 = add i64 %541, 1
  store i64 %542, ptr @DynALUCount, align 8
  %543 = add i32 %540, %522
  %544 = load i64, ptr @DynALUCount, align 8
  %545 = add i64 %544, 1
  store i64 %545, ptr @DynALUCount, align 8
  %546 = add i32 %543, %513
  %547 = load i64, ptr @DynALUCount, align 8
  %548 = add i64 %547, 1
  store i64 %548, ptr @DynALUCount, align 8
  %549 = add i32 %546, %293
  %550 = tail call i32 @llvm.fshl.i32(i32 %504, i32 %504, i32 30)
  %551 = tail call i32 @llvm.fshl.i32(i32 %504, i32 %504, i32 19)
  %552 = load i64, ptr @DynALUCount, align 8
  %553 = add i64 %552, 1
  store i64 %553, ptr @DynALUCount, align 8
  %554 = xor i32 %550, %551
  %555 = tail call i32 @llvm.fshl.i32(i32 %504, i32 %504, i32 10)
  %556 = load i64, ptr @DynALUCount, align 8
  %557 = add i64 %556, 1
  store i64 %557, ptr @DynALUCount, align 8
  %558 = xor i32 %554, %555
  %559 = load i64, ptr @DynALUCount, align 8
  %560 = add i64 %559, 1
  store i64 %560, ptr @DynALUCount, align 8
  %561 = and i32 %504, %432
  %562 = load i64, ptr @DynALUCount, align 8
  %563 = add i64 %562, 1
  store i64 %563, ptr @DynALUCount, align 8
  %564 = xor i32 %504, %432
  %565 = load i64, ptr @DynALUCount, align 8
  %566 = add i64 %565, 1
  store i64 %566, ptr @DynALUCount, align 8
  %567 = and i32 %564, %360
  %568 = load i64, ptr @DynALUCount, align 8
  %569 = add i64 %568, 1
  store i64 %569, ptr @DynALUCount, align 8
  %570 = xor i32 %567, %561
  %571 = load i64, ptr @DynALUCount, align 8
  %572 = add i64 %571, 1
  store i64 %572, ptr @DynALUCount, align 8
  %573 = add i32 %558, %570
  %574 = load i64, ptr @DynALUCount, align 8
  %575 = add i64 %574, 1
  store i64 %575, ptr @DynALUCount, align 8
  %576 = add i32 %573, %546
  %577 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 26)
  %578 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 21)
  %579 = load i64, ptr @DynALUCount, align 8
  %580 = add i64 %579, 1
  store i64 %580, ptr @DynALUCount, align 8
  %581 = xor i32 %577, %578
  %582 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 7)
  %583 = load i64, ptr @DynALUCount, align 8
  %584 = add i64 %583, 1
  store i64 %584, ptr @DynALUCount, align 8
  %585 = xor i32 %581, %582
  %586 = load i64, ptr @DynALUCount, align 8
  %587 = add i64 %586, 1
  store i64 %587, ptr @DynALUCount, align 8
  %588 = xor i32 %477, %405
  %589 = load i64, ptr @DynALUCount, align 8
  %590 = add i64 %589, 1
  store i64 %590, ptr @DynALUCount, align 8
  %591 = and i32 %549, %588
  %592 = load i64, ptr @DynALUCount, align 8
  %593 = add i64 %592, 1
  store i64 %593, ptr @DynALUCount, align 8
  %594 = xor i32 %591, %405
  %595 = load i64, ptr @DynAddressMathCount, align 8
  %596 = add i64 %595, 1
  store i64 %596, ptr @DynAddressMathCount, align 8
  %597 = getelementptr inbounds nuw i8, ptr %294, i64 16
  %598 = load i64, ptr @DynMemReadCount, align 8
  %599 = add i64 %598, 1
  store i64 %599, ptr @DynMemReadCount, align 8
  %600 = load i32, ptr %597, align 4, !tbaa !1
  %601 = load i64, ptr @DynAddressMathCount, align 8
  %602 = add i64 %601, 1
  store i64 %602, ptr @DynAddressMathCount, align 8
  %603 = getelementptr inbounds nuw i8, ptr %284, i64 16
  %604 = load i64, ptr @DynMemReadCount, align 8
  %605 = add i64 %604, 1
  store i64 %605, ptr @DynMemReadCount, align 8
  %606 = load i32, ptr %603, align 4, !tbaa !1
  %607 = load i64, ptr @DynALUCount, align 8
  %608 = add i64 %607, 1
  store i64 %608, ptr @DynALUCount, align 8
  %609 = add i32 %600, %333
  %610 = load i64, ptr @DynALUCount, align 8
  %611 = add i64 %610, 1
  store i64 %611, ptr @DynALUCount, align 8
  %612 = add i32 %609, %606
  %613 = load i64, ptr @DynALUCount, align 8
  %614 = add i64 %613, 1
  store i64 %614, ptr @DynALUCount, align 8
  %615 = add i32 %612, %594
  %616 = load i64, ptr @DynALUCount, align 8
  %617 = add i64 %616, 1
  store i64 %617, ptr @DynALUCount, align 8
  %618 = add i32 %615, %585
  %619 = load i64, ptr @DynALUCount, align 8
  %620 = add i64 %619, 1
  store i64 %620, ptr @DynALUCount, align 8
  %621 = add i32 %618, %360
  %622 = tail call i32 @llvm.fshl.i32(i32 %576, i32 %576, i32 30)
  %623 = tail call i32 @llvm.fshl.i32(i32 %576, i32 %576, i32 19)
  %624 = load i64, ptr @DynALUCount, align 8
  %625 = add i64 %624, 1
  store i64 %625, ptr @DynALUCount, align 8
  %626 = xor i32 %622, %623
  %627 = tail call i32 @llvm.fshl.i32(i32 %576, i32 %576, i32 10)
  %628 = load i64, ptr @DynALUCount, align 8
  %629 = add i64 %628, 1
  store i64 %629, ptr @DynALUCount, align 8
  %630 = xor i32 %626, %627
  %631 = load i64, ptr @DynALUCount, align 8
  %632 = add i64 %631, 1
  store i64 %632, ptr @DynALUCount, align 8
  %633 = and i32 %576, %504
  %634 = load i64, ptr @DynALUCount, align 8
  %635 = add i64 %634, 1
  store i64 %635, ptr @DynALUCount, align 8
  %636 = xor i32 %576, %504
  %637 = load i64, ptr @DynALUCount, align 8
  %638 = add i64 %637, 1
  store i64 %638, ptr @DynALUCount, align 8
  %639 = and i32 %636, %432
  %640 = load i64, ptr @DynALUCount, align 8
  %641 = add i64 %640, 1
  store i64 %641, ptr @DynALUCount, align 8
  %642 = xor i32 %639, %633
  %643 = load i64, ptr @DynALUCount, align 8
  %644 = add i64 %643, 1
  store i64 %644, ptr @DynALUCount, align 8
  %645 = add i32 %630, %642
  %646 = load i64, ptr @DynALUCount, align 8
  %647 = add i64 %646, 1
  store i64 %647, ptr @DynALUCount, align 8
  %648 = add i32 %645, %618
  %649 = tail call i32 @llvm.fshl.i32(i32 %621, i32 %621, i32 26)
  %650 = tail call i32 @llvm.fshl.i32(i32 %621, i32 %621, i32 21)
  %651 = load i64, ptr @DynALUCount, align 8
  %652 = add i64 %651, 1
  store i64 %652, ptr @DynALUCount, align 8
  %653 = xor i32 %649, %650
  %654 = tail call i32 @llvm.fshl.i32(i32 %621, i32 %621, i32 7)
  %655 = load i64, ptr @DynALUCount, align 8
  %656 = add i64 %655, 1
  store i64 %656, ptr @DynALUCount, align 8
  %657 = xor i32 %653, %654
  %658 = load i64, ptr @DynALUCount, align 8
  %659 = add i64 %658, 1
  store i64 %659, ptr @DynALUCount, align 8
  %660 = xor i32 %549, %477
  %661 = load i64, ptr @DynALUCount, align 8
  %662 = add i64 %661, 1
  store i64 %662, ptr @DynALUCount, align 8
  %663 = and i32 %621, %660
  %664 = load i64, ptr @DynALUCount, align 8
  %665 = add i64 %664, 1
  store i64 %665, ptr @DynALUCount, align 8
  %666 = xor i32 %663, %477
  %667 = load i64, ptr @DynAddressMathCount, align 8
  %668 = add i64 %667, 1
  store i64 %668, ptr @DynAddressMathCount, align 8
  %669 = getelementptr inbounds nuw i8, ptr %294, i64 20
  %670 = load i64, ptr @DynMemReadCount, align 8
  %671 = add i64 %670, 1
  store i64 %671, ptr @DynMemReadCount, align 8
  %672 = load i32, ptr %669, align 4, !tbaa !1
  %673 = load i64, ptr @DynAddressMathCount, align 8
  %674 = add i64 %673, 1
  store i64 %674, ptr @DynAddressMathCount, align 8
  %675 = getelementptr inbounds nuw i8, ptr %284, i64 20
  %676 = load i64, ptr @DynMemReadCount, align 8
  %677 = add i64 %676, 1
  store i64 %677, ptr @DynMemReadCount, align 8
  %678 = load i32, ptr %675, align 4, !tbaa !1
  %679 = load i64, ptr @DynALUCount, align 8
  %680 = add i64 %679, 1
  store i64 %680, ptr @DynALUCount, align 8
  %681 = add i32 %678, %672
  %682 = load i64, ptr @DynALUCount, align 8
  %683 = add i64 %682, 1
  store i64 %683, ptr @DynALUCount, align 8
  %684 = add i32 %681, %405
  %685 = load i64, ptr @DynALUCount, align 8
  %686 = add i64 %685, 1
  store i64 %686, ptr @DynALUCount, align 8
  %687 = add i32 %684, %666
  %688 = load i64, ptr @DynALUCount, align 8
  %689 = add i64 %688, 1
  store i64 %689, ptr @DynALUCount, align 8
  %690 = add i32 %687, %657
  %691 = load i64, ptr @DynALUCount, align 8
  %692 = add i64 %691, 1
  store i64 %692, ptr @DynALUCount, align 8
  %693 = add i32 %690, %432
  %694 = tail call i32 @llvm.fshl.i32(i32 %648, i32 %648, i32 30)
  %695 = tail call i32 @llvm.fshl.i32(i32 %648, i32 %648, i32 19)
  %696 = load i64, ptr @DynALUCount, align 8
  %697 = add i64 %696, 1
  store i64 %697, ptr @DynALUCount, align 8
  %698 = xor i32 %694, %695
  %699 = tail call i32 @llvm.fshl.i32(i32 %648, i32 %648, i32 10)
  %700 = load i64, ptr @DynALUCount, align 8
  %701 = add i64 %700, 1
  store i64 %701, ptr @DynALUCount, align 8
  %702 = xor i32 %698, %699
  %703 = load i64, ptr @DynALUCount, align 8
  %704 = add i64 %703, 1
  store i64 %704, ptr @DynALUCount, align 8
  %705 = and i32 %648, %576
  %706 = load i64, ptr @DynALUCount, align 8
  %707 = add i64 %706, 1
  store i64 %707, ptr @DynALUCount, align 8
  %708 = xor i32 %648, %576
  %709 = load i64, ptr @DynALUCount, align 8
  %710 = add i64 %709, 1
  store i64 %710, ptr @DynALUCount, align 8
  %711 = and i32 %708, %504
  %712 = load i64, ptr @DynALUCount, align 8
  %713 = add i64 %712, 1
  store i64 %713, ptr @DynALUCount, align 8
  %714 = xor i32 %711, %705
  %715 = load i64, ptr @DynALUCount, align 8
  %716 = add i64 %715, 1
  store i64 %716, ptr @DynALUCount, align 8
  %717 = add i32 %702, %714
  %718 = load i64, ptr @DynALUCount, align 8
  %719 = add i64 %718, 1
  store i64 %719, ptr @DynALUCount, align 8
  %720 = add i32 %717, %690
  %721 = tail call i32 @llvm.fshl.i32(i32 %693, i32 %693, i32 26)
  %722 = tail call i32 @llvm.fshl.i32(i32 %693, i32 %693, i32 21)
  %723 = load i64, ptr @DynALUCount, align 8
  %724 = add i64 %723, 1
  store i64 %724, ptr @DynALUCount, align 8
  %725 = xor i32 %721, %722
  %726 = tail call i32 @llvm.fshl.i32(i32 %693, i32 %693, i32 7)
  %727 = load i64, ptr @DynALUCount, align 8
  %728 = add i64 %727, 1
  store i64 %728, ptr @DynALUCount, align 8
  %729 = xor i32 %725, %726
  %730 = load i64, ptr @DynALUCount, align 8
  %731 = add i64 %730, 1
  store i64 %731, ptr @DynALUCount, align 8
  %732 = xor i32 %621, %549
  %733 = load i64, ptr @DynALUCount, align 8
  %734 = add i64 %733, 1
  store i64 %734, ptr @DynALUCount, align 8
  %735 = and i32 %693, %732
  %736 = load i64, ptr @DynALUCount, align 8
  %737 = add i64 %736, 1
  store i64 %737, ptr @DynALUCount, align 8
  %738 = xor i32 %735, %549
  %739 = load i64, ptr @DynAddressMathCount, align 8
  %740 = add i64 %739, 1
  store i64 %740, ptr @DynAddressMathCount, align 8
  %741 = getelementptr inbounds nuw i8, ptr %294, i64 24
  %742 = load i64, ptr @DynMemReadCount, align 8
  %743 = add i64 %742, 1
  store i64 %743, ptr @DynMemReadCount, align 8
  %744 = load i32, ptr %741, align 4, !tbaa !1
  %745 = load i64, ptr @DynAddressMathCount, align 8
  %746 = add i64 %745, 1
  store i64 %746, ptr @DynAddressMathCount, align 8
  %747 = getelementptr inbounds nuw i8, ptr %284, i64 24
  %748 = load i64, ptr @DynMemReadCount, align 8
  %749 = add i64 %748, 1
  store i64 %749, ptr @DynMemReadCount, align 8
  %750 = load i32, ptr %747, align 4, !tbaa !1
  %751 = load i64, ptr @DynALUCount, align 8
  %752 = add i64 %751, 1
  store i64 %752, ptr @DynALUCount, align 8
  %753 = add i32 %750, %744
  %754 = load i64, ptr @DynALUCount, align 8
  %755 = add i64 %754, 1
  store i64 %755, ptr @DynALUCount, align 8
  %756 = add i32 %753, %477
  %757 = load i64, ptr @DynALUCount, align 8
  %758 = add i64 %757, 1
  store i64 %758, ptr @DynALUCount, align 8
  %759 = add i32 %756, %738
  %760 = load i64, ptr @DynALUCount, align 8
  %761 = add i64 %760, 1
  store i64 %761, ptr @DynALUCount, align 8
  %762 = add i32 %759, %729
  %763 = load i64, ptr @DynALUCount, align 8
  %764 = add i64 %763, 1
  store i64 %764, ptr @DynALUCount, align 8
  %765 = add i32 %762, %504
  %766 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 30)
  %767 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 19)
  %768 = load i64, ptr @DynALUCount, align 8
  %769 = add i64 %768, 1
  store i64 %769, ptr @DynALUCount, align 8
  %770 = xor i32 %766, %767
  %771 = tail call i32 @llvm.fshl.i32(i32 %720, i32 %720, i32 10)
  %772 = load i64, ptr @DynALUCount, align 8
  %773 = add i64 %772, 1
  store i64 %773, ptr @DynALUCount, align 8
  %774 = xor i32 %770, %771
  %775 = load i64, ptr @DynALUCount, align 8
  %776 = add i64 %775, 1
  store i64 %776, ptr @DynALUCount, align 8
  %777 = and i32 %720, %648
  %778 = load i64, ptr @DynALUCount, align 8
  %779 = add i64 %778, 1
  store i64 %779, ptr @DynALUCount, align 8
  %780 = xor i32 %720, %648
  %781 = load i64, ptr @DynALUCount, align 8
  %782 = add i64 %781, 1
  store i64 %782, ptr @DynALUCount, align 8
  %783 = and i32 %780, %576
  %784 = load i64, ptr @DynALUCount, align 8
  %785 = add i64 %784, 1
  store i64 %785, ptr @DynALUCount, align 8
  %786 = xor i32 %783, %777
  %787 = load i64, ptr @DynALUCount, align 8
  %788 = add i64 %787, 1
  store i64 %788, ptr @DynALUCount, align 8
  %789 = add i32 %774, %786
  %790 = load i64, ptr @DynALUCount, align 8
  %791 = add i64 %790, 1
  store i64 %791, ptr @DynALUCount, align 8
  %792 = add i32 %789, %762
  %793 = tail call i32 @llvm.fshl.i32(i32 %765, i32 %765, i32 26)
  %794 = tail call i32 @llvm.fshl.i32(i32 %765, i32 %765, i32 21)
  %795 = load i64, ptr @DynALUCount, align 8
  %796 = add i64 %795, 1
  store i64 %796, ptr @DynALUCount, align 8
  %797 = xor i32 %793, %794
  %798 = tail call i32 @llvm.fshl.i32(i32 %765, i32 %765, i32 7)
  %799 = load i64, ptr @DynALUCount, align 8
  %800 = add i64 %799, 1
  store i64 %800, ptr @DynALUCount, align 8
  %801 = xor i32 %797, %798
  %802 = load i64, ptr @DynALUCount, align 8
  %803 = add i64 %802, 1
  store i64 %803, ptr @DynALUCount, align 8
  %804 = xor i32 %693, %621
  %805 = load i64, ptr @DynALUCount, align 8
  %806 = add i64 %805, 1
  store i64 %806, ptr @DynALUCount, align 8
  %807 = and i32 %765, %804
  %808 = load i64, ptr @DynALUCount, align 8
  %809 = add i64 %808, 1
  store i64 %809, ptr @DynALUCount, align 8
  %810 = xor i32 %807, %621
  %811 = load i64, ptr @DynAddressMathCount, align 8
  %812 = add i64 %811, 1
  store i64 %812, ptr @DynAddressMathCount, align 8
  %813 = getelementptr inbounds nuw i8, ptr %294, i64 28
  %814 = load i64, ptr @DynMemReadCount, align 8
  %815 = add i64 %814, 1
  store i64 %815, ptr @DynMemReadCount, align 8
  %816 = load i32, ptr %813, align 4, !tbaa !1
  %817 = load i64, ptr @DynAddressMathCount, align 8
  %818 = add i64 %817, 1
  store i64 %818, ptr @DynAddressMathCount, align 8
  %819 = getelementptr inbounds nuw i8, ptr %284, i64 28
  %820 = load i64, ptr @DynMemReadCount, align 8
  %821 = add i64 %820, 1
  store i64 %821, ptr @DynMemReadCount, align 8
  %822 = load i32, ptr %819, align 4, !tbaa !1
  %823 = load i64, ptr @DynALUCount, align 8
  %824 = add i64 %823, 1
  store i64 %824, ptr @DynALUCount, align 8
  %825 = add i32 %822, %816
  %826 = load i64, ptr @DynALUCount, align 8
  %827 = add i64 %826, 1
  store i64 %827, ptr @DynALUCount, align 8
  %828 = add i32 %825, %549
  %829 = load i64, ptr @DynALUCount, align 8
  %830 = add i64 %829, 1
  store i64 %830, ptr @DynALUCount, align 8
  %831 = add i32 %828, %810
  %832 = load i64, ptr @DynALUCount, align 8
  %833 = add i64 %832, 1
  store i64 %833, ptr @DynALUCount, align 8
  %834 = add i32 %831, %801
  %835 = load i64, ptr @DynALUCount, align 8
  %836 = add i64 %835, 1
  store i64 %836, ptr @DynALUCount, align 8
  %837 = add i32 %834, %576
  %838 = tail call i32 @llvm.fshl.i32(i32 %792, i32 %792, i32 30)
  %839 = tail call i32 @llvm.fshl.i32(i32 %792, i32 %792, i32 19)
  %840 = load i64, ptr @DynALUCount, align 8
  %841 = add i64 %840, 1
  store i64 %841, ptr @DynALUCount, align 8
  %842 = xor i32 %838, %839
  %843 = tail call i32 @llvm.fshl.i32(i32 %792, i32 %792, i32 10)
  %844 = load i64, ptr @DynALUCount, align 8
  %845 = add i64 %844, 1
  store i64 %845, ptr @DynALUCount, align 8
  %846 = xor i32 %842, %843
  %847 = load i64, ptr @DynALUCount, align 8
  %848 = add i64 %847, 1
  store i64 %848, ptr @DynALUCount, align 8
  %849 = and i32 %792, %720
  %850 = load i64, ptr @DynALUCount, align 8
  %851 = add i64 %850, 1
  store i64 %851, ptr @DynALUCount, align 8
  %852 = xor i32 %792, %720
  %853 = load i64, ptr @DynALUCount, align 8
  %854 = add i64 %853, 1
  store i64 %854, ptr @DynALUCount, align 8
  %855 = and i32 %852, %648
  %856 = load i64, ptr @DynALUCount, align 8
  %857 = add i64 %856, 1
  store i64 %857, ptr @DynALUCount, align 8
  %858 = xor i32 %855, %849
  %859 = load i64, ptr @DynALUCount, align 8
  %860 = add i64 %859, 1
  store i64 %860, ptr @DynALUCount, align 8
  %861 = add i32 %846, %858
  %862 = load i64, ptr @DynALUCount, align 8
  %863 = add i64 %862, 1
  store i64 %863, ptr @DynALUCount, align 8
  %864 = add i32 %861, %834
  %865 = load i64, ptr @DynAddressMathCount, align 8
  %866 = add i64 %865, 1
  store i64 %866, ptr @DynAddressMathCount, align 8
  %867 = getelementptr inbounds nuw i8, ptr %294, i64 32
  %868 = load i64, ptr @DynAddressMathCount, align 8
  %869 = add i64 %868, 1
  store i64 %869, ptr @DynAddressMathCount, align 8
  %870 = getelementptr inbounds nuw i8, ptr %284, i64 32
  %871 = load i64, ptr @DynControlFlowCount, align 8
  %872 = add i64 %871, 1
  store i64 %872, ptr @DynControlFlowCount, align 8
  br i1 %285, label %283, label %187, !llvm.loop !20

873:                                              ; preds = %873, %187
  %874 = phi i32 [ %280, %187 ], [ %1730, %873 ]
  %875 = phi i32 [ %277, %187 ], [ %1633, %873 ]
  %876 = phi i32 [ %274, %187 ], [ %1536, %873 ]
  %877 = phi i32 [ %271, %187 ], [ %1439, %873 ]
  %878 = phi i32 [ %268, %187 ], [ %2215, %873 ]
  %879 = phi i32 [ %265, %187 ], [ %1342, %873 ]
  %880 = phi i32 [ %262, %187 ], [ %2118, %873 ]
  %881 = phi i32 [ %259, %187 ], [ %1245, %873 ]
  %882 = phi i32 [ %256, %187 ], [ %2021, %873 ]
  %883 = phi i32 [ %253, %187 ], [ %1148, %873 ]
  %884 = phi i32 [ %250, %187 ], [ %1924, %873 ]
  %885 = phi i32 [ %247, %187 ], [ %2409, %873 ]
  %886 = phi i32 [ %244, %187 ], [ %1051, %873 ]
  %887 = phi i32 [ %241, %187 ], [ %1827, %873 ]
  %888 = phi i32 [ %238, %187 ], [ %2312, %873 ]
  %889 = phi i32 [ 16, %187 ], [ %2454, %873 ]
  %890 = phi i32 [ %621, %187 ], [ %2133, %873 ]
  %891 = phi i32 [ %693, %187 ], [ %2230, %873 ]
  %892 = phi i32 [ %765, %187 ], [ %2327, %873 ]
  %893 = phi i32 [ %837, %187 ], [ %2424, %873 ]
  %894 = phi i32 [ %648, %187 ], [ %2160, %873 ]
  %895 = phi i32 [ %720, %187 ], [ %2257, %873 ]
  %896 = phi i32 [ %792, %187 ], [ %2354, %873 ]
  %897 = phi i32 [ %864, %187 ], [ %2451, %873 ]
  %898 = phi ptr [ %2, %187 ], [ %902, %873 ]
  %899 = phi i32 [ %190, %187 ], [ %954, %873 ]
  %900 = load i64, ptr @DynAddressMathCount, align 8
  %901 = add i64 %900, 1
  store i64 %901, ptr @DynAddressMathCount, align 8
  %902 = getelementptr i8, ptr %898, i64 64
  %903 = tail call i32 @llvm.fshl.i32(i32 %893, i32 %893, i32 26)
  %904 = tail call i32 @llvm.fshl.i32(i32 %893, i32 %893, i32 21)
  %905 = load i64, ptr @DynALUCount, align 8
  %906 = add i64 %905, 1
  store i64 %906, ptr @DynALUCount, align 8
  %907 = xor i32 %903, %904
  %908 = tail call i32 @llvm.fshl.i32(i32 %893, i32 %893, i32 7)
  %909 = load i64, ptr @DynALUCount, align 8
  %910 = add i64 %909, 1
  store i64 %910, ptr @DynALUCount, align 8
  %911 = xor i32 %907, %908
  %912 = load i64, ptr @DynALUCount, align 8
  %913 = add i64 %912, 1
  store i64 %913, ptr @DynALUCount, align 8
  %914 = xor i32 %891, %892
  %915 = load i64, ptr @DynALUCount, align 8
  %916 = add i64 %915, 1
  store i64 %916, ptr @DynALUCount, align 8
  %917 = and i32 %914, %893
  %918 = load i64, ptr @DynALUCount, align 8
  %919 = add i64 %918, 1
  store i64 %919, ptr @DynALUCount, align 8
  %920 = xor i32 %917, %891
  %921 = load i64, ptr @DynMemReadCount, align 8
  %922 = add i64 %921, 1
  store i64 %922, ptr @DynMemReadCount, align 8
  %923 = load i32, ptr %902, align 4, !tbaa !1
  %924 = tail call i32 @llvm.fshl.i32(i32 %888, i32 %888, i32 15)
  %925 = tail call i32 @llvm.fshl.i32(i32 %888, i32 %888, i32 13)
  %926 = load i64, ptr @DynALUCount, align 8
  %927 = add i64 %926, 1
  store i64 %927, ptr @DynALUCount, align 8
  %928 = xor i32 %924, %925
  %929 = load i64, ptr @DynALUCount, align 8
  %930 = add i64 %929, 1
  store i64 %930, ptr @DynALUCount, align 8
  %931 = lshr i32 %888, 10
  %932 = load i64, ptr @DynALUCount, align 8
  %933 = add i64 %932, 1
  store i64 %933, ptr @DynALUCount, align 8
  %934 = xor i32 %928, %931
  %935 = load i64, ptr @DynALUCount, align 8
  %936 = add i64 %935, 1
  store i64 %936, ptr @DynALUCount, align 8
  %937 = add i32 %934, %887
  %938 = tail call i32 @llvm.fshl.i32(i32 %886, i32 %886, i32 25)
  %939 = tail call i32 @llvm.fshl.i32(i32 %886, i32 %886, i32 14)
  %940 = load i64, ptr @DynALUCount, align 8
  %941 = add i64 %940, 1
  store i64 %941, ptr @DynALUCount, align 8
  %942 = xor i32 %938, %939
  %943 = load i64, ptr @DynALUCount, align 8
  %944 = add i64 %943, 1
  store i64 %944, ptr @DynALUCount, align 8
  %945 = lshr i32 %886, 3
  %946 = load i64, ptr @DynALUCount, align 8
  %947 = add i64 %946, 1
  store i64 %947, ptr @DynALUCount, align 8
  %948 = xor i32 %942, %945
  %949 = load i64, ptr @DynALUCount, align 8
  %950 = add i64 %949, 1
  store i64 %950, ptr @DynALUCount, align 8
  %951 = add i32 %937, %899
  %952 = load i64, ptr @DynALUCount, align 8
  %953 = add i64 %952, 1
  store i64 %953, ptr @DynALUCount, align 8
  %954 = add i32 %951, %948
  %955 = load i64, ptr @DynALUCount, align 8
  %956 = add i64 %955, 1
  store i64 %956, ptr @DynALUCount, align 8
  %957 = add i32 %890, %911
  %958 = load i64, ptr @DynALUCount, align 8
  %959 = add i64 %958, 1
  store i64 %959, ptr @DynALUCount, align 8
  %960 = add i32 %957, %920
  %961 = load i64, ptr @DynALUCount, align 8
  %962 = add i64 %961, 1
  store i64 %962, ptr @DynALUCount, align 8
  %963 = add i32 %960, %923
  %964 = load i64, ptr @DynALUCount, align 8
  %965 = add i64 %964, 1
  store i64 %965, ptr @DynALUCount, align 8
  %966 = add i32 %963, %954
  %967 = load i64, ptr @DynALUCount, align 8
  %968 = add i64 %967, 1
  store i64 %968, ptr @DynALUCount, align 8
  %969 = add i32 %966, %894
  %970 = tail call i32 @llvm.fshl.i32(i32 %897, i32 %897, i32 30)
  %971 = tail call i32 @llvm.fshl.i32(i32 %897, i32 %897, i32 19)
  %972 = load i64, ptr @DynALUCount, align 8
  %973 = add i64 %972, 1
  store i64 %973, ptr @DynALUCount, align 8
  %974 = xor i32 %970, %971
  %975 = tail call i32 @llvm.fshl.i32(i32 %897, i32 %897, i32 10)
  %976 = load i64, ptr @DynALUCount, align 8
  %977 = add i64 %976, 1
  store i64 %977, ptr @DynALUCount, align 8
  %978 = xor i32 %974, %975
  %979 = load i64, ptr @DynALUCount, align 8
  %980 = add i64 %979, 1
  store i64 %980, ptr @DynALUCount, align 8
  %981 = and i32 %896, %897
  %982 = load i64, ptr @DynALUCount, align 8
  %983 = add i64 %982, 1
  store i64 %983, ptr @DynALUCount, align 8
  %984 = xor i32 %896, %897
  %985 = load i64, ptr @DynALUCount, align 8
  %986 = add i64 %985, 1
  store i64 %986, ptr @DynALUCount, align 8
  %987 = and i32 %895, %984
  %988 = load i64, ptr @DynALUCount, align 8
  %989 = add i64 %988, 1
  store i64 %989, ptr @DynALUCount, align 8
  %990 = xor i32 %987, %981
  %991 = load i64, ptr @DynALUCount, align 8
  %992 = add i64 %991, 1
  store i64 %992, ptr @DynALUCount, align 8
  %993 = add i32 %990, %978
  %994 = load i64, ptr @DynALUCount, align 8
  %995 = add i64 %994, 1
  store i64 %995, ptr @DynALUCount, align 8
  %996 = add i32 %993, %966
  %997 = tail call i32 @llvm.fshl.i32(i32 %969, i32 %969, i32 26)
  %998 = tail call i32 @llvm.fshl.i32(i32 %969, i32 %969, i32 21)
  %999 = load i64, ptr @DynALUCount, align 8
  %1000 = add i64 %999, 1
  store i64 %1000, ptr @DynALUCount, align 8
  %1001 = xor i32 %997, %998
  %1002 = tail call i32 @llvm.fshl.i32(i32 %969, i32 %969, i32 7)
  %1003 = load i64, ptr @DynALUCount, align 8
  %1004 = add i64 %1003, 1
  store i64 %1004, ptr @DynALUCount, align 8
  %1005 = xor i32 %1001, %1002
  %1006 = load i64, ptr @DynALUCount, align 8
  %1007 = add i64 %1006, 1
  store i64 %1007, ptr @DynALUCount, align 8
  %1008 = xor i32 %892, %893
  %1009 = load i64, ptr @DynALUCount, align 8
  %1010 = add i64 %1009, 1
  store i64 %1010, ptr @DynALUCount, align 8
  %1011 = and i32 %969, %1008
  %1012 = load i64, ptr @DynALUCount, align 8
  %1013 = add i64 %1012, 1
  store i64 %1013, ptr @DynALUCount, align 8
  %1014 = xor i32 %1011, %892
  %1015 = load i64, ptr @DynAddressMathCount, align 8
  %1016 = add i64 %1015, 1
  store i64 %1016, ptr @DynAddressMathCount, align 8
  %1017 = getelementptr i8, ptr %898, i64 68
  %1018 = load i64, ptr @DynMemReadCount, align 8
  %1019 = add i64 %1018, 1
  store i64 %1019, ptr @DynMemReadCount, align 8
  %1020 = load i32, ptr %1017, align 4, !tbaa !1
  %1021 = tail call i32 @llvm.fshl.i32(i32 %885, i32 %885, i32 15)
  %1022 = tail call i32 @llvm.fshl.i32(i32 %885, i32 %885, i32 13)
  %1023 = load i64, ptr @DynALUCount, align 8
  %1024 = add i64 %1023, 1
  store i64 %1024, ptr @DynALUCount, align 8
  %1025 = xor i32 %1021, %1022
  %1026 = load i64, ptr @DynALUCount, align 8
  %1027 = add i64 %1026, 1
  store i64 %1027, ptr @DynALUCount, align 8
  %1028 = lshr i32 %885, 10
  %1029 = load i64, ptr @DynALUCount, align 8
  %1030 = add i64 %1029, 1
  store i64 %1030, ptr @DynALUCount, align 8
  %1031 = xor i32 %1025, %1028
  %1032 = tail call i32 @llvm.fshl.i32(i32 %883, i32 %883, i32 25)
  %1033 = tail call i32 @llvm.fshl.i32(i32 %883, i32 %883, i32 14)
  %1034 = load i64, ptr @DynALUCount, align 8
  %1035 = add i64 %1034, 1
  store i64 %1035, ptr @DynALUCount, align 8
  %1036 = xor i32 %1032, %1033
  %1037 = load i64, ptr @DynALUCount, align 8
  %1038 = add i64 %1037, 1
  store i64 %1038, ptr @DynALUCount, align 8
  %1039 = lshr i32 %883, 3
  %1040 = load i64, ptr @DynALUCount, align 8
  %1041 = add i64 %1040, 1
  store i64 %1041, ptr @DynALUCount, align 8
  %1042 = xor i32 %1036, %1039
  %1043 = load i64, ptr @DynALUCount, align 8
  %1044 = add i64 %1043, 1
  store i64 %1044, ptr @DynALUCount, align 8
  %1045 = add i32 %884, %886
  %1046 = load i64, ptr @DynALUCount, align 8
  %1047 = add i64 %1046, 1
  store i64 %1047, ptr @DynALUCount, align 8
  %1048 = add i32 %1045, %1031
  %1049 = load i64, ptr @DynALUCount, align 8
  %1050 = add i64 %1049, 1
  store i64 %1050, ptr @DynALUCount, align 8
  %1051 = add i32 %1048, %1042
  %1052 = load i64, ptr @DynALUCount, align 8
  %1053 = add i64 %1052, 1
  store i64 %1053, ptr @DynALUCount, align 8
  %1054 = add i32 %1020, %891
  %1055 = load i64, ptr @DynALUCount, align 8
  %1056 = add i64 %1055, 1
  store i64 %1056, ptr @DynALUCount, align 8
  %1057 = add i32 %1054, %1014
  %1058 = load i64, ptr @DynALUCount, align 8
  %1059 = add i64 %1058, 1
  store i64 %1059, ptr @DynALUCount, align 8
  %1060 = add i32 %1057, %1005
  %1061 = load i64, ptr @DynALUCount, align 8
  %1062 = add i64 %1061, 1
  store i64 %1062, ptr @DynALUCount, align 8
  %1063 = add i32 %1060, %1051
  %1064 = load i64, ptr @DynALUCount, align 8
  %1065 = add i64 %1064, 1
  store i64 %1065, ptr @DynALUCount, align 8
  %1066 = add i32 %1063, %895
  %1067 = tail call i32 @llvm.fshl.i32(i32 %996, i32 %996, i32 30)
  %1068 = tail call i32 @llvm.fshl.i32(i32 %996, i32 %996, i32 19)
  %1069 = load i64, ptr @DynALUCount, align 8
  %1070 = add i64 %1069, 1
  store i64 %1070, ptr @DynALUCount, align 8
  %1071 = xor i32 %1067, %1068
  %1072 = tail call i32 @llvm.fshl.i32(i32 %996, i32 %996, i32 10)
  %1073 = load i64, ptr @DynALUCount, align 8
  %1074 = add i64 %1073, 1
  store i64 %1074, ptr @DynALUCount, align 8
  %1075 = xor i32 %1071, %1072
  %1076 = load i64, ptr @DynALUCount, align 8
  %1077 = add i64 %1076, 1
  store i64 %1077, ptr @DynALUCount, align 8
  %1078 = and i32 %996, %897
  %1079 = load i64, ptr @DynALUCount, align 8
  %1080 = add i64 %1079, 1
  store i64 %1080, ptr @DynALUCount, align 8
  %1081 = xor i32 %996, %897
  %1082 = load i64, ptr @DynALUCount, align 8
  %1083 = add i64 %1082, 1
  store i64 %1083, ptr @DynALUCount, align 8
  %1084 = and i32 %1081, %896
  %1085 = load i64, ptr @DynALUCount, align 8
  %1086 = add i64 %1085, 1
  store i64 %1086, ptr @DynALUCount, align 8
  %1087 = xor i32 %1084, %1078
  %1088 = load i64, ptr @DynALUCount, align 8
  %1089 = add i64 %1088, 1
  store i64 %1089, ptr @DynALUCount, align 8
  %1090 = add i32 %1075, %1087
  %1091 = load i64, ptr @DynALUCount, align 8
  %1092 = add i64 %1091, 1
  store i64 %1092, ptr @DynALUCount, align 8
  %1093 = add i32 %1090, %1063
  %1094 = tail call i32 @llvm.fshl.i32(i32 %1066, i32 %1066, i32 26)
  %1095 = tail call i32 @llvm.fshl.i32(i32 %1066, i32 %1066, i32 21)
  %1096 = load i64, ptr @DynALUCount, align 8
  %1097 = add i64 %1096, 1
  store i64 %1097, ptr @DynALUCount, align 8
  %1098 = xor i32 %1094, %1095
  %1099 = tail call i32 @llvm.fshl.i32(i32 %1066, i32 %1066, i32 7)
  %1100 = load i64, ptr @DynALUCount, align 8
  %1101 = add i64 %1100, 1
  store i64 %1101, ptr @DynALUCount, align 8
  %1102 = xor i32 %1098, %1099
  %1103 = load i64, ptr @DynALUCount, align 8
  %1104 = add i64 %1103, 1
  store i64 %1104, ptr @DynALUCount, align 8
  %1105 = xor i32 %969, %893
  %1106 = load i64, ptr @DynALUCount, align 8
  %1107 = add i64 %1106, 1
  store i64 %1107, ptr @DynALUCount, align 8
  %1108 = and i32 %1066, %1105
  %1109 = load i64, ptr @DynALUCount, align 8
  %1110 = add i64 %1109, 1
  store i64 %1110, ptr @DynALUCount, align 8
  %1111 = xor i32 %1108, %893
  %1112 = load i64, ptr @DynAddressMathCount, align 8
  %1113 = add i64 %1112, 1
  store i64 %1113, ptr @DynAddressMathCount, align 8
  %1114 = getelementptr i8, ptr %898, i64 72
  %1115 = load i64, ptr @DynMemReadCount, align 8
  %1116 = add i64 %1115, 1
  store i64 %1116, ptr @DynMemReadCount, align 8
  %1117 = load i32, ptr %1114, align 4, !tbaa !1
  %1118 = tail call i32 @llvm.fshl.i32(i32 %954, i32 %954, i32 15)
  %1119 = tail call i32 @llvm.fshl.i32(i32 %954, i32 %954, i32 13)
  %1120 = load i64, ptr @DynALUCount, align 8
  %1121 = add i64 %1120, 1
  store i64 %1121, ptr @DynALUCount, align 8
  %1122 = xor i32 %1118, %1119
  %1123 = load i64, ptr @DynALUCount, align 8
  %1124 = add i64 %1123, 1
  store i64 %1124, ptr @DynALUCount, align 8
  %1125 = lshr i32 %954, 10
  %1126 = load i64, ptr @DynALUCount, align 8
  %1127 = add i64 %1126, 1
  store i64 %1127, ptr @DynALUCount, align 8
  %1128 = xor i32 %1122, %1125
  %1129 = tail call i32 @llvm.fshl.i32(i32 %881, i32 %881, i32 25)
  %1130 = tail call i32 @llvm.fshl.i32(i32 %881, i32 %881, i32 14)
  %1131 = load i64, ptr @DynALUCount, align 8
  %1132 = add i64 %1131, 1
  store i64 %1132, ptr @DynALUCount, align 8
  %1133 = xor i32 %1129, %1130
  %1134 = load i64, ptr @DynALUCount, align 8
  %1135 = add i64 %1134, 1
  store i64 %1135, ptr @DynALUCount, align 8
  %1136 = lshr i32 %881, 3
  %1137 = load i64, ptr @DynALUCount, align 8
  %1138 = add i64 %1137, 1
  store i64 %1138, ptr @DynALUCount, align 8
  %1139 = xor i32 %1133, %1136
  %1140 = load i64, ptr @DynALUCount, align 8
  %1141 = add i64 %1140, 1
  store i64 %1141, ptr @DynALUCount, align 8
  %1142 = add i32 %1128, %883
  %1143 = load i64, ptr @DynALUCount, align 8
  %1144 = add i64 %1143, 1
  store i64 %1144, ptr @DynALUCount, align 8
  %1145 = add i32 %1142, %882
  %1146 = load i64, ptr @DynALUCount, align 8
  %1147 = add i64 %1146, 1
  store i64 %1147, ptr @DynALUCount, align 8
  %1148 = add i32 %1145, %1139
  %1149 = load i64, ptr @DynALUCount, align 8
  %1150 = add i64 %1149, 1
  store i64 %1150, ptr @DynALUCount, align 8
  %1151 = add i32 %1117, %892
  %1152 = load i64, ptr @DynALUCount, align 8
  %1153 = add i64 %1152, 1
  store i64 %1153, ptr @DynALUCount, align 8
  %1154 = add i32 %1151, %1148
  %1155 = load i64, ptr @DynALUCount, align 8
  %1156 = add i64 %1155, 1
  store i64 %1156, ptr @DynALUCount, align 8
  %1157 = add i32 %1154, %1111
  %1158 = load i64, ptr @DynALUCount, align 8
  %1159 = add i64 %1158, 1
  store i64 %1159, ptr @DynALUCount, align 8
  %1160 = add i32 %1157, %1102
  %1161 = load i64, ptr @DynALUCount, align 8
  %1162 = add i64 %1161, 1
  store i64 %1162, ptr @DynALUCount, align 8
  %1163 = add i32 %1160, %896
  %1164 = tail call i32 @llvm.fshl.i32(i32 %1093, i32 %1093, i32 30)
  %1165 = tail call i32 @llvm.fshl.i32(i32 %1093, i32 %1093, i32 19)
  %1166 = load i64, ptr @DynALUCount, align 8
  %1167 = add i64 %1166, 1
  store i64 %1167, ptr @DynALUCount, align 8
  %1168 = xor i32 %1164, %1165
  %1169 = tail call i32 @llvm.fshl.i32(i32 %1093, i32 %1093, i32 10)
  %1170 = load i64, ptr @DynALUCount, align 8
  %1171 = add i64 %1170, 1
  store i64 %1171, ptr @DynALUCount, align 8
  %1172 = xor i32 %1168, %1169
  %1173 = load i64, ptr @DynALUCount, align 8
  %1174 = add i64 %1173, 1
  store i64 %1174, ptr @DynALUCount, align 8
  %1175 = and i32 %1093, %996
  %1176 = load i64, ptr @DynALUCount, align 8
  %1177 = add i64 %1176, 1
  store i64 %1177, ptr @DynALUCount, align 8
  %1178 = xor i32 %1093, %996
  %1179 = load i64, ptr @DynALUCount, align 8
  %1180 = add i64 %1179, 1
  store i64 %1180, ptr @DynALUCount, align 8
  %1181 = and i32 %1178, %897
  %1182 = load i64, ptr @DynALUCount, align 8
  %1183 = add i64 %1182, 1
  store i64 %1183, ptr @DynALUCount, align 8
  %1184 = xor i32 %1181, %1175
  %1185 = load i64, ptr @DynALUCount, align 8
  %1186 = add i64 %1185, 1
  store i64 %1186, ptr @DynALUCount, align 8
  %1187 = add i32 %1172, %1184
  %1188 = load i64, ptr @DynALUCount, align 8
  %1189 = add i64 %1188, 1
  store i64 %1189, ptr @DynALUCount, align 8
  %1190 = add i32 %1187, %1160
  %1191 = tail call i32 @llvm.fshl.i32(i32 %1163, i32 %1163, i32 26)
  %1192 = tail call i32 @llvm.fshl.i32(i32 %1163, i32 %1163, i32 21)
  %1193 = load i64, ptr @DynALUCount, align 8
  %1194 = add i64 %1193, 1
  store i64 %1194, ptr @DynALUCount, align 8
  %1195 = xor i32 %1191, %1192
  %1196 = tail call i32 @llvm.fshl.i32(i32 %1163, i32 %1163, i32 7)
  %1197 = load i64, ptr @DynALUCount, align 8
  %1198 = add i64 %1197, 1
  store i64 %1198, ptr @DynALUCount, align 8
  %1199 = xor i32 %1195, %1196
  %1200 = load i64, ptr @DynALUCount, align 8
  %1201 = add i64 %1200, 1
  store i64 %1201, ptr @DynALUCount, align 8
  %1202 = xor i32 %1066, %969
  %1203 = load i64, ptr @DynALUCount, align 8
  %1204 = add i64 %1203, 1
  store i64 %1204, ptr @DynALUCount, align 8
  %1205 = and i32 %1163, %1202
  %1206 = load i64, ptr @DynALUCount, align 8
  %1207 = add i64 %1206, 1
  store i64 %1207, ptr @DynALUCount, align 8
  %1208 = xor i32 %1205, %969
  %1209 = load i64, ptr @DynAddressMathCount, align 8
  %1210 = add i64 %1209, 1
  store i64 %1210, ptr @DynAddressMathCount, align 8
  %1211 = getelementptr i8, ptr %898, i64 76
  %1212 = load i64, ptr @DynMemReadCount, align 8
  %1213 = add i64 %1212, 1
  store i64 %1213, ptr @DynMemReadCount, align 8
  %1214 = load i32, ptr %1211, align 4, !tbaa !1
  %1215 = tail call i32 @llvm.fshl.i32(i32 %1051, i32 %1051, i32 15)
  %1216 = tail call i32 @llvm.fshl.i32(i32 %1051, i32 %1051, i32 13)
  %1217 = load i64, ptr @DynALUCount, align 8
  %1218 = add i64 %1217, 1
  store i64 %1218, ptr @DynALUCount, align 8
  %1219 = xor i32 %1215, %1216
  %1220 = load i64, ptr @DynALUCount, align 8
  %1221 = add i64 %1220, 1
  store i64 %1221, ptr @DynALUCount, align 8
  %1222 = lshr i32 %1051, 10
  %1223 = load i64, ptr @DynALUCount, align 8
  %1224 = add i64 %1223, 1
  store i64 %1224, ptr @DynALUCount, align 8
  %1225 = xor i32 %1219, %1222
  %1226 = tail call i32 @llvm.fshl.i32(i32 %879, i32 %879, i32 25)
  %1227 = tail call i32 @llvm.fshl.i32(i32 %879, i32 %879, i32 14)
  %1228 = load i64, ptr @DynALUCount, align 8
  %1229 = add i64 %1228, 1
  store i64 %1229, ptr @DynALUCount, align 8
  %1230 = xor i32 %1226, %1227
  %1231 = load i64, ptr @DynALUCount, align 8
  %1232 = add i64 %1231, 1
  store i64 %1232, ptr @DynALUCount, align 8
  %1233 = lshr i32 %879, 3
  %1234 = load i64, ptr @DynALUCount, align 8
  %1235 = add i64 %1234, 1
  store i64 %1235, ptr @DynALUCount, align 8
  %1236 = xor i32 %1230, %1233
  %1237 = load i64, ptr @DynALUCount, align 8
  %1238 = add i64 %1237, 1
  store i64 %1238, ptr @DynALUCount, align 8
  %1239 = add i32 %880, %881
  %1240 = load i64, ptr @DynALUCount, align 8
  %1241 = add i64 %1240, 1
  store i64 %1241, ptr @DynALUCount, align 8
  %1242 = add i32 %1239, %1225
  %1243 = load i64, ptr @DynALUCount, align 8
  %1244 = add i64 %1243, 1
  store i64 %1244, ptr @DynALUCount, align 8
  %1245 = add i32 %1242, %1236
  %1246 = load i64, ptr @DynALUCount, align 8
  %1247 = add i64 %1246, 1
  store i64 %1247, ptr @DynALUCount, align 8
  %1248 = add i32 %1214, %893
  %1249 = load i64, ptr @DynALUCount, align 8
  %1250 = add i64 %1249, 1
  store i64 %1250, ptr @DynALUCount, align 8
  %1251 = add i32 %1248, %1245
  %1252 = load i64, ptr @DynALUCount, align 8
  %1253 = add i64 %1252, 1
  store i64 %1253, ptr @DynALUCount, align 8
  %1254 = add i32 %1251, %1208
  %1255 = load i64, ptr @DynALUCount, align 8
  %1256 = add i64 %1255, 1
  store i64 %1256, ptr @DynALUCount, align 8
  %1257 = add i32 %1254, %1199
  %1258 = load i64, ptr @DynALUCount, align 8
  %1259 = add i64 %1258, 1
  store i64 %1259, ptr @DynALUCount, align 8
  %1260 = add i32 %1257, %897
  %1261 = tail call i32 @llvm.fshl.i32(i32 %1190, i32 %1190, i32 30)
  %1262 = tail call i32 @llvm.fshl.i32(i32 %1190, i32 %1190, i32 19)
  %1263 = load i64, ptr @DynALUCount, align 8
  %1264 = add i64 %1263, 1
  store i64 %1264, ptr @DynALUCount, align 8
  %1265 = xor i32 %1261, %1262
  %1266 = tail call i32 @llvm.fshl.i32(i32 %1190, i32 %1190, i32 10)
  %1267 = load i64, ptr @DynALUCount, align 8
  %1268 = add i64 %1267, 1
  store i64 %1268, ptr @DynALUCount, align 8
  %1269 = xor i32 %1265, %1266
  %1270 = load i64, ptr @DynALUCount, align 8
  %1271 = add i64 %1270, 1
  store i64 %1271, ptr @DynALUCount, align 8
  %1272 = and i32 %1190, %1093
  %1273 = load i64, ptr @DynALUCount, align 8
  %1274 = add i64 %1273, 1
  store i64 %1274, ptr @DynALUCount, align 8
  %1275 = xor i32 %1190, %1093
  %1276 = load i64, ptr @DynALUCount, align 8
  %1277 = add i64 %1276, 1
  store i64 %1277, ptr @DynALUCount, align 8
  %1278 = and i32 %1275, %996
  %1279 = load i64, ptr @DynALUCount, align 8
  %1280 = add i64 %1279, 1
  store i64 %1280, ptr @DynALUCount, align 8
  %1281 = xor i32 %1278, %1272
  %1282 = load i64, ptr @DynALUCount, align 8
  %1283 = add i64 %1282, 1
  store i64 %1283, ptr @DynALUCount, align 8
  %1284 = add i32 %1269, %1281
  %1285 = load i64, ptr @DynALUCount, align 8
  %1286 = add i64 %1285, 1
  store i64 %1286, ptr @DynALUCount, align 8
  %1287 = add i32 %1284, %1257
  %1288 = tail call i32 @llvm.fshl.i32(i32 %1260, i32 %1260, i32 26)
  %1289 = tail call i32 @llvm.fshl.i32(i32 %1260, i32 %1260, i32 21)
  %1290 = load i64, ptr @DynALUCount, align 8
  %1291 = add i64 %1290, 1
  store i64 %1291, ptr @DynALUCount, align 8
  %1292 = xor i32 %1288, %1289
  %1293 = tail call i32 @llvm.fshl.i32(i32 %1260, i32 %1260, i32 7)
  %1294 = load i64, ptr @DynALUCount, align 8
  %1295 = add i64 %1294, 1
  store i64 %1295, ptr @DynALUCount, align 8
  %1296 = xor i32 %1292, %1293
  %1297 = load i64, ptr @DynALUCount, align 8
  %1298 = add i64 %1297, 1
  store i64 %1298, ptr @DynALUCount, align 8
  %1299 = xor i32 %1163, %1066
  %1300 = load i64, ptr @DynALUCount, align 8
  %1301 = add i64 %1300, 1
  store i64 %1301, ptr @DynALUCount, align 8
  %1302 = and i32 %1260, %1299
  %1303 = load i64, ptr @DynALUCount, align 8
  %1304 = add i64 %1303, 1
  store i64 %1304, ptr @DynALUCount, align 8
  %1305 = xor i32 %1302, %1066
  %1306 = load i64, ptr @DynAddressMathCount, align 8
  %1307 = add i64 %1306, 1
  store i64 %1307, ptr @DynAddressMathCount, align 8
  %1308 = getelementptr i8, ptr %898, i64 80
  %1309 = load i64, ptr @DynMemReadCount, align 8
  %1310 = add i64 %1309, 1
  store i64 %1310, ptr @DynMemReadCount, align 8
  %1311 = load i32, ptr %1308, align 4, !tbaa !1
  %1312 = tail call i32 @llvm.fshl.i32(i32 %1148, i32 %1148, i32 15)
  %1313 = tail call i32 @llvm.fshl.i32(i32 %1148, i32 %1148, i32 13)
  %1314 = load i64, ptr @DynALUCount, align 8
  %1315 = add i64 %1314, 1
  store i64 %1315, ptr @DynALUCount, align 8
  %1316 = xor i32 %1312, %1313
  %1317 = load i64, ptr @DynALUCount, align 8
  %1318 = add i64 %1317, 1
  store i64 %1318, ptr @DynALUCount, align 8
  %1319 = lshr i32 %1148, 10
  %1320 = load i64, ptr @DynALUCount, align 8
  %1321 = add i64 %1320, 1
  store i64 %1321, ptr @DynALUCount, align 8
  %1322 = xor i32 %1316, %1319
  %1323 = tail call i32 @llvm.fshl.i32(i32 %877, i32 %877, i32 25)
  %1324 = tail call i32 @llvm.fshl.i32(i32 %877, i32 %877, i32 14)
  %1325 = load i64, ptr @DynALUCount, align 8
  %1326 = add i64 %1325, 1
  store i64 %1326, ptr @DynALUCount, align 8
  %1327 = xor i32 %1323, %1324
  %1328 = load i64, ptr @DynALUCount, align 8
  %1329 = add i64 %1328, 1
  store i64 %1329, ptr @DynALUCount, align 8
  %1330 = lshr i32 %877, 3
  %1331 = load i64, ptr @DynALUCount, align 8
  %1332 = add i64 %1331, 1
  store i64 %1332, ptr @DynALUCount, align 8
  %1333 = xor i32 %1327, %1330
  %1334 = load i64, ptr @DynALUCount, align 8
  %1335 = add i64 %1334, 1
  store i64 %1335, ptr @DynALUCount, align 8
  %1336 = add i32 %878, %879
  %1337 = load i64, ptr @DynALUCount, align 8
  %1338 = add i64 %1337, 1
  store i64 %1338, ptr @DynALUCount, align 8
  %1339 = add i32 %1336, %1322
  %1340 = load i64, ptr @DynALUCount, align 8
  %1341 = add i64 %1340, 1
  store i64 %1341, ptr @DynALUCount, align 8
  %1342 = add i32 %1339, %1333
  %1343 = load i64, ptr @DynALUCount, align 8
  %1344 = add i64 %1343, 1
  store i64 %1344, ptr @DynALUCount, align 8
  %1345 = add i32 %1311, %969
  %1346 = load i64, ptr @DynALUCount, align 8
  %1347 = add i64 %1346, 1
  store i64 %1347, ptr @DynALUCount, align 8
  %1348 = add i32 %1345, %1342
  %1349 = load i64, ptr @DynALUCount, align 8
  %1350 = add i64 %1349, 1
  store i64 %1350, ptr @DynALUCount, align 8
  %1351 = add i32 %1348, %1305
  %1352 = load i64, ptr @DynALUCount, align 8
  %1353 = add i64 %1352, 1
  store i64 %1353, ptr @DynALUCount, align 8
  %1354 = add i32 %1351, %1296
  %1355 = load i64, ptr @DynALUCount, align 8
  %1356 = add i64 %1355, 1
  store i64 %1356, ptr @DynALUCount, align 8
  %1357 = add i32 %1354, %996
  %1358 = tail call i32 @llvm.fshl.i32(i32 %1287, i32 %1287, i32 30)
  %1359 = tail call i32 @llvm.fshl.i32(i32 %1287, i32 %1287, i32 19)
  %1360 = load i64, ptr @DynALUCount, align 8
  %1361 = add i64 %1360, 1
  store i64 %1361, ptr @DynALUCount, align 8
  %1362 = xor i32 %1358, %1359
  %1363 = tail call i32 @llvm.fshl.i32(i32 %1287, i32 %1287, i32 10)
  %1364 = load i64, ptr @DynALUCount, align 8
  %1365 = add i64 %1364, 1
  store i64 %1365, ptr @DynALUCount, align 8
  %1366 = xor i32 %1362, %1363
  %1367 = load i64, ptr @DynALUCount, align 8
  %1368 = add i64 %1367, 1
  store i64 %1368, ptr @DynALUCount, align 8
  %1369 = and i32 %1287, %1190
  %1370 = load i64, ptr @DynALUCount, align 8
  %1371 = add i64 %1370, 1
  store i64 %1371, ptr @DynALUCount, align 8
  %1372 = xor i32 %1287, %1190
  %1373 = load i64, ptr @DynALUCount, align 8
  %1374 = add i64 %1373, 1
  store i64 %1374, ptr @DynALUCount, align 8
  %1375 = and i32 %1372, %1093
  %1376 = load i64, ptr @DynALUCount, align 8
  %1377 = add i64 %1376, 1
  store i64 %1377, ptr @DynALUCount, align 8
  %1378 = xor i32 %1375, %1369
  %1379 = load i64, ptr @DynALUCount, align 8
  %1380 = add i64 %1379, 1
  store i64 %1380, ptr @DynALUCount, align 8
  %1381 = add i32 %1366, %1378
  %1382 = load i64, ptr @DynALUCount, align 8
  %1383 = add i64 %1382, 1
  store i64 %1383, ptr @DynALUCount, align 8
  %1384 = add i32 %1381, %1354
  %1385 = tail call i32 @llvm.fshl.i32(i32 %1357, i32 %1357, i32 26)
  %1386 = tail call i32 @llvm.fshl.i32(i32 %1357, i32 %1357, i32 21)
  %1387 = load i64, ptr @DynALUCount, align 8
  %1388 = add i64 %1387, 1
  store i64 %1388, ptr @DynALUCount, align 8
  %1389 = xor i32 %1385, %1386
  %1390 = tail call i32 @llvm.fshl.i32(i32 %1357, i32 %1357, i32 7)
  %1391 = load i64, ptr @DynALUCount, align 8
  %1392 = add i64 %1391, 1
  store i64 %1392, ptr @DynALUCount, align 8
  %1393 = xor i32 %1389, %1390
  %1394 = load i64, ptr @DynALUCount, align 8
  %1395 = add i64 %1394, 1
  store i64 %1395, ptr @DynALUCount, align 8
  %1396 = xor i32 %1260, %1163
  %1397 = load i64, ptr @DynALUCount, align 8
  %1398 = add i64 %1397, 1
  store i64 %1398, ptr @DynALUCount, align 8
  %1399 = and i32 %1357, %1396
  %1400 = load i64, ptr @DynALUCount, align 8
  %1401 = add i64 %1400, 1
  store i64 %1401, ptr @DynALUCount, align 8
  %1402 = xor i32 %1399, %1163
  %1403 = load i64, ptr @DynAddressMathCount, align 8
  %1404 = add i64 %1403, 1
  store i64 %1404, ptr @DynAddressMathCount, align 8
  %1405 = getelementptr i8, ptr %898, i64 84
  %1406 = load i64, ptr @DynMemReadCount, align 8
  %1407 = add i64 %1406, 1
  store i64 %1407, ptr @DynMemReadCount, align 8
  %1408 = load i32, ptr %1405, align 4, !tbaa !1
  %1409 = tail call i32 @llvm.fshl.i32(i32 %1245, i32 %1245, i32 15)
  %1410 = tail call i32 @llvm.fshl.i32(i32 %1245, i32 %1245, i32 13)
  %1411 = load i64, ptr @DynALUCount, align 8
  %1412 = add i64 %1411, 1
  store i64 %1412, ptr @DynALUCount, align 8
  %1413 = xor i32 %1409, %1410
  %1414 = load i64, ptr @DynALUCount, align 8
  %1415 = add i64 %1414, 1
  store i64 %1415, ptr @DynALUCount, align 8
  %1416 = lshr i32 %1245, 10
  %1417 = load i64, ptr @DynALUCount, align 8
  %1418 = add i64 %1417, 1
  store i64 %1418, ptr @DynALUCount, align 8
  %1419 = xor i32 %1413, %1416
  %1420 = tail call i32 @llvm.fshl.i32(i32 %876, i32 %876, i32 25)
  %1421 = tail call i32 @llvm.fshl.i32(i32 %876, i32 %876, i32 14)
  %1422 = load i64, ptr @DynALUCount, align 8
  %1423 = add i64 %1422, 1
  store i64 %1423, ptr @DynALUCount, align 8
  %1424 = xor i32 %1420, %1421
  %1425 = load i64, ptr @DynALUCount, align 8
  %1426 = add i64 %1425, 1
  store i64 %1426, ptr @DynALUCount, align 8
  %1427 = lshr i32 %876, 3
  %1428 = load i64, ptr @DynALUCount, align 8
  %1429 = add i64 %1428, 1
  store i64 %1429, ptr @DynALUCount, align 8
  %1430 = xor i32 %1424, %1427
  %1431 = load i64, ptr @DynALUCount, align 8
  %1432 = add i64 %1431, 1
  store i64 %1432, ptr @DynALUCount, align 8
  %1433 = add i32 %877, %888
  %1434 = load i64, ptr @DynALUCount, align 8
  %1435 = add i64 %1434, 1
  store i64 %1435, ptr @DynALUCount, align 8
  %1436 = add i32 %1433, %1419
  %1437 = load i64, ptr @DynALUCount, align 8
  %1438 = add i64 %1437, 1
  store i64 %1438, ptr @DynALUCount, align 8
  %1439 = add i32 %1436, %1430
  %1440 = load i64, ptr @DynALUCount, align 8
  %1441 = add i64 %1440, 1
  store i64 %1441, ptr @DynALUCount, align 8
  %1442 = add i32 %1408, %1066
  %1443 = load i64, ptr @DynALUCount, align 8
  %1444 = add i64 %1443, 1
  store i64 %1444, ptr @DynALUCount, align 8
  %1445 = add i32 %1442, %1439
  %1446 = load i64, ptr @DynALUCount, align 8
  %1447 = add i64 %1446, 1
  store i64 %1447, ptr @DynALUCount, align 8
  %1448 = add i32 %1445, %1402
  %1449 = load i64, ptr @DynALUCount, align 8
  %1450 = add i64 %1449, 1
  store i64 %1450, ptr @DynALUCount, align 8
  %1451 = add i32 %1448, %1393
  %1452 = load i64, ptr @DynALUCount, align 8
  %1453 = add i64 %1452, 1
  store i64 %1453, ptr @DynALUCount, align 8
  %1454 = add i32 %1451, %1093
  %1455 = tail call i32 @llvm.fshl.i32(i32 %1384, i32 %1384, i32 30)
  %1456 = tail call i32 @llvm.fshl.i32(i32 %1384, i32 %1384, i32 19)
  %1457 = load i64, ptr @DynALUCount, align 8
  %1458 = add i64 %1457, 1
  store i64 %1458, ptr @DynALUCount, align 8
  %1459 = xor i32 %1455, %1456
  %1460 = tail call i32 @llvm.fshl.i32(i32 %1384, i32 %1384, i32 10)
  %1461 = load i64, ptr @DynALUCount, align 8
  %1462 = add i64 %1461, 1
  store i64 %1462, ptr @DynALUCount, align 8
  %1463 = xor i32 %1459, %1460
  %1464 = load i64, ptr @DynALUCount, align 8
  %1465 = add i64 %1464, 1
  store i64 %1465, ptr @DynALUCount, align 8
  %1466 = and i32 %1384, %1287
  %1467 = load i64, ptr @DynALUCount, align 8
  %1468 = add i64 %1467, 1
  store i64 %1468, ptr @DynALUCount, align 8
  %1469 = xor i32 %1384, %1287
  %1470 = load i64, ptr @DynALUCount, align 8
  %1471 = add i64 %1470, 1
  store i64 %1471, ptr @DynALUCount, align 8
  %1472 = and i32 %1469, %1190
  %1473 = load i64, ptr @DynALUCount, align 8
  %1474 = add i64 %1473, 1
  store i64 %1474, ptr @DynALUCount, align 8
  %1475 = xor i32 %1472, %1466
  %1476 = load i64, ptr @DynALUCount, align 8
  %1477 = add i64 %1476, 1
  store i64 %1477, ptr @DynALUCount, align 8
  %1478 = add i32 %1463, %1475
  %1479 = load i64, ptr @DynALUCount, align 8
  %1480 = add i64 %1479, 1
  store i64 %1480, ptr @DynALUCount, align 8
  %1481 = add i32 %1478, %1451
  %1482 = tail call i32 @llvm.fshl.i32(i32 %1454, i32 %1454, i32 26)
  %1483 = tail call i32 @llvm.fshl.i32(i32 %1454, i32 %1454, i32 21)
  %1484 = load i64, ptr @DynALUCount, align 8
  %1485 = add i64 %1484, 1
  store i64 %1485, ptr @DynALUCount, align 8
  %1486 = xor i32 %1482, %1483
  %1487 = tail call i32 @llvm.fshl.i32(i32 %1454, i32 %1454, i32 7)
  %1488 = load i64, ptr @DynALUCount, align 8
  %1489 = add i64 %1488, 1
  store i64 %1489, ptr @DynALUCount, align 8
  %1490 = xor i32 %1486, %1487
  %1491 = load i64, ptr @DynALUCount, align 8
  %1492 = add i64 %1491, 1
  store i64 %1492, ptr @DynALUCount, align 8
  %1493 = xor i32 %1357, %1260
  %1494 = load i64, ptr @DynALUCount, align 8
  %1495 = add i64 %1494, 1
  store i64 %1495, ptr @DynALUCount, align 8
  %1496 = and i32 %1454, %1493
  %1497 = load i64, ptr @DynALUCount, align 8
  %1498 = add i64 %1497, 1
  store i64 %1498, ptr @DynALUCount, align 8
  %1499 = xor i32 %1496, %1260
  %1500 = load i64, ptr @DynAddressMathCount, align 8
  %1501 = add i64 %1500, 1
  store i64 %1501, ptr @DynAddressMathCount, align 8
  %1502 = getelementptr i8, ptr %898, i64 88
  %1503 = load i64, ptr @DynMemReadCount, align 8
  %1504 = add i64 %1503, 1
  store i64 %1504, ptr @DynMemReadCount, align 8
  %1505 = load i32, ptr %1502, align 4, !tbaa !1
  %1506 = tail call i32 @llvm.fshl.i32(i32 %1342, i32 %1342, i32 15)
  %1507 = tail call i32 @llvm.fshl.i32(i32 %1342, i32 %1342, i32 13)
  %1508 = load i64, ptr @DynALUCount, align 8
  %1509 = add i64 %1508, 1
  store i64 %1509, ptr @DynALUCount, align 8
  %1510 = xor i32 %1506, %1507
  %1511 = load i64, ptr @DynALUCount, align 8
  %1512 = add i64 %1511, 1
  store i64 %1512, ptr @DynALUCount, align 8
  %1513 = lshr i32 %1342, 10
  %1514 = load i64, ptr @DynALUCount, align 8
  %1515 = add i64 %1514, 1
  store i64 %1515, ptr @DynALUCount, align 8
  %1516 = xor i32 %1510, %1513
  %1517 = tail call i32 @llvm.fshl.i32(i32 %875, i32 %875, i32 25)
  %1518 = tail call i32 @llvm.fshl.i32(i32 %875, i32 %875, i32 14)
  %1519 = load i64, ptr @DynALUCount, align 8
  %1520 = add i64 %1519, 1
  store i64 %1520, ptr @DynALUCount, align 8
  %1521 = xor i32 %1517, %1518
  %1522 = load i64, ptr @DynALUCount, align 8
  %1523 = add i64 %1522, 1
  store i64 %1523, ptr @DynALUCount, align 8
  %1524 = lshr i32 %875, 3
  %1525 = load i64, ptr @DynALUCount, align 8
  %1526 = add i64 %1525, 1
  store i64 %1526, ptr @DynALUCount, align 8
  %1527 = xor i32 %1521, %1524
  %1528 = load i64, ptr @DynALUCount, align 8
  %1529 = add i64 %1528, 1
  store i64 %1529, ptr @DynALUCount, align 8
  %1530 = add i32 %876, %885
  %1531 = load i64, ptr @DynALUCount, align 8
  %1532 = add i64 %1531, 1
  store i64 %1532, ptr @DynALUCount, align 8
  %1533 = add i32 %1530, %1516
  %1534 = load i64, ptr @DynALUCount, align 8
  %1535 = add i64 %1534, 1
  store i64 %1535, ptr @DynALUCount, align 8
  %1536 = add i32 %1533, %1527
  %1537 = load i64, ptr @DynALUCount, align 8
  %1538 = add i64 %1537, 1
  store i64 %1538, ptr @DynALUCount, align 8
  %1539 = add i32 %1163, %1505
  %1540 = load i64, ptr @DynALUCount, align 8
  %1541 = add i64 %1540, 1
  store i64 %1541, ptr @DynALUCount, align 8
  %1542 = add i32 %1539, %1536
  %1543 = load i64, ptr @DynALUCount, align 8
  %1544 = add i64 %1543, 1
  store i64 %1544, ptr @DynALUCount, align 8
  %1545 = add i32 %1542, %1499
  %1546 = load i64, ptr @DynALUCount, align 8
  %1547 = add i64 %1546, 1
  store i64 %1547, ptr @DynALUCount, align 8
  %1548 = add i32 %1545, %1490
  %1549 = load i64, ptr @DynALUCount, align 8
  %1550 = add i64 %1549, 1
  store i64 %1550, ptr @DynALUCount, align 8
  %1551 = add i32 %1548, %1190
  %1552 = tail call i32 @llvm.fshl.i32(i32 %1481, i32 %1481, i32 30)
  %1553 = tail call i32 @llvm.fshl.i32(i32 %1481, i32 %1481, i32 19)
  %1554 = load i64, ptr @DynALUCount, align 8
  %1555 = add i64 %1554, 1
  store i64 %1555, ptr @DynALUCount, align 8
  %1556 = xor i32 %1552, %1553
  %1557 = tail call i32 @llvm.fshl.i32(i32 %1481, i32 %1481, i32 10)
  %1558 = load i64, ptr @DynALUCount, align 8
  %1559 = add i64 %1558, 1
  store i64 %1559, ptr @DynALUCount, align 8
  %1560 = xor i32 %1556, %1557
  %1561 = load i64, ptr @DynALUCount, align 8
  %1562 = add i64 %1561, 1
  store i64 %1562, ptr @DynALUCount, align 8
  %1563 = and i32 %1481, %1384
  %1564 = load i64, ptr @DynALUCount, align 8
  %1565 = add i64 %1564, 1
  store i64 %1565, ptr @DynALUCount, align 8
  %1566 = xor i32 %1481, %1384
  %1567 = load i64, ptr @DynALUCount, align 8
  %1568 = add i64 %1567, 1
  store i64 %1568, ptr @DynALUCount, align 8
  %1569 = and i32 %1566, %1287
  %1570 = load i64, ptr @DynALUCount, align 8
  %1571 = add i64 %1570, 1
  store i64 %1571, ptr @DynALUCount, align 8
  %1572 = xor i32 %1569, %1563
  %1573 = load i64, ptr @DynALUCount, align 8
  %1574 = add i64 %1573, 1
  store i64 %1574, ptr @DynALUCount, align 8
  %1575 = add i32 %1560, %1572
  %1576 = load i64, ptr @DynALUCount, align 8
  %1577 = add i64 %1576, 1
  store i64 %1577, ptr @DynALUCount, align 8
  %1578 = add i32 %1575, %1548
  %1579 = tail call i32 @llvm.fshl.i32(i32 %1551, i32 %1551, i32 26)
  %1580 = tail call i32 @llvm.fshl.i32(i32 %1551, i32 %1551, i32 21)
  %1581 = load i64, ptr @DynALUCount, align 8
  %1582 = add i64 %1581, 1
  store i64 %1582, ptr @DynALUCount, align 8
  %1583 = xor i32 %1579, %1580
  %1584 = tail call i32 @llvm.fshl.i32(i32 %1551, i32 %1551, i32 7)
  %1585 = load i64, ptr @DynALUCount, align 8
  %1586 = add i64 %1585, 1
  store i64 %1586, ptr @DynALUCount, align 8
  %1587 = xor i32 %1583, %1584
  %1588 = load i64, ptr @DynALUCount, align 8
  %1589 = add i64 %1588, 1
  store i64 %1589, ptr @DynALUCount, align 8
  %1590 = xor i32 %1454, %1357
  %1591 = load i64, ptr @DynALUCount, align 8
  %1592 = add i64 %1591, 1
  store i64 %1592, ptr @DynALUCount, align 8
  %1593 = and i32 %1551, %1590
  %1594 = load i64, ptr @DynALUCount, align 8
  %1595 = add i64 %1594, 1
  store i64 %1595, ptr @DynALUCount, align 8
  %1596 = xor i32 %1593, %1357
  %1597 = load i64, ptr @DynAddressMathCount, align 8
  %1598 = add i64 %1597, 1
  store i64 %1598, ptr @DynAddressMathCount, align 8
  %1599 = getelementptr i8, ptr %898, i64 92
  %1600 = load i64, ptr @DynMemReadCount, align 8
  %1601 = add i64 %1600, 1
  store i64 %1601, ptr @DynMemReadCount, align 8
  %1602 = load i32, ptr %1599, align 4, !tbaa !1
  %1603 = tail call i32 @llvm.fshl.i32(i32 %1439, i32 %1439, i32 15)
  %1604 = tail call i32 @llvm.fshl.i32(i32 %1439, i32 %1439, i32 13)
  %1605 = load i64, ptr @DynALUCount, align 8
  %1606 = add i64 %1605, 1
  store i64 %1606, ptr @DynALUCount, align 8
  %1607 = xor i32 %1603, %1604
  %1608 = load i64, ptr @DynALUCount, align 8
  %1609 = add i64 %1608, 1
  store i64 %1609, ptr @DynALUCount, align 8
  %1610 = lshr i32 %1439, 10
  %1611 = load i64, ptr @DynALUCount, align 8
  %1612 = add i64 %1611, 1
  store i64 %1612, ptr @DynALUCount, align 8
  %1613 = xor i32 %1607, %1610
  %1614 = tail call i32 @llvm.fshl.i32(i32 %874, i32 %874, i32 25)
  %1615 = tail call i32 @llvm.fshl.i32(i32 %874, i32 %874, i32 14)
  %1616 = load i64, ptr @DynALUCount, align 8
  %1617 = add i64 %1616, 1
  store i64 %1617, ptr @DynALUCount, align 8
  %1618 = xor i32 %1614, %1615
  %1619 = load i64, ptr @DynALUCount, align 8
  %1620 = add i64 %1619, 1
  store i64 %1620, ptr @DynALUCount, align 8
  %1621 = lshr i32 %874, 3
  %1622 = load i64, ptr @DynALUCount, align 8
  %1623 = add i64 %1622, 1
  store i64 %1623, ptr @DynALUCount, align 8
  %1624 = xor i32 %1618, %1621
  %1625 = load i64, ptr @DynALUCount, align 8
  %1626 = add i64 %1625, 1
  store i64 %1626, ptr @DynALUCount, align 8
  %1627 = add i32 %875, %954
  %1628 = load i64, ptr @DynALUCount, align 8
  %1629 = add i64 %1628, 1
  store i64 %1629, ptr @DynALUCount, align 8
  %1630 = add i32 %1627, %1613
  %1631 = load i64, ptr @DynALUCount, align 8
  %1632 = add i64 %1631, 1
  store i64 %1632, ptr @DynALUCount, align 8
  %1633 = add i32 %1630, %1624
  %1634 = load i64, ptr @DynALUCount, align 8
  %1635 = add i64 %1634, 1
  store i64 %1635, ptr @DynALUCount, align 8
  %1636 = add i32 %1633, %1602
  %1637 = load i64, ptr @DynALUCount, align 8
  %1638 = add i64 %1637, 1
  store i64 %1638, ptr @DynALUCount, align 8
  %1639 = add i32 %1636, %1260
  %1640 = load i64, ptr @DynALUCount, align 8
  %1641 = add i64 %1640, 1
  store i64 %1641, ptr @DynALUCount, align 8
  %1642 = add i32 %1639, %1596
  %1643 = load i64, ptr @DynALUCount, align 8
  %1644 = add i64 %1643, 1
  store i64 %1644, ptr @DynALUCount, align 8
  %1645 = add i32 %1642, %1587
  %1646 = load i64, ptr @DynALUCount, align 8
  %1647 = add i64 %1646, 1
  store i64 %1647, ptr @DynALUCount, align 8
  %1648 = add i32 %1645, %1287
  %1649 = tail call i32 @llvm.fshl.i32(i32 %1578, i32 %1578, i32 30)
  %1650 = tail call i32 @llvm.fshl.i32(i32 %1578, i32 %1578, i32 19)
  %1651 = load i64, ptr @DynALUCount, align 8
  %1652 = add i64 %1651, 1
  store i64 %1652, ptr @DynALUCount, align 8
  %1653 = xor i32 %1649, %1650
  %1654 = tail call i32 @llvm.fshl.i32(i32 %1578, i32 %1578, i32 10)
  %1655 = load i64, ptr @DynALUCount, align 8
  %1656 = add i64 %1655, 1
  store i64 %1656, ptr @DynALUCount, align 8
  %1657 = xor i32 %1653, %1654
  %1658 = load i64, ptr @DynALUCount, align 8
  %1659 = add i64 %1658, 1
  store i64 %1659, ptr @DynALUCount, align 8
  %1660 = and i32 %1578, %1481
  %1661 = load i64, ptr @DynALUCount, align 8
  %1662 = add i64 %1661, 1
  store i64 %1662, ptr @DynALUCount, align 8
  %1663 = xor i32 %1578, %1481
  %1664 = load i64, ptr @DynALUCount, align 8
  %1665 = add i64 %1664, 1
  store i64 %1665, ptr @DynALUCount, align 8
  %1666 = and i32 %1663, %1384
  %1667 = load i64, ptr @DynALUCount, align 8
  %1668 = add i64 %1667, 1
  store i64 %1668, ptr @DynALUCount, align 8
  %1669 = xor i32 %1666, %1660
  %1670 = load i64, ptr @DynALUCount, align 8
  %1671 = add i64 %1670, 1
  store i64 %1671, ptr @DynALUCount, align 8
  %1672 = add i32 %1657, %1669
  %1673 = load i64, ptr @DynALUCount, align 8
  %1674 = add i64 %1673, 1
  store i64 %1674, ptr @DynALUCount, align 8
  %1675 = add i32 %1672, %1645
  %1676 = tail call i32 @llvm.fshl.i32(i32 %1648, i32 %1648, i32 26)
  %1677 = tail call i32 @llvm.fshl.i32(i32 %1648, i32 %1648, i32 21)
  %1678 = load i64, ptr @DynALUCount, align 8
  %1679 = add i64 %1678, 1
  store i64 %1679, ptr @DynALUCount, align 8
  %1680 = xor i32 %1676, %1677
  %1681 = tail call i32 @llvm.fshl.i32(i32 %1648, i32 %1648, i32 7)
  %1682 = load i64, ptr @DynALUCount, align 8
  %1683 = add i64 %1682, 1
  store i64 %1683, ptr @DynALUCount, align 8
  %1684 = xor i32 %1680, %1681
  %1685 = load i64, ptr @DynALUCount, align 8
  %1686 = add i64 %1685, 1
  store i64 %1686, ptr @DynALUCount, align 8
  %1687 = xor i32 %1551, %1454
  %1688 = load i64, ptr @DynALUCount, align 8
  %1689 = add i64 %1688, 1
  store i64 %1689, ptr @DynALUCount, align 8
  %1690 = and i32 %1648, %1687
  %1691 = load i64, ptr @DynALUCount, align 8
  %1692 = add i64 %1691, 1
  store i64 %1692, ptr @DynALUCount, align 8
  %1693 = xor i32 %1690, %1454
  %1694 = load i64, ptr @DynAddressMathCount, align 8
  %1695 = add i64 %1694, 1
  store i64 %1695, ptr @DynAddressMathCount, align 8
  %1696 = getelementptr i8, ptr %898, i64 96
  %1697 = load i64, ptr @DynMemReadCount, align 8
  %1698 = add i64 %1697, 1
  store i64 %1698, ptr @DynMemReadCount, align 8
  %1699 = load i32, ptr %1696, align 4, !tbaa !1
  %1700 = tail call i32 @llvm.fshl.i32(i32 %1536, i32 %1536, i32 15)
  %1701 = tail call i32 @llvm.fshl.i32(i32 %1536, i32 %1536, i32 13)
  %1702 = load i64, ptr @DynALUCount, align 8
  %1703 = add i64 %1702, 1
  store i64 %1703, ptr @DynALUCount, align 8
  %1704 = xor i32 %1700, %1701
  %1705 = load i64, ptr @DynALUCount, align 8
  %1706 = add i64 %1705, 1
  store i64 %1706, ptr @DynALUCount, align 8
  %1707 = lshr i32 %1536, 10
  %1708 = load i64, ptr @DynALUCount, align 8
  %1709 = add i64 %1708, 1
  store i64 %1709, ptr @DynALUCount, align 8
  %1710 = xor i32 %1704, %1707
  %1711 = tail call i32 @llvm.fshl.i32(i32 %887, i32 %887, i32 25)
  %1712 = tail call i32 @llvm.fshl.i32(i32 %887, i32 %887, i32 14)
  %1713 = load i64, ptr @DynALUCount, align 8
  %1714 = add i64 %1713, 1
  store i64 %1714, ptr @DynALUCount, align 8
  %1715 = xor i32 %1711, %1712
  %1716 = load i64, ptr @DynALUCount, align 8
  %1717 = add i64 %1716, 1
  store i64 %1717, ptr @DynALUCount, align 8
  %1718 = lshr i32 %887, 3
  %1719 = load i64, ptr @DynALUCount, align 8
  %1720 = add i64 %1719, 1
  store i64 %1720, ptr @DynALUCount, align 8
  %1721 = xor i32 %1715, %1718
  %1722 = load i64, ptr @DynALUCount, align 8
  %1723 = add i64 %1722, 1
  store i64 %1723, ptr @DynALUCount, align 8
  %1724 = add i32 %1051, %1721
  %1725 = load i64, ptr @DynALUCount, align 8
  %1726 = add i64 %1725, 1
  store i64 %1726, ptr @DynALUCount, align 8
  %1727 = add i32 %1724, %874
  %1728 = load i64, ptr @DynALUCount, align 8
  %1729 = add i64 %1728, 1
  store i64 %1729, ptr @DynALUCount, align 8
  %1730 = add i32 %1727, %1710
  %1731 = load i64, ptr @DynALUCount, align 8
  %1732 = add i64 %1731, 1
  store i64 %1732, ptr @DynALUCount, align 8
  %1733 = add i32 %1730, %1699
  %1734 = load i64, ptr @DynALUCount, align 8
  %1735 = add i64 %1734, 1
  store i64 %1735, ptr @DynALUCount, align 8
  %1736 = add i32 %1733, %1357
  %1737 = load i64, ptr @DynALUCount, align 8
  %1738 = add i64 %1737, 1
  store i64 %1738, ptr @DynALUCount, align 8
  %1739 = add i32 %1736, %1693
  %1740 = load i64, ptr @DynALUCount, align 8
  %1741 = add i64 %1740, 1
  store i64 %1741, ptr @DynALUCount, align 8
  %1742 = add i32 %1739, %1684
  %1743 = load i64, ptr @DynALUCount, align 8
  %1744 = add i64 %1743, 1
  store i64 %1744, ptr @DynALUCount, align 8
  %1745 = add i32 %1742, %1384
  %1746 = tail call i32 @llvm.fshl.i32(i32 %1675, i32 %1675, i32 30)
  %1747 = tail call i32 @llvm.fshl.i32(i32 %1675, i32 %1675, i32 19)
  %1748 = load i64, ptr @DynALUCount, align 8
  %1749 = add i64 %1748, 1
  store i64 %1749, ptr @DynALUCount, align 8
  %1750 = xor i32 %1746, %1747
  %1751 = tail call i32 @llvm.fshl.i32(i32 %1675, i32 %1675, i32 10)
  %1752 = load i64, ptr @DynALUCount, align 8
  %1753 = add i64 %1752, 1
  store i64 %1753, ptr @DynALUCount, align 8
  %1754 = xor i32 %1750, %1751
  %1755 = load i64, ptr @DynALUCount, align 8
  %1756 = add i64 %1755, 1
  store i64 %1756, ptr @DynALUCount, align 8
  %1757 = and i32 %1675, %1578
  %1758 = load i64, ptr @DynALUCount, align 8
  %1759 = add i64 %1758, 1
  store i64 %1759, ptr @DynALUCount, align 8
  %1760 = xor i32 %1675, %1578
  %1761 = load i64, ptr @DynALUCount, align 8
  %1762 = add i64 %1761, 1
  store i64 %1762, ptr @DynALUCount, align 8
  %1763 = and i32 %1760, %1481
  %1764 = load i64, ptr @DynALUCount, align 8
  %1765 = add i64 %1764, 1
  store i64 %1765, ptr @DynALUCount, align 8
  %1766 = xor i32 %1763, %1757
  %1767 = load i64, ptr @DynALUCount, align 8
  %1768 = add i64 %1767, 1
  store i64 %1768, ptr @DynALUCount, align 8
  %1769 = add i32 %1754, %1766
  %1770 = load i64, ptr @DynALUCount, align 8
  %1771 = add i64 %1770, 1
  store i64 %1771, ptr @DynALUCount, align 8
  %1772 = add i32 %1769, %1742
  %1773 = tail call i32 @llvm.fshl.i32(i32 %1745, i32 %1745, i32 26)
  %1774 = tail call i32 @llvm.fshl.i32(i32 %1745, i32 %1745, i32 21)
  %1775 = load i64, ptr @DynALUCount, align 8
  %1776 = add i64 %1775, 1
  store i64 %1776, ptr @DynALUCount, align 8
  %1777 = xor i32 %1773, %1774
  %1778 = tail call i32 @llvm.fshl.i32(i32 %1745, i32 %1745, i32 7)
  %1779 = load i64, ptr @DynALUCount, align 8
  %1780 = add i64 %1779, 1
  store i64 %1780, ptr @DynALUCount, align 8
  %1781 = xor i32 %1777, %1778
  %1782 = load i64, ptr @DynALUCount, align 8
  %1783 = add i64 %1782, 1
  store i64 %1783, ptr @DynALUCount, align 8
  %1784 = xor i32 %1648, %1551
  %1785 = load i64, ptr @DynALUCount, align 8
  %1786 = add i64 %1785, 1
  store i64 %1786, ptr @DynALUCount, align 8
  %1787 = and i32 %1745, %1784
  %1788 = load i64, ptr @DynALUCount, align 8
  %1789 = add i64 %1788, 1
  store i64 %1789, ptr @DynALUCount, align 8
  %1790 = xor i32 %1787, %1551
  %1791 = load i64, ptr @DynAddressMathCount, align 8
  %1792 = add i64 %1791, 1
  store i64 %1792, ptr @DynAddressMathCount, align 8
  %1793 = getelementptr i8, ptr %898, i64 100
  %1794 = load i64, ptr @DynMemReadCount, align 8
  %1795 = add i64 %1794, 1
  store i64 %1795, ptr @DynMemReadCount, align 8
  %1796 = load i32, ptr %1793, align 4, !tbaa !1
  %1797 = tail call i32 @llvm.fshl.i32(i32 %1633, i32 %1633, i32 15)
  %1798 = tail call i32 @llvm.fshl.i32(i32 %1633, i32 %1633, i32 13)
  %1799 = load i64, ptr @DynALUCount, align 8
  %1800 = add i64 %1799, 1
  store i64 %1800, ptr @DynALUCount, align 8
  %1801 = xor i32 %1797, %1798
  %1802 = load i64, ptr @DynALUCount, align 8
  %1803 = add i64 %1802, 1
  store i64 %1803, ptr @DynALUCount, align 8
  %1804 = lshr i32 %1633, 10
  %1805 = load i64, ptr @DynALUCount, align 8
  %1806 = add i64 %1805, 1
  store i64 %1806, ptr @DynALUCount, align 8
  %1807 = xor i32 %1801, %1804
  %1808 = tail call i32 @llvm.fshl.i32(i32 %884, i32 %884, i32 25)
  %1809 = tail call i32 @llvm.fshl.i32(i32 %884, i32 %884, i32 14)
  %1810 = load i64, ptr @DynALUCount, align 8
  %1811 = add i64 %1810, 1
  store i64 %1811, ptr @DynALUCount, align 8
  %1812 = xor i32 %1808, %1809
  %1813 = load i64, ptr @DynALUCount, align 8
  %1814 = add i64 %1813, 1
  store i64 %1814, ptr @DynALUCount, align 8
  %1815 = lshr i32 %884, 3
  %1816 = load i64, ptr @DynALUCount, align 8
  %1817 = add i64 %1816, 1
  store i64 %1817, ptr @DynALUCount, align 8
  %1818 = xor i32 %1812, %1815
  %1819 = load i64, ptr @DynALUCount, align 8
  %1820 = add i64 %1819, 1
  store i64 %1820, ptr @DynALUCount, align 8
  %1821 = add i32 %1818, %887
  %1822 = load i64, ptr @DynALUCount, align 8
  %1823 = add i64 %1822, 1
  store i64 %1823, ptr @DynALUCount, align 8
  %1824 = add i32 %1821, %1148
  %1825 = load i64, ptr @DynALUCount, align 8
  %1826 = add i64 %1825, 1
  store i64 %1826, ptr @DynALUCount, align 8
  %1827 = add i32 %1824, %1807
  %1828 = load i64, ptr @DynALUCount, align 8
  %1829 = add i64 %1828, 1
  store i64 %1829, ptr @DynALUCount, align 8
  %1830 = add i32 %1827, %1796
  %1831 = load i64, ptr @DynALUCount, align 8
  %1832 = add i64 %1831, 1
  store i64 %1832, ptr @DynALUCount, align 8
  %1833 = add i32 %1830, %1454
  %1834 = load i64, ptr @DynALUCount, align 8
  %1835 = add i64 %1834, 1
  store i64 %1835, ptr @DynALUCount, align 8
  %1836 = add i32 %1833, %1790
  %1837 = load i64, ptr @DynALUCount, align 8
  %1838 = add i64 %1837, 1
  store i64 %1838, ptr @DynALUCount, align 8
  %1839 = add i32 %1836, %1781
  %1840 = load i64, ptr @DynALUCount, align 8
  %1841 = add i64 %1840, 1
  store i64 %1841, ptr @DynALUCount, align 8
  %1842 = add i32 %1839, %1481
  %1843 = tail call i32 @llvm.fshl.i32(i32 %1772, i32 %1772, i32 30)
  %1844 = tail call i32 @llvm.fshl.i32(i32 %1772, i32 %1772, i32 19)
  %1845 = load i64, ptr @DynALUCount, align 8
  %1846 = add i64 %1845, 1
  store i64 %1846, ptr @DynALUCount, align 8
  %1847 = xor i32 %1843, %1844
  %1848 = tail call i32 @llvm.fshl.i32(i32 %1772, i32 %1772, i32 10)
  %1849 = load i64, ptr @DynALUCount, align 8
  %1850 = add i64 %1849, 1
  store i64 %1850, ptr @DynALUCount, align 8
  %1851 = xor i32 %1847, %1848
  %1852 = load i64, ptr @DynALUCount, align 8
  %1853 = add i64 %1852, 1
  store i64 %1853, ptr @DynALUCount, align 8
  %1854 = and i32 %1772, %1675
  %1855 = load i64, ptr @DynALUCount, align 8
  %1856 = add i64 %1855, 1
  store i64 %1856, ptr @DynALUCount, align 8
  %1857 = xor i32 %1772, %1675
  %1858 = load i64, ptr @DynALUCount, align 8
  %1859 = add i64 %1858, 1
  store i64 %1859, ptr @DynALUCount, align 8
  %1860 = and i32 %1857, %1578
  %1861 = load i64, ptr @DynALUCount, align 8
  %1862 = add i64 %1861, 1
  store i64 %1862, ptr @DynALUCount, align 8
  %1863 = xor i32 %1860, %1854
  %1864 = load i64, ptr @DynALUCount, align 8
  %1865 = add i64 %1864, 1
  store i64 %1865, ptr @DynALUCount, align 8
  %1866 = add i32 %1851, %1863
  %1867 = load i64, ptr @DynALUCount, align 8
  %1868 = add i64 %1867, 1
  store i64 %1868, ptr @DynALUCount, align 8
  %1869 = add i32 %1866, %1839
  %1870 = tail call i32 @llvm.fshl.i32(i32 %1842, i32 %1842, i32 26)
  %1871 = tail call i32 @llvm.fshl.i32(i32 %1842, i32 %1842, i32 21)
  %1872 = load i64, ptr @DynALUCount, align 8
  %1873 = add i64 %1872, 1
  store i64 %1873, ptr @DynALUCount, align 8
  %1874 = xor i32 %1870, %1871
  %1875 = tail call i32 @llvm.fshl.i32(i32 %1842, i32 %1842, i32 7)
  %1876 = load i64, ptr @DynALUCount, align 8
  %1877 = add i64 %1876, 1
  store i64 %1877, ptr @DynALUCount, align 8
  %1878 = xor i32 %1874, %1875
  %1879 = load i64, ptr @DynALUCount, align 8
  %1880 = add i64 %1879, 1
  store i64 %1880, ptr @DynALUCount, align 8
  %1881 = xor i32 %1745, %1648
  %1882 = load i64, ptr @DynALUCount, align 8
  %1883 = add i64 %1882, 1
  store i64 %1883, ptr @DynALUCount, align 8
  %1884 = and i32 %1842, %1881
  %1885 = load i64, ptr @DynALUCount, align 8
  %1886 = add i64 %1885, 1
  store i64 %1886, ptr @DynALUCount, align 8
  %1887 = xor i32 %1884, %1648
  %1888 = load i64, ptr @DynAddressMathCount, align 8
  %1889 = add i64 %1888, 1
  store i64 %1889, ptr @DynAddressMathCount, align 8
  %1890 = getelementptr i8, ptr %898, i64 104
  %1891 = load i64, ptr @DynMemReadCount, align 8
  %1892 = add i64 %1891, 1
  store i64 %1892, ptr @DynMemReadCount, align 8
  %1893 = load i32, ptr %1890, align 4, !tbaa !1
  %1894 = tail call i32 @llvm.fshl.i32(i32 %1730, i32 %1730, i32 15)
  %1895 = tail call i32 @llvm.fshl.i32(i32 %1730, i32 %1730, i32 13)
  %1896 = load i64, ptr @DynALUCount, align 8
  %1897 = add i64 %1896, 1
  store i64 %1897, ptr @DynALUCount, align 8
  %1898 = xor i32 %1894, %1895
  %1899 = load i64, ptr @DynALUCount, align 8
  %1900 = add i64 %1899, 1
  store i64 %1900, ptr @DynALUCount, align 8
  %1901 = lshr i32 %1730, 10
  %1902 = load i64, ptr @DynALUCount, align 8
  %1903 = add i64 %1902, 1
  store i64 %1903, ptr @DynALUCount, align 8
  %1904 = xor i32 %1898, %1901
  %1905 = tail call i32 @llvm.fshl.i32(i32 %882, i32 %882, i32 25)
  %1906 = tail call i32 @llvm.fshl.i32(i32 %882, i32 %882, i32 14)
  %1907 = load i64, ptr @DynALUCount, align 8
  %1908 = add i64 %1907, 1
  store i64 %1908, ptr @DynALUCount, align 8
  %1909 = xor i32 %1905, %1906
  %1910 = load i64, ptr @DynALUCount, align 8
  %1911 = add i64 %1910, 1
  store i64 %1911, ptr @DynALUCount, align 8
  %1912 = lshr i32 %882, 3
  %1913 = load i64, ptr @DynALUCount, align 8
  %1914 = add i64 %1913, 1
  store i64 %1914, ptr @DynALUCount, align 8
  %1915 = xor i32 %1909, %1912
  %1916 = load i64, ptr @DynALUCount, align 8
  %1917 = add i64 %1916, 1
  store i64 %1917, ptr @DynALUCount, align 8
  %1918 = add i32 %1915, %884
  %1919 = load i64, ptr @DynALUCount, align 8
  %1920 = add i64 %1919, 1
  store i64 %1920, ptr @DynALUCount, align 8
  %1921 = add i32 %1918, %1245
  %1922 = load i64, ptr @DynALUCount, align 8
  %1923 = add i64 %1922, 1
  store i64 %1923, ptr @DynALUCount, align 8
  %1924 = add i32 %1921, %1904
  %1925 = load i64, ptr @DynALUCount, align 8
  %1926 = add i64 %1925, 1
  store i64 %1926, ptr @DynALUCount, align 8
  %1927 = add i32 %1924, %1893
  %1928 = load i64, ptr @DynALUCount, align 8
  %1929 = add i64 %1928, 1
  store i64 %1929, ptr @DynALUCount, align 8
  %1930 = add i32 %1927, %1551
  %1931 = load i64, ptr @DynALUCount, align 8
  %1932 = add i64 %1931, 1
  store i64 %1932, ptr @DynALUCount, align 8
  %1933 = add i32 %1930, %1887
  %1934 = load i64, ptr @DynALUCount, align 8
  %1935 = add i64 %1934, 1
  store i64 %1935, ptr @DynALUCount, align 8
  %1936 = add i32 %1933, %1878
  %1937 = load i64, ptr @DynALUCount, align 8
  %1938 = add i64 %1937, 1
  store i64 %1938, ptr @DynALUCount, align 8
  %1939 = add i32 %1936, %1578
  %1940 = tail call i32 @llvm.fshl.i32(i32 %1869, i32 %1869, i32 30)
  %1941 = tail call i32 @llvm.fshl.i32(i32 %1869, i32 %1869, i32 19)
  %1942 = load i64, ptr @DynALUCount, align 8
  %1943 = add i64 %1942, 1
  store i64 %1943, ptr @DynALUCount, align 8
  %1944 = xor i32 %1940, %1941
  %1945 = tail call i32 @llvm.fshl.i32(i32 %1869, i32 %1869, i32 10)
  %1946 = load i64, ptr @DynALUCount, align 8
  %1947 = add i64 %1946, 1
  store i64 %1947, ptr @DynALUCount, align 8
  %1948 = xor i32 %1944, %1945
  %1949 = load i64, ptr @DynALUCount, align 8
  %1950 = add i64 %1949, 1
  store i64 %1950, ptr @DynALUCount, align 8
  %1951 = and i32 %1869, %1772
  %1952 = load i64, ptr @DynALUCount, align 8
  %1953 = add i64 %1952, 1
  store i64 %1953, ptr @DynALUCount, align 8
  %1954 = xor i32 %1869, %1772
  %1955 = load i64, ptr @DynALUCount, align 8
  %1956 = add i64 %1955, 1
  store i64 %1956, ptr @DynALUCount, align 8
  %1957 = and i32 %1954, %1675
  %1958 = load i64, ptr @DynALUCount, align 8
  %1959 = add i64 %1958, 1
  store i64 %1959, ptr @DynALUCount, align 8
  %1960 = xor i32 %1957, %1951
  %1961 = load i64, ptr @DynALUCount, align 8
  %1962 = add i64 %1961, 1
  store i64 %1962, ptr @DynALUCount, align 8
  %1963 = add i32 %1948, %1960
  %1964 = load i64, ptr @DynALUCount, align 8
  %1965 = add i64 %1964, 1
  store i64 %1965, ptr @DynALUCount, align 8
  %1966 = add i32 %1963, %1936
  %1967 = tail call i32 @llvm.fshl.i32(i32 %1939, i32 %1939, i32 26)
  %1968 = tail call i32 @llvm.fshl.i32(i32 %1939, i32 %1939, i32 21)
  %1969 = load i64, ptr @DynALUCount, align 8
  %1970 = add i64 %1969, 1
  store i64 %1970, ptr @DynALUCount, align 8
  %1971 = xor i32 %1967, %1968
  %1972 = tail call i32 @llvm.fshl.i32(i32 %1939, i32 %1939, i32 7)
  %1973 = load i64, ptr @DynALUCount, align 8
  %1974 = add i64 %1973, 1
  store i64 %1974, ptr @DynALUCount, align 8
  %1975 = xor i32 %1971, %1972
  %1976 = load i64, ptr @DynALUCount, align 8
  %1977 = add i64 %1976, 1
  store i64 %1977, ptr @DynALUCount, align 8
  %1978 = xor i32 %1842, %1745
  %1979 = load i64, ptr @DynALUCount, align 8
  %1980 = add i64 %1979, 1
  store i64 %1980, ptr @DynALUCount, align 8
  %1981 = and i32 %1939, %1978
  %1982 = load i64, ptr @DynALUCount, align 8
  %1983 = add i64 %1982, 1
  store i64 %1983, ptr @DynALUCount, align 8
  %1984 = xor i32 %1981, %1745
  %1985 = load i64, ptr @DynAddressMathCount, align 8
  %1986 = add i64 %1985, 1
  store i64 %1986, ptr @DynAddressMathCount, align 8
  %1987 = getelementptr i8, ptr %898, i64 108
  %1988 = load i64, ptr @DynMemReadCount, align 8
  %1989 = add i64 %1988, 1
  store i64 %1989, ptr @DynMemReadCount, align 8
  %1990 = load i32, ptr %1987, align 4, !tbaa !1
  %1991 = tail call i32 @llvm.fshl.i32(i32 %1827, i32 %1827, i32 15)
  %1992 = tail call i32 @llvm.fshl.i32(i32 %1827, i32 %1827, i32 13)
  %1993 = load i64, ptr @DynALUCount, align 8
  %1994 = add i64 %1993, 1
  store i64 %1994, ptr @DynALUCount, align 8
  %1995 = xor i32 %1991, %1992
  %1996 = load i64, ptr @DynALUCount, align 8
  %1997 = add i64 %1996, 1
  store i64 %1997, ptr @DynALUCount, align 8
  %1998 = lshr i32 %1827, 10
  %1999 = load i64, ptr @DynALUCount, align 8
  %2000 = add i64 %1999, 1
  store i64 %2000, ptr @DynALUCount, align 8
  %2001 = xor i32 %1995, %1998
  %2002 = tail call i32 @llvm.fshl.i32(i32 %880, i32 %880, i32 25)
  %2003 = tail call i32 @llvm.fshl.i32(i32 %880, i32 %880, i32 14)
  %2004 = load i64, ptr @DynALUCount, align 8
  %2005 = add i64 %2004, 1
  store i64 %2005, ptr @DynALUCount, align 8
  %2006 = xor i32 %2002, %2003
  %2007 = load i64, ptr @DynALUCount, align 8
  %2008 = add i64 %2007, 1
  store i64 %2008, ptr @DynALUCount, align 8
  %2009 = lshr i32 %880, 3
  %2010 = load i64, ptr @DynALUCount, align 8
  %2011 = add i64 %2010, 1
  store i64 %2011, ptr @DynALUCount, align 8
  %2012 = xor i32 %2006, %2009
  %2013 = load i64, ptr @DynALUCount, align 8
  %2014 = add i64 %2013, 1
  store i64 %2014, ptr @DynALUCount, align 8
  %2015 = add i32 %2012, %882
  %2016 = load i64, ptr @DynALUCount, align 8
  %2017 = add i64 %2016, 1
  store i64 %2017, ptr @DynALUCount, align 8
  %2018 = add i32 %2015, %1342
  %2019 = load i64, ptr @DynALUCount, align 8
  %2020 = add i64 %2019, 1
  store i64 %2020, ptr @DynALUCount, align 8
  %2021 = add i32 %2018, %2001
  %2022 = load i64, ptr @DynALUCount, align 8
  %2023 = add i64 %2022, 1
  store i64 %2023, ptr @DynALUCount, align 8
  %2024 = add i32 %2021, %1990
  %2025 = load i64, ptr @DynALUCount, align 8
  %2026 = add i64 %2025, 1
  store i64 %2026, ptr @DynALUCount, align 8
  %2027 = add i32 %2024, %1648
  %2028 = load i64, ptr @DynALUCount, align 8
  %2029 = add i64 %2028, 1
  store i64 %2029, ptr @DynALUCount, align 8
  %2030 = add i32 %2027, %1984
  %2031 = load i64, ptr @DynALUCount, align 8
  %2032 = add i64 %2031, 1
  store i64 %2032, ptr @DynALUCount, align 8
  %2033 = add i32 %2030, %1975
  %2034 = load i64, ptr @DynALUCount, align 8
  %2035 = add i64 %2034, 1
  store i64 %2035, ptr @DynALUCount, align 8
  %2036 = add i32 %2033, %1675
  %2037 = tail call i32 @llvm.fshl.i32(i32 %1966, i32 %1966, i32 30)
  %2038 = tail call i32 @llvm.fshl.i32(i32 %1966, i32 %1966, i32 19)
  %2039 = load i64, ptr @DynALUCount, align 8
  %2040 = add i64 %2039, 1
  store i64 %2040, ptr @DynALUCount, align 8
  %2041 = xor i32 %2037, %2038
  %2042 = tail call i32 @llvm.fshl.i32(i32 %1966, i32 %1966, i32 10)
  %2043 = load i64, ptr @DynALUCount, align 8
  %2044 = add i64 %2043, 1
  store i64 %2044, ptr @DynALUCount, align 8
  %2045 = xor i32 %2041, %2042
  %2046 = load i64, ptr @DynALUCount, align 8
  %2047 = add i64 %2046, 1
  store i64 %2047, ptr @DynALUCount, align 8
  %2048 = and i32 %1966, %1869
  %2049 = load i64, ptr @DynALUCount, align 8
  %2050 = add i64 %2049, 1
  store i64 %2050, ptr @DynALUCount, align 8
  %2051 = xor i32 %1966, %1869
  %2052 = load i64, ptr @DynALUCount, align 8
  %2053 = add i64 %2052, 1
  store i64 %2053, ptr @DynALUCount, align 8
  %2054 = and i32 %2051, %1772
  %2055 = load i64, ptr @DynALUCount, align 8
  %2056 = add i64 %2055, 1
  store i64 %2056, ptr @DynALUCount, align 8
  %2057 = xor i32 %2054, %2048
  %2058 = load i64, ptr @DynALUCount, align 8
  %2059 = add i64 %2058, 1
  store i64 %2059, ptr @DynALUCount, align 8
  %2060 = add i32 %2045, %2057
  %2061 = load i64, ptr @DynALUCount, align 8
  %2062 = add i64 %2061, 1
  store i64 %2062, ptr @DynALUCount, align 8
  %2063 = add i32 %2060, %2033
  %2064 = tail call i32 @llvm.fshl.i32(i32 %2036, i32 %2036, i32 26)
  %2065 = tail call i32 @llvm.fshl.i32(i32 %2036, i32 %2036, i32 21)
  %2066 = load i64, ptr @DynALUCount, align 8
  %2067 = add i64 %2066, 1
  store i64 %2067, ptr @DynALUCount, align 8
  %2068 = xor i32 %2064, %2065
  %2069 = tail call i32 @llvm.fshl.i32(i32 %2036, i32 %2036, i32 7)
  %2070 = load i64, ptr @DynALUCount, align 8
  %2071 = add i64 %2070, 1
  store i64 %2071, ptr @DynALUCount, align 8
  %2072 = xor i32 %2068, %2069
  %2073 = load i64, ptr @DynALUCount, align 8
  %2074 = add i64 %2073, 1
  store i64 %2074, ptr @DynALUCount, align 8
  %2075 = xor i32 %1939, %1842
  %2076 = load i64, ptr @DynALUCount, align 8
  %2077 = add i64 %2076, 1
  store i64 %2077, ptr @DynALUCount, align 8
  %2078 = and i32 %2036, %2075
  %2079 = load i64, ptr @DynALUCount, align 8
  %2080 = add i64 %2079, 1
  store i64 %2080, ptr @DynALUCount, align 8
  %2081 = xor i32 %2078, %1842
  %2082 = load i64, ptr @DynAddressMathCount, align 8
  %2083 = add i64 %2082, 1
  store i64 %2083, ptr @DynAddressMathCount, align 8
  %2084 = getelementptr i8, ptr %898, i64 112
  %2085 = load i64, ptr @DynMemReadCount, align 8
  %2086 = add i64 %2085, 1
  store i64 %2086, ptr @DynMemReadCount, align 8
  %2087 = load i32, ptr %2084, align 4, !tbaa !1
  %2088 = tail call i32 @llvm.fshl.i32(i32 %1924, i32 %1924, i32 15)
  %2089 = tail call i32 @llvm.fshl.i32(i32 %1924, i32 %1924, i32 13)
  %2090 = load i64, ptr @DynALUCount, align 8
  %2091 = add i64 %2090, 1
  store i64 %2091, ptr @DynALUCount, align 8
  %2092 = xor i32 %2088, %2089
  %2093 = load i64, ptr @DynALUCount, align 8
  %2094 = add i64 %2093, 1
  store i64 %2094, ptr @DynALUCount, align 8
  %2095 = lshr i32 %1924, 10
  %2096 = load i64, ptr @DynALUCount, align 8
  %2097 = add i64 %2096, 1
  store i64 %2097, ptr @DynALUCount, align 8
  %2098 = xor i32 %2092, %2095
  %2099 = tail call i32 @llvm.fshl.i32(i32 %878, i32 %878, i32 25)
  %2100 = tail call i32 @llvm.fshl.i32(i32 %878, i32 %878, i32 14)
  %2101 = load i64, ptr @DynALUCount, align 8
  %2102 = add i64 %2101, 1
  store i64 %2102, ptr @DynALUCount, align 8
  %2103 = xor i32 %2099, %2100
  %2104 = load i64, ptr @DynALUCount, align 8
  %2105 = add i64 %2104, 1
  store i64 %2105, ptr @DynALUCount, align 8
  %2106 = lshr i32 %878, 3
  %2107 = load i64, ptr @DynALUCount, align 8
  %2108 = add i64 %2107, 1
  store i64 %2108, ptr @DynALUCount, align 8
  %2109 = xor i32 %2103, %2106
  %2110 = load i64, ptr @DynALUCount, align 8
  %2111 = add i64 %2110, 1
  store i64 %2111, ptr @DynALUCount, align 8
  %2112 = add i32 %2109, %880
  %2113 = load i64, ptr @DynALUCount, align 8
  %2114 = add i64 %2113, 1
  store i64 %2114, ptr @DynALUCount, align 8
  %2115 = add i32 %2112, %1439
  %2116 = load i64, ptr @DynALUCount, align 8
  %2117 = add i64 %2116, 1
  store i64 %2117, ptr @DynALUCount, align 8
  %2118 = add i32 %2115, %2098
  %2119 = load i64, ptr @DynALUCount, align 8
  %2120 = add i64 %2119, 1
  store i64 %2120, ptr @DynALUCount, align 8
  %2121 = add i32 %2118, %2087
  %2122 = load i64, ptr @DynALUCount, align 8
  %2123 = add i64 %2122, 1
  store i64 %2123, ptr @DynALUCount, align 8
  %2124 = add i32 %2121, %1745
  %2125 = load i64, ptr @DynALUCount, align 8
  %2126 = add i64 %2125, 1
  store i64 %2126, ptr @DynALUCount, align 8
  %2127 = add i32 %2124, %2081
  %2128 = load i64, ptr @DynALUCount, align 8
  %2129 = add i64 %2128, 1
  store i64 %2129, ptr @DynALUCount, align 8
  %2130 = add i32 %2127, %2072
  %2131 = load i64, ptr @DynALUCount, align 8
  %2132 = add i64 %2131, 1
  store i64 %2132, ptr @DynALUCount, align 8
  %2133 = add i32 %2130, %1772
  %2134 = tail call i32 @llvm.fshl.i32(i32 %2063, i32 %2063, i32 30)
  %2135 = tail call i32 @llvm.fshl.i32(i32 %2063, i32 %2063, i32 19)
  %2136 = load i64, ptr @DynALUCount, align 8
  %2137 = add i64 %2136, 1
  store i64 %2137, ptr @DynALUCount, align 8
  %2138 = xor i32 %2134, %2135
  %2139 = tail call i32 @llvm.fshl.i32(i32 %2063, i32 %2063, i32 10)
  %2140 = load i64, ptr @DynALUCount, align 8
  %2141 = add i64 %2140, 1
  store i64 %2141, ptr @DynALUCount, align 8
  %2142 = xor i32 %2138, %2139
  %2143 = load i64, ptr @DynALUCount, align 8
  %2144 = add i64 %2143, 1
  store i64 %2144, ptr @DynALUCount, align 8
  %2145 = and i32 %2063, %1966
  %2146 = load i64, ptr @DynALUCount, align 8
  %2147 = add i64 %2146, 1
  store i64 %2147, ptr @DynALUCount, align 8
  %2148 = xor i32 %2063, %1966
  %2149 = load i64, ptr @DynALUCount, align 8
  %2150 = add i64 %2149, 1
  store i64 %2150, ptr @DynALUCount, align 8
  %2151 = and i32 %2148, %1869
  %2152 = load i64, ptr @DynALUCount, align 8
  %2153 = add i64 %2152, 1
  store i64 %2153, ptr @DynALUCount, align 8
  %2154 = xor i32 %2151, %2145
  %2155 = load i64, ptr @DynALUCount, align 8
  %2156 = add i64 %2155, 1
  store i64 %2156, ptr @DynALUCount, align 8
  %2157 = add i32 %2142, %2154
  %2158 = load i64, ptr @DynALUCount, align 8
  %2159 = add i64 %2158, 1
  store i64 %2159, ptr @DynALUCount, align 8
  %2160 = add i32 %2157, %2130
  %2161 = tail call i32 @llvm.fshl.i32(i32 %2133, i32 %2133, i32 26)
  %2162 = tail call i32 @llvm.fshl.i32(i32 %2133, i32 %2133, i32 21)
  %2163 = load i64, ptr @DynALUCount, align 8
  %2164 = add i64 %2163, 1
  store i64 %2164, ptr @DynALUCount, align 8
  %2165 = xor i32 %2161, %2162
  %2166 = tail call i32 @llvm.fshl.i32(i32 %2133, i32 %2133, i32 7)
  %2167 = load i64, ptr @DynALUCount, align 8
  %2168 = add i64 %2167, 1
  store i64 %2168, ptr @DynALUCount, align 8
  %2169 = xor i32 %2165, %2166
  %2170 = load i64, ptr @DynALUCount, align 8
  %2171 = add i64 %2170, 1
  store i64 %2171, ptr @DynALUCount, align 8
  %2172 = xor i32 %2036, %1939
  %2173 = load i64, ptr @DynALUCount, align 8
  %2174 = add i64 %2173, 1
  store i64 %2174, ptr @DynALUCount, align 8
  %2175 = and i32 %2133, %2172
  %2176 = load i64, ptr @DynALUCount, align 8
  %2177 = add i64 %2176, 1
  store i64 %2177, ptr @DynALUCount, align 8
  %2178 = xor i32 %2175, %1939
  %2179 = load i64, ptr @DynAddressMathCount, align 8
  %2180 = add i64 %2179, 1
  store i64 %2180, ptr @DynAddressMathCount, align 8
  %2181 = getelementptr i8, ptr %898, i64 116
  %2182 = load i64, ptr @DynMemReadCount, align 8
  %2183 = add i64 %2182, 1
  store i64 %2183, ptr @DynMemReadCount, align 8
  %2184 = load i32, ptr %2181, align 4, !tbaa !1
  %2185 = tail call i32 @llvm.fshl.i32(i32 %2021, i32 %2021, i32 15)
  %2186 = tail call i32 @llvm.fshl.i32(i32 %2021, i32 %2021, i32 13)
  %2187 = load i64, ptr @DynALUCount, align 8
  %2188 = add i64 %2187, 1
  store i64 %2188, ptr @DynALUCount, align 8
  %2189 = xor i32 %2185, %2186
  %2190 = load i64, ptr @DynALUCount, align 8
  %2191 = add i64 %2190, 1
  store i64 %2191, ptr @DynALUCount, align 8
  %2192 = lshr i32 %2021, 10
  %2193 = load i64, ptr @DynALUCount, align 8
  %2194 = add i64 %2193, 1
  store i64 %2194, ptr @DynALUCount, align 8
  %2195 = xor i32 %2189, %2192
  %2196 = tail call i32 @llvm.fshl.i32(i32 %888, i32 %888, i32 25)
  %2197 = tail call i32 @llvm.fshl.i32(i32 %888, i32 %888, i32 14)
  %2198 = load i64, ptr @DynALUCount, align 8
  %2199 = add i64 %2198, 1
  store i64 %2199, ptr @DynALUCount, align 8
  %2200 = xor i32 %2196, %2197
  %2201 = load i64, ptr @DynALUCount, align 8
  %2202 = add i64 %2201, 1
  store i64 %2202, ptr @DynALUCount, align 8
  %2203 = lshr i32 %888, 3
  %2204 = load i64, ptr @DynALUCount, align 8
  %2205 = add i64 %2204, 1
  store i64 %2205, ptr @DynALUCount, align 8
  %2206 = xor i32 %2200, %2203
  %2207 = load i64, ptr @DynALUCount, align 8
  %2208 = add i64 %2207, 1
  store i64 %2208, ptr @DynALUCount, align 8
  %2209 = add i32 %878, %2206
  %2210 = load i64, ptr @DynALUCount, align 8
  %2211 = add i64 %2210, 1
  store i64 %2211, ptr @DynALUCount, align 8
  %2212 = add i32 %2209, %1536
  %2213 = load i64, ptr @DynALUCount, align 8
  %2214 = add i64 %2213, 1
  store i64 %2214, ptr @DynALUCount, align 8
  %2215 = add i32 %2212, %2195
  %2216 = load i64, ptr @DynALUCount, align 8
  %2217 = add i64 %2216, 1
  store i64 %2217, ptr @DynALUCount, align 8
  %2218 = add i32 %2215, %2184
  %2219 = load i64, ptr @DynALUCount, align 8
  %2220 = add i64 %2219, 1
  store i64 %2220, ptr @DynALUCount, align 8
  %2221 = add i32 %2218, %1842
  %2222 = load i64, ptr @DynALUCount, align 8
  %2223 = add i64 %2222, 1
  store i64 %2223, ptr @DynALUCount, align 8
  %2224 = add i32 %2221, %2178
  %2225 = load i64, ptr @DynALUCount, align 8
  %2226 = add i64 %2225, 1
  store i64 %2226, ptr @DynALUCount, align 8
  %2227 = add i32 %2224, %2169
  %2228 = load i64, ptr @DynALUCount, align 8
  %2229 = add i64 %2228, 1
  store i64 %2229, ptr @DynALUCount, align 8
  %2230 = add i32 %2227, %1869
  %2231 = tail call i32 @llvm.fshl.i32(i32 %2160, i32 %2160, i32 30)
  %2232 = tail call i32 @llvm.fshl.i32(i32 %2160, i32 %2160, i32 19)
  %2233 = load i64, ptr @DynALUCount, align 8
  %2234 = add i64 %2233, 1
  store i64 %2234, ptr @DynALUCount, align 8
  %2235 = xor i32 %2231, %2232
  %2236 = tail call i32 @llvm.fshl.i32(i32 %2160, i32 %2160, i32 10)
  %2237 = load i64, ptr @DynALUCount, align 8
  %2238 = add i64 %2237, 1
  store i64 %2238, ptr @DynALUCount, align 8
  %2239 = xor i32 %2235, %2236
  %2240 = load i64, ptr @DynALUCount, align 8
  %2241 = add i64 %2240, 1
  store i64 %2241, ptr @DynALUCount, align 8
  %2242 = and i32 %2160, %2063
  %2243 = load i64, ptr @DynALUCount, align 8
  %2244 = add i64 %2243, 1
  store i64 %2244, ptr @DynALUCount, align 8
  %2245 = xor i32 %2160, %2063
  %2246 = load i64, ptr @DynALUCount, align 8
  %2247 = add i64 %2246, 1
  store i64 %2247, ptr @DynALUCount, align 8
  %2248 = and i32 %2245, %1966
  %2249 = load i64, ptr @DynALUCount, align 8
  %2250 = add i64 %2249, 1
  store i64 %2250, ptr @DynALUCount, align 8
  %2251 = xor i32 %2248, %2242
  %2252 = load i64, ptr @DynALUCount, align 8
  %2253 = add i64 %2252, 1
  store i64 %2253, ptr @DynALUCount, align 8
  %2254 = add i32 %2239, %2251
  %2255 = load i64, ptr @DynALUCount, align 8
  %2256 = add i64 %2255, 1
  store i64 %2256, ptr @DynALUCount, align 8
  %2257 = add i32 %2254, %2227
  %2258 = tail call i32 @llvm.fshl.i32(i32 %2230, i32 %2230, i32 26)
  %2259 = tail call i32 @llvm.fshl.i32(i32 %2230, i32 %2230, i32 21)
  %2260 = load i64, ptr @DynALUCount, align 8
  %2261 = add i64 %2260, 1
  store i64 %2261, ptr @DynALUCount, align 8
  %2262 = xor i32 %2258, %2259
  %2263 = tail call i32 @llvm.fshl.i32(i32 %2230, i32 %2230, i32 7)
  %2264 = load i64, ptr @DynALUCount, align 8
  %2265 = add i64 %2264, 1
  store i64 %2265, ptr @DynALUCount, align 8
  %2266 = xor i32 %2262, %2263
  %2267 = load i64, ptr @DynALUCount, align 8
  %2268 = add i64 %2267, 1
  store i64 %2268, ptr @DynALUCount, align 8
  %2269 = xor i32 %2133, %2036
  %2270 = load i64, ptr @DynALUCount, align 8
  %2271 = add i64 %2270, 1
  store i64 %2271, ptr @DynALUCount, align 8
  %2272 = and i32 %2230, %2269
  %2273 = load i64, ptr @DynALUCount, align 8
  %2274 = add i64 %2273, 1
  store i64 %2274, ptr @DynALUCount, align 8
  %2275 = xor i32 %2272, %2036
  %2276 = load i64, ptr @DynAddressMathCount, align 8
  %2277 = add i64 %2276, 1
  store i64 %2277, ptr @DynAddressMathCount, align 8
  %2278 = getelementptr i8, ptr %898, i64 120
  %2279 = load i64, ptr @DynMemReadCount, align 8
  %2280 = add i64 %2279, 1
  store i64 %2280, ptr @DynMemReadCount, align 8
  %2281 = load i32, ptr %2278, align 4, !tbaa !1
  %2282 = tail call i32 @llvm.fshl.i32(i32 %2118, i32 %2118, i32 15)
  %2283 = tail call i32 @llvm.fshl.i32(i32 %2118, i32 %2118, i32 13)
  %2284 = load i64, ptr @DynALUCount, align 8
  %2285 = add i64 %2284, 1
  store i64 %2285, ptr @DynALUCount, align 8
  %2286 = xor i32 %2282, %2283
  %2287 = load i64, ptr @DynALUCount, align 8
  %2288 = add i64 %2287, 1
  store i64 %2288, ptr @DynALUCount, align 8
  %2289 = lshr i32 %2118, 10
  %2290 = load i64, ptr @DynALUCount, align 8
  %2291 = add i64 %2290, 1
  store i64 %2291, ptr @DynALUCount, align 8
  %2292 = xor i32 %2286, %2289
  %2293 = tail call i32 @llvm.fshl.i32(i32 %885, i32 %885, i32 25)
  %2294 = tail call i32 @llvm.fshl.i32(i32 %885, i32 %885, i32 14)
  %2295 = load i64, ptr @DynALUCount, align 8
  %2296 = add i64 %2295, 1
  store i64 %2296, ptr @DynALUCount, align 8
  %2297 = xor i32 %2293, %2294
  %2298 = load i64, ptr @DynALUCount, align 8
  %2299 = add i64 %2298, 1
  store i64 %2299, ptr @DynALUCount, align 8
  %2300 = lshr i32 %885, 3
  %2301 = load i64, ptr @DynALUCount, align 8
  %2302 = add i64 %2301, 1
  store i64 %2302, ptr @DynALUCount, align 8
  %2303 = xor i32 %2297, %2300
  %2304 = load i64, ptr @DynALUCount, align 8
  %2305 = add i64 %2304, 1
  store i64 %2305, ptr @DynALUCount, align 8
  %2306 = add i32 %2303, %888
  %2307 = load i64, ptr @DynALUCount, align 8
  %2308 = add i64 %2307, 1
  store i64 %2308, ptr @DynALUCount, align 8
  %2309 = add i32 %2306, %1633
  %2310 = load i64, ptr @DynALUCount, align 8
  %2311 = add i64 %2310, 1
  store i64 %2311, ptr @DynALUCount, align 8
  %2312 = add i32 %2309, %2292
  %2313 = load i64, ptr @DynALUCount, align 8
  %2314 = add i64 %2313, 1
  store i64 %2314, ptr @DynALUCount, align 8
  %2315 = add i32 %2312, %2281
  %2316 = load i64, ptr @DynALUCount, align 8
  %2317 = add i64 %2316, 1
  store i64 %2317, ptr @DynALUCount, align 8
  %2318 = add i32 %2315, %1939
  %2319 = load i64, ptr @DynALUCount, align 8
  %2320 = add i64 %2319, 1
  store i64 %2320, ptr @DynALUCount, align 8
  %2321 = add i32 %2318, %2275
  %2322 = load i64, ptr @DynALUCount, align 8
  %2323 = add i64 %2322, 1
  store i64 %2323, ptr @DynALUCount, align 8
  %2324 = add i32 %2321, %2266
  %2325 = load i64, ptr @DynALUCount, align 8
  %2326 = add i64 %2325, 1
  store i64 %2326, ptr @DynALUCount, align 8
  %2327 = add i32 %2324, %1966
  %2328 = tail call i32 @llvm.fshl.i32(i32 %2257, i32 %2257, i32 30)
  %2329 = tail call i32 @llvm.fshl.i32(i32 %2257, i32 %2257, i32 19)
  %2330 = load i64, ptr @DynALUCount, align 8
  %2331 = add i64 %2330, 1
  store i64 %2331, ptr @DynALUCount, align 8
  %2332 = xor i32 %2328, %2329
  %2333 = tail call i32 @llvm.fshl.i32(i32 %2257, i32 %2257, i32 10)
  %2334 = load i64, ptr @DynALUCount, align 8
  %2335 = add i64 %2334, 1
  store i64 %2335, ptr @DynALUCount, align 8
  %2336 = xor i32 %2332, %2333
  %2337 = load i64, ptr @DynALUCount, align 8
  %2338 = add i64 %2337, 1
  store i64 %2338, ptr @DynALUCount, align 8
  %2339 = and i32 %2257, %2160
  %2340 = load i64, ptr @DynALUCount, align 8
  %2341 = add i64 %2340, 1
  store i64 %2341, ptr @DynALUCount, align 8
  %2342 = xor i32 %2257, %2160
  %2343 = load i64, ptr @DynALUCount, align 8
  %2344 = add i64 %2343, 1
  store i64 %2344, ptr @DynALUCount, align 8
  %2345 = and i32 %2342, %2063
  %2346 = load i64, ptr @DynALUCount, align 8
  %2347 = add i64 %2346, 1
  store i64 %2347, ptr @DynALUCount, align 8
  %2348 = xor i32 %2345, %2339
  %2349 = load i64, ptr @DynALUCount, align 8
  %2350 = add i64 %2349, 1
  store i64 %2350, ptr @DynALUCount, align 8
  %2351 = add i32 %2336, %2348
  %2352 = load i64, ptr @DynALUCount, align 8
  %2353 = add i64 %2352, 1
  store i64 %2353, ptr @DynALUCount, align 8
  %2354 = add i32 %2351, %2324
  %2355 = tail call i32 @llvm.fshl.i32(i32 %2327, i32 %2327, i32 26)
  %2356 = tail call i32 @llvm.fshl.i32(i32 %2327, i32 %2327, i32 21)
  %2357 = load i64, ptr @DynALUCount, align 8
  %2358 = add i64 %2357, 1
  store i64 %2358, ptr @DynALUCount, align 8
  %2359 = xor i32 %2355, %2356
  %2360 = tail call i32 @llvm.fshl.i32(i32 %2327, i32 %2327, i32 7)
  %2361 = load i64, ptr @DynALUCount, align 8
  %2362 = add i64 %2361, 1
  store i64 %2362, ptr @DynALUCount, align 8
  %2363 = xor i32 %2359, %2360
  %2364 = load i64, ptr @DynALUCount, align 8
  %2365 = add i64 %2364, 1
  store i64 %2365, ptr @DynALUCount, align 8
  %2366 = xor i32 %2230, %2133
  %2367 = load i64, ptr @DynALUCount, align 8
  %2368 = add i64 %2367, 1
  store i64 %2368, ptr @DynALUCount, align 8
  %2369 = and i32 %2327, %2366
  %2370 = load i64, ptr @DynALUCount, align 8
  %2371 = add i64 %2370, 1
  store i64 %2371, ptr @DynALUCount, align 8
  %2372 = xor i32 %2369, %2133
  %2373 = load i64, ptr @DynAddressMathCount, align 8
  %2374 = add i64 %2373, 1
  store i64 %2374, ptr @DynAddressMathCount, align 8
  %2375 = getelementptr i8, ptr %898, i64 124
  %2376 = load i64, ptr @DynMemReadCount, align 8
  %2377 = add i64 %2376, 1
  store i64 %2377, ptr @DynMemReadCount, align 8
  %2378 = load i32, ptr %2375, align 4, !tbaa !1
  %2379 = tail call i32 @llvm.fshl.i32(i32 %2215, i32 %2215, i32 15)
  %2380 = tail call i32 @llvm.fshl.i32(i32 %2215, i32 %2215, i32 13)
  %2381 = load i64, ptr @DynALUCount, align 8
  %2382 = add i64 %2381, 1
  store i64 %2382, ptr @DynALUCount, align 8
  %2383 = xor i32 %2379, %2380
  %2384 = load i64, ptr @DynALUCount, align 8
  %2385 = add i64 %2384, 1
  store i64 %2385, ptr @DynALUCount, align 8
  %2386 = lshr i32 %2215, 10
  %2387 = load i64, ptr @DynALUCount, align 8
  %2388 = add i64 %2387, 1
  store i64 %2388, ptr @DynALUCount, align 8
  %2389 = xor i32 %2383, %2386
  %2390 = tail call i32 @llvm.fshl.i32(i32 %954, i32 %954, i32 25)
  %2391 = tail call i32 @llvm.fshl.i32(i32 %954, i32 %954, i32 14)
  %2392 = load i64, ptr @DynALUCount, align 8
  %2393 = add i64 %2392, 1
  store i64 %2393, ptr @DynALUCount, align 8
  %2394 = xor i32 %2390, %2391
  %2395 = load i64, ptr @DynALUCount, align 8
  %2396 = add i64 %2395, 1
  store i64 %2396, ptr @DynALUCount, align 8
  %2397 = lshr i32 %954, 3
  %2398 = load i64, ptr @DynALUCount, align 8
  %2399 = add i64 %2398, 1
  store i64 %2399, ptr @DynALUCount, align 8
  %2400 = xor i32 %2394, %2397
  %2401 = load i64, ptr @DynALUCount, align 8
  %2402 = add i64 %2401, 1
  store i64 %2402, ptr @DynALUCount, align 8
  %2403 = add i32 %2400, %885
  %2404 = load i64, ptr @DynALUCount, align 8
  %2405 = add i64 %2404, 1
  store i64 %2405, ptr @DynALUCount, align 8
  %2406 = add i32 %2403, %1730
  %2407 = load i64, ptr @DynALUCount, align 8
  %2408 = add i64 %2407, 1
  store i64 %2408, ptr @DynALUCount, align 8
  %2409 = add i32 %2406, %2389
  %2410 = load i64, ptr @DynALUCount, align 8
  %2411 = add i64 %2410, 1
  store i64 %2411, ptr @DynALUCount, align 8
  %2412 = add i32 %2409, %2378
  %2413 = load i64, ptr @DynALUCount, align 8
  %2414 = add i64 %2413, 1
  store i64 %2414, ptr @DynALUCount, align 8
  %2415 = add i32 %2412, %2036
  %2416 = load i64, ptr @DynALUCount, align 8
  %2417 = add i64 %2416, 1
  store i64 %2417, ptr @DynALUCount, align 8
  %2418 = add i32 %2415, %2372
  %2419 = load i64, ptr @DynALUCount, align 8
  %2420 = add i64 %2419, 1
  store i64 %2420, ptr @DynALUCount, align 8
  %2421 = add i32 %2418, %2363
  %2422 = load i64, ptr @DynALUCount, align 8
  %2423 = add i64 %2422, 1
  store i64 %2423, ptr @DynALUCount, align 8
  %2424 = add i32 %2421, %2063
  %2425 = tail call i32 @llvm.fshl.i32(i32 %2354, i32 %2354, i32 30)
  %2426 = tail call i32 @llvm.fshl.i32(i32 %2354, i32 %2354, i32 19)
  %2427 = load i64, ptr @DynALUCount, align 8
  %2428 = add i64 %2427, 1
  store i64 %2428, ptr @DynALUCount, align 8
  %2429 = xor i32 %2425, %2426
  %2430 = tail call i32 @llvm.fshl.i32(i32 %2354, i32 %2354, i32 10)
  %2431 = load i64, ptr @DynALUCount, align 8
  %2432 = add i64 %2431, 1
  store i64 %2432, ptr @DynALUCount, align 8
  %2433 = xor i32 %2429, %2430
  %2434 = load i64, ptr @DynALUCount, align 8
  %2435 = add i64 %2434, 1
  store i64 %2435, ptr @DynALUCount, align 8
  %2436 = and i32 %2354, %2257
  %2437 = load i64, ptr @DynALUCount, align 8
  %2438 = add i64 %2437, 1
  store i64 %2438, ptr @DynALUCount, align 8
  %2439 = xor i32 %2354, %2257
  %2440 = load i64, ptr @DynALUCount, align 8
  %2441 = add i64 %2440, 1
  store i64 %2441, ptr @DynALUCount, align 8
  %2442 = and i32 %2439, %2160
  %2443 = load i64, ptr @DynALUCount, align 8
  %2444 = add i64 %2443, 1
  store i64 %2444, ptr @DynALUCount, align 8
  %2445 = xor i32 %2442, %2436
  %2446 = load i64, ptr @DynALUCount, align 8
  %2447 = add i64 %2446, 1
  store i64 %2447, ptr @DynALUCount, align 8
  %2448 = add i32 %2433, %2445
  %2449 = load i64, ptr @DynALUCount, align 8
  %2450 = add i64 %2449, 1
  store i64 %2450, ptr @DynALUCount, align 8
  %2451 = add i32 %2448, %2421
  %2452 = load i64, ptr @DynALUCount, align 8
  %2453 = add i64 %2452, 1
  store i64 %2453, ptr @DynALUCount, align 8
  %2454 = add nuw nsw i32 %889, 16
  %2455 = load i64, ptr @DynALUCount, align 8
  %2456 = add i64 %2455, 1
  store i64 %2456, ptr @DynALUCount, align 8
  %2457 = icmp samesign ult i32 %889, 48
  %2458 = load i64, ptr @DynControlFlowCount, align 8
  %2459 = add i64 %2458, 1
  store i64 %2459, ptr @DynControlFlowCount, align 8
  br i1 %2457, label %873, label %2460, !llvm.loop !21

2460:                                             ; preds = %873
  %2461 = load i64, ptr @DynALUCount, align 8
  %2462 = add i64 %2461, 1
  store i64 %2462, ptr @DynALUCount, align 8
  %2463 = add i32 %2451, %142
  %2464 = load i64, ptr @DynMemWriteCount, align 8
  %2465 = add i64 %2464, 1
  store i64 %2465, ptr @DynMemWriteCount, align 8
  store i32 %2463, ptr %0, align 4, !tbaa !1
  %2466 = load i64, ptr @DynALUCount, align 8
  %2467 = add i64 %2466, 1
  store i64 %2467, ptr @DynALUCount, align 8
  %2468 = add i32 %2354, %148
  %2469 = load i64, ptr @DynMemWriteCount, align 8
  %2470 = add i64 %2469, 1
  store i64 %2470, ptr @DynMemWriteCount, align 8
  store i32 %2468, ptr %145, align 4, !tbaa !1
  %2471 = load i64, ptr @DynALUCount, align 8
  %2472 = add i64 %2471, 1
  store i64 %2472, ptr @DynALUCount, align 8
  %2473 = add i32 %2257, %154
  %2474 = load i64, ptr @DynMemWriteCount, align 8
  %2475 = add i64 %2474, 1
  store i64 %2475, ptr @DynMemWriteCount, align 8
  store i32 %2473, ptr %151, align 4, !tbaa !1
  %2476 = load i64, ptr @DynALUCount, align 8
  %2477 = add i64 %2476, 1
  store i64 %2477, ptr @DynALUCount, align 8
  %2478 = add i32 %2160, %160
  %2479 = load i64, ptr @DynMemWriteCount, align 8
  %2480 = add i64 %2479, 1
  store i64 %2480, ptr @DynMemWriteCount, align 8
  store i32 %2478, ptr %157, align 4, !tbaa !1
  %2481 = load i64, ptr @DynALUCount, align 8
  %2482 = add i64 %2481, 1
  store i64 %2482, ptr @DynALUCount, align 8
  %2483 = add i32 %2424, %166
  %2484 = load i64, ptr @DynMemWriteCount, align 8
  %2485 = add i64 %2484, 1
  store i64 %2485, ptr @DynMemWriteCount, align 8
  store i32 %2483, ptr %163, align 4, !tbaa !1
  %2486 = load i64, ptr @DynALUCount, align 8
  %2487 = add i64 %2486, 1
  store i64 %2487, ptr @DynALUCount, align 8
  %2488 = add i32 %2327, %172
  %2489 = load i64, ptr @DynMemWriteCount, align 8
  %2490 = add i64 %2489, 1
  store i64 %2490, ptr @DynMemWriteCount, align 8
  store i32 %2488, ptr %169, align 4, !tbaa !1
  %2491 = load i64, ptr @DynALUCount, align 8
  %2492 = add i64 %2491, 1
  store i64 %2492, ptr @DynALUCount, align 8
  %2493 = add i32 %2230, %178
  %2494 = load i64, ptr @DynMemWriteCount, align 8
  %2495 = add i64 %2494, 1
  store i64 %2495, ptr @DynMemWriteCount, align 8
  store i32 %2493, ptr %175, align 4, !tbaa !1
  %2496 = load i64, ptr @DynALUCount, align 8
  %2497 = add i64 %2496, 1
  store i64 %2497, ptr @DynALUCount, align 8
  %2498 = add i32 %2133, %184
  %2499 = load i64, ptr @DynMemWriteCount, align 8
  %2500 = add i64 %2499, 1
  store i64 %2500, ptr @DynMemWriteCount, align 8
  store i32 %2498, ptr %181, align 4, !tbaa !1
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #17
  %2501 = load i64, ptr @DynControlFlowCount, align 8
  %2502 = add i64 %2501, 1
  store i64 %2502, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write)
declare void @llvm.assume(i1 noundef) #5

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #6

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.fshl.i32(i32, i32, i32) #7

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @_nettle_write_be32(i64 noundef %0, ptr noundef writeonly captures(none) %1, ptr noundef readonly captures(none) %2) local_unnamed_addr #3 {
  %4 = load i64, ptr @DynALUCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynALUCount, align 8
  %6 = lshr i64 %0, 2
  %7 = load i64, ptr @DynCastCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynCastCount, align 8
  %9 = trunc i64 %0 to i32
  %10 = load i64, ptr @DynALUCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynALUCount, align 8
  %12 = and i32 %9, 3
  %13 = load i64, ptr @DynALUCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynALUCount, align 8
  %15 = icmp eq i64 %6, 0
  %16 = load i64, ptr @DynControlFlowCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynControlFlowCount, align 8
  br i1 %15, label %233, label %18

18:                                               ; preds = %3
  %19 = load i64, ptr @DynALUCount, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr @DynALUCount, align 8
  %21 = and i64 %6, 1
  %22 = load i64, ptr @DynALUCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynALUCount, align 8
  %24 = icmp eq i64 %6, 1
  %25 = load i64, ptr @DynControlFlowCount, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr @DynControlFlowCount, align 8
  br i1 %24, label %169, label %27

27:                                               ; preds = %18
  %28 = load i64, ptr @DynALUCount, align 8
  %29 = add i64 %28, 1
  store i64 %29, ptr @DynALUCount, align 8
  %30 = and i64 %6, 4611686018427387902
  %31 = load i64, ptr @DynControlFlowCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynControlFlowCount, align 8
  br label %33

33:                                               ; preds = %33, %27
  %34 = phi ptr [ %1, %27 ], [ %154, %33 ]
  %35 = phi i64 [ 0, %27 ], [ %151, %33 ]
  %36 = phi i64 [ 0, %27 ], [ %157, %33 ]
  %37 = load i64, ptr @DynAddressMathCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynAddressMathCount, align 8
  %39 = getelementptr inbounds nuw i32, ptr %2, i64 %35
  %40 = load i64, ptr @DynMemReadCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynMemReadCount, align 8
  %42 = load i32, ptr %39, align 4, !tbaa !1
  %43 = load i64, ptr @DynALUCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynALUCount, align 8
  %45 = lshr i32 %42, 24
  %46 = load i64, ptr @DynCastCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynCastCount, align 8
  %48 = trunc nuw i32 %45 to i8
  %49 = load i64, ptr @DynMemWriteCount, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr @DynMemWriteCount, align 8
  store i8 %48, ptr %34, align 1, !tbaa !17
  %51 = load i64, ptr @DynMemReadCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynMemReadCount, align 8
  %53 = load i32, ptr %39, align 4, !tbaa !1
  %54 = load i64, ptr @DynALUCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynALUCount, align 8
  %56 = lshr i32 %53, 16
  %57 = load i64, ptr @DynCastCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynCastCount, align 8
  %59 = trunc i32 %56 to i8
  %60 = load i64, ptr @DynAddressMathCount, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr @DynAddressMathCount, align 8
  %62 = getelementptr inbounds nuw i8, ptr %34, i64 1
  %63 = load i64, ptr @DynMemWriteCount, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr @DynMemWriteCount, align 8
  store i8 %59, ptr %62, align 1, !tbaa !17
  %65 = load i64, ptr @DynMemReadCount, align 8
  %66 = add i64 %65, 1
  store i64 %66, ptr @DynMemReadCount, align 8
  %67 = load i32, ptr %39, align 4, !tbaa !1
  %68 = load i64, ptr @DynALUCount, align 8
  %69 = add i64 %68, 1
  store i64 %69, ptr @DynALUCount, align 8
  %70 = lshr i32 %67, 8
  %71 = load i64, ptr @DynCastCount, align 8
  %72 = add i64 %71, 1
  store i64 %72, ptr @DynCastCount, align 8
  %73 = trunc i32 %70 to i8
  %74 = load i64, ptr @DynAddressMathCount, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr @DynAddressMathCount, align 8
  %76 = getelementptr inbounds nuw i8, ptr %34, i64 2
  %77 = load i64, ptr @DynMemWriteCount, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr @DynMemWriteCount, align 8
  store i8 %73, ptr %76, align 1, !tbaa !17
  %79 = load i64, ptr @DynMemReadCount, align 8
  %80 = add i64 %79, 1
  store i64 %80, ptr @DynMemReadCount, align 8
  %81 = load i32, ptr %39, align 4, !tbaa !1
  %82 = load i64, ptr @DynCastCount, align 8
  %83 = add i64 %82, 1
  store i64 %83, ptr @DynCastCount, align 8
  %84 = trunc i32 %81 to i8
  %85 = load i64, ptr @DynAddressMathCount, align 8
  %86 = add i64 %85, 1
  store i64 %86, ptr @DynAddressMathCount, align 8
  %87 = getelementptr inbounds nuw i8, ptr %34, i64 3
  %88 = load i64, ptr @DynMemWriteCount, align 8
  %89 = add i64 %88, 1
  store i64 %89, ptr @DynMemWriteCount, align 8
  store i8 %84, ptr %87, align 1, !tbaa !17
  %90 = load i64, ptr @DynAddressMathCount, align 8
  %91 = add i64 %90, 1
  store i64 %91, ptr @DynAddressMathCount, align 8
  %92 = getelementptr inbounds nuw i8, ptr %34, i64 4
  %93 = load i64, ptr @DynAddressMathCount, align 8
  %94 = add i64 %93, 1
  store i64 %94, ptr @DynAddressMathCount, align 8
  %95 = getelementptr inbounds nuw i32, ptr %2, i64 %35
  %96 = load i64, ptr @DynAddressMathCount, align 8
  %97 = add i64 %96, 1
  store i64 %97, ptr @DynAddressMathCount, align 8
  %98 = getelementptr inbounds nuw i8, ptr %95, i64 4
  %99 = load i64, ptr @DynMemReadCount, align 8
  %100 = add i64 %99, 1
  store i64 %100, ptr @DynMemReadCount, align 8
  %101 = load i32, ptr %98, align 4, !tbaa !1
  %102 = load i64, ptr @DynALUCount, align 8
  %103 = add i64 %102, 1
  store i64 %103, ptr @DynALUCount, align 8
  %104 = lshr i32 %101, 24
  %105 = load i64, ptr @DynCastCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynCastCount, align 8
  %107 = trunc nuw i32 %104 to i8
  %108 = load i64, ptr @DynMemWriteCount, align 8
  %109 = add i64 %108, 1
  store i64 %109, ptr @DynMemWriteCount, align 8
  store i8 %107, ptr %92, align 1, !tbaa !17
  %110 = load i64, ptr @DynMemReadCount, align 8
  %111 = add i64 %110, 1
  store i64 %111, ptr @DynMemReadCount, align 8
  %112 = load i32, ptr %98, align 4, !tbaa !1
  %113 = load i64, ptr @DynALUCount, align 8
  %114 = add i64 %113, 1
  store i64 %114, ptr @DynALUCount, align 8
  %115 = lshr i32 %112, 16
  %116 = load i64, ptr @DynCastCount, align 8
  %117 = add i64 %116, 1
  store i64 %117, ptr @DynCastCount, align 8
  %118 = trunc i32 %115 to i8
  %119 = load i64, ptr @DynAddressMathCount, align 8
  %120 = add i64 %119, 1
  store i64 %120, ptr @DynAddressMathCount, align 8
  %121 = getelementptr inbounds nuw i8, ptr %34, i64 5
  %122 = load i64, ptr @DynMemWriteCount, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr @DynMemWriteCount, align 8
  store i8 %118, ptr %121, align 1, !tbaa !17
  %124 = load i64, ptr @DynMemReadCount, align 8
  %125 = add i64 %124, 1
  store i64 %125, ptr @DynMemReadCount, align 8
  %126 = load i32, ptr %98, align 4, !tbaa !1
  %127 = load i64, ptr @DynALUCount, align 8
  %128 = add i64 %127, 1
  store i64 %128, ptr @DynALUCount, align 8
  %129 = lshr i32 %126, 8
  %130 = load i64, ptr @DynCastCount, align 8
  %131 = add i64 %130, 1
  store i64 %131, ptr @DynCastCount, align 8
  %132 = trunc i32 %129 to i8
  %133 = load i64, ptr @DynAddressMathCount, align 8
  %134 = add i64 %133, 1
  store i64 %134, ptr @DynAddressMathCount, align 8
  %135 = getelementptr inbounds nuw i8, ptr %34, i64 6
  %136 = load i64, ptr @DynMemWriteCount, align 8
  %137 = add i64 %136, 1
  store i64 %137, ptr @DynMemWriteCount, align 8
  store i8 %132, ptr %135, align 1, !tbaa !17
  %138 = load i64, ptr @DynMemReadCount, align 8
  %139 = add i64 %138, 1
  store i64 %139, ptr @DynMemReadCount, align 8
  %140 = load i32, ptr %98, align 4, !tbaa !1
  %141 = load i64, ptr @DynCastCount, align 8
  %142 = add i64 %141, 1
  store i64 %142, ptr @DynCastCount, align 8
  %143 = trunc i32 %140 to i8
  %144 = load i64, ptr @DynAddressMathCount, align 8
  %145 = add i64 %144, 1
  store i64 %145, ptr @DynAddressMathCount, align 8
  %146 = getelementptr inbounds nuw i8, ptr %34, i64 7
  %147 = load i64, ptr @DynMemWriteCount, align 8
  %148 = add i64 %147, 1
  store i64 %148, ptr @DynMemWriteCount, align 8
  store i8 %143, ptr %146, align 1, !tbaa !17
  %149 = load i64, ptr @DynALUCount, align 8
  %150 = add i64 %149, 1
  store i64 %150, ptr @DynALUCount, align 8
  %151 = add nuw nsw i64 %35, 2
  %152 = load i64, ptr @DynAddressMathCount, align 8
  %153 = add i64 %152, 1
  store i64 %153, ptr @DynAddressMathCount, align 8
  %154 = getelementptr inbounds nuw i8, ptr %34, i64 8
  %155 = load i64, ptr @DynALUCount, align 8
  %156 = add i64 %155, 1
  store i64 %156, ptr @DynALUCount, align 8
  %157 = add i64 %36, 2
  %158 = load i64, ptr @DynALUCount, align 8
  %159 = add i64 %158, 1
  store i64 %159, ptr @DynALUCount, align 8
  %160 = icmp eq i64 %157, %30
  %161 = load i64, ptr @DynControlFlowCount, align 8
  %162 = add i64 %161, 1
  store i64 %162, ptr @DynControlFlowCount, align 8
  br i1 %160, label %163, label %33, !llvm.loop !18

163:                                              ; preds = %33
  %164 = load i64, ptr @DynALUCount, align 8
  %165 = add i64 %164, 1
  store i64 %165, ptr @DynALUCount, align 8
  %166 = icmp eq i64 %21, 0
  %167 = load i64, ptr @DynControlFlowCount, align 8
  %168 = add i64 %167, 1
  store i64 %168, ptr @DynControlFlowCount, align 8
  br i1 %166, label %233, label %169

169:                                              ; preds = %163, %18
  %170 = phi ptr [ %1, %18 ], [ %154, %163 ]
  %171 = phi i64 [ 0, %18 ], [ %151, %163 ]
  %172 = load i64, ptr @DynALUCount, align 8
  %173 = add i64 %172, 1
  store i64 %173, ptr @DynALUCount, align 8
  %174 = icmp ne i64 %21, 0
  tail call void @llvm.assume(i1 %174)
  %175 = load i64, ptr @DynAddressMathCount, align 8
  %176 = add i64 %175, 1
  store i64 %176, ptr @DynAddressMathCount, align 8
  %177 = getelementptr inbounds nuw i32, ptr %2, i64 %171
  %178 = load i64, ptr @DynMemReadCount, align 8
  %179 = add i64 %178, 1
  store i64 %179, ptr @DynMemReadCount, align 8
  %180 = load i32, ptr %177, align 4, !tbaa !1
  %181 = load i64, ptr @DynALUCount, align 8
  %182 = add i64 %181, 1
  store i64 %182, ptr @DynALUCount, align 8
  %183 = lshr i32 %180, 24
  %184 = load i64, ptr @DynCastCount, align 8
  %185 = add i64 %184, 1
  store i64 %185, ptr @DynCastCount, align 8
  %186 = trunc nuw i32 %183 to i8
  %187 = load i64, ptr @DynMemWriteCount, align 8
  %188 = add i64 %187, 1
  store i64 %188, ptr @DynMemWriteCount, align 8
  store i8 %186, ptr %170, align 1, !tbaa !17
  %189 = load i64, ptr @DynMemReadCount, align 8
  %190 = add i64 %189, 1
  store i64 %190, ptr @DynMemReadCount, align 8
  %191 = load i32, ptr %177, align 4, !tbaa !1
  %192 = load i64, ptr @DynALUCount, align 8
  %193 = add i64 %192, 1
  store i64 %193, ptr @DynALUCount, align 8
  %194 = lshr i32 %191, 16
  %195 = load i64, ptr @DynCastCount, align 8
  %196 = add i64 %195, 1
  store i64 %196, ptr @DynCastCount, align 8
  %197 = trunc i32 %194 to i8
  %198 = load i64, ptr @DynAddressMathCount, align 8
  %199 = add i64 %198, 1
  store i64 %199, ptr @DynAddressMathCount, align 8
  %200 = getelementptr inbounds nuw i8, ptr %170, i64 1
  %201 = load i64, ptr @DynMemWriteCount, align 8
  %202 = add i64 %201, 1
  store i64 %202, ptr @DynMemWriteCount, align 8
  store i8 %197, ptr %200, align 1, !tbaa !17
  %203 = load i64, ptr @DynMemReadCount, align 8
  %204 = add i64 %203, 1
  store i64 %204, ptr @DynMemReadCount, align 8
  %205 = load i32, ptr %177, align 4, !tbaa !1
  %206 = load i64, ptr @DynALUCount, align 8
  %207 = add i64 %206, 1
  store i64 %207, ptr @DynALUCount, align 8
  %208 = lshr i32 %205, 8
  %209 = load i64, ptr @DynCastCount, align 8
  %210 = add i64 %209, 1
  store i64 %210, ptr @DynCastCount, align 8
  %211 = trunc i32 %208 to i8
  %212 = load i64, ptr @DynAddressMathCount, align 8
  %213 = add i64 %212, 1
  store i64 %213, ptr @DynAddressMathCount, align 8
  %214 = getelementptr inbounds nuw i8, ptr %170, i64 2
  %215 = load i64, ptr @DynMemWriteCount, align 8
  %216 = add i64 %215, 1
  store i64 %216, ptr @DynMemWriteCount, align 8
  store i8 %211, ptr %214, align 1, !tbaa !17
  %217 = load i64, ptr @DynMemReadCount, align 8
  %218 = add i64 %217, 1
  store i64 %218, ptr @DynMemReadCount, align 8
  %219 = load i32, ptr %177, align 4, !tbaa !1
  %220 = load i64, ptr @DynCastCount, align 8
  %221 = add i64 %220, 1
  store i64 %221, ptr @DynCastCount, align 8
  %222 = trunc i32 %219 to i8
  %223 = load i64, ptr @DynAddressMathCount, align 8
  %224 = add i64 %223, 1
  store i64 %224, ptr @DynAddressMathCount, align 8
  %225 = getelementptr inbounds nuw i8, ptr %170, i64 3
  %226 = load i64, ptr @DynMemWriteCount, align 8
  %227 = add i64 %226, 1
  store i64 %227, ptr @DynMemWriteCount, align 8
  store i8 %222, ptr %225, align 1, !tbaa !17
  %228 = load i64, ptr @DynAddressMathCount, align 8
  %229 = add i64 %228, 1
  store i64 %229, ptr @DynAddressMathCount, align 8
  %230 = getelementptr inbounds nuw i8, ptr %170, i64 4
  %231 = load i64, ptr @DynControlFlowCount, align 8
  %232 = add i64 %231, 1
  store i64 %232, ptr @DynControlFlowCount, align 8
  br label %233

233:                                              ; preds = %169, %163, %3
  %234 = phi ptr [ %1, %3 ], [ %154, %163 ], [ %230, %169 ]
  %235 = load i64, ptr @DynALUCount, align 8
  %236 = add i64 %235, 1
  store i64 %236, ptr @DynALUCount, align 8
  %237 = icmp eq i32 %12, 0
  %238 = load i64, ptr @DynControlFlowCount, align 8
  %239 = add i64 %238, 1
  store i64 %239, ptr @DynControlFlowCount, align 8
  br i1 %237, label %297, label %240

240:                                              ; preds = %233
  %241 = load i64, ptr @DynAddressMathCount, align 8
  %242 = add i64 %241, 1
  store i64 %242, ptr @DynAddressMathCount, align 8
  %243 = getelementptr inbounds nuw i32, ptr %2, i64 %6
  %244 = load i64, ptr @DynMemReadCount, align 8
  %245 = add i64 %244, 1
  store i64 %245, ptr @DynMemReadCount, align 8
  %246 = load i32, ptr %243, align 4, !tbaa !1
  %247 = load i64, ptr @DynControlFlowCount, align 8
  %248 = add i64 %247, 1
  store i64 %248, ptr @DynControlFlowCount, align 8
  switch i32 %12, label %249 [
    i32 3, label %252
    i32 2, label %272
    i32 1, label %286
  ]

249:                                              ; preds = %240
  %250 = load i64, ptr @DynControlFlowCount, align 8
  %251 = add i64 %250, 1
  store i64 %251, ptr @DynControlFlowCount, align 8
  unreachable

252:                                              ; preds = %240
  %253 = load i64, ptr @DynALUCount, align 8
  %254 = add i64 %253, 1
  store i64 %254, ptr @DynALUCount, align 8
  %255 = lshr i32 %246, 8
  %256 = load i64, ptr @DynCastCount, align 8
  %257 = add i64 %256, 1
  store i64 %257, ptr @DynCastCount, align 8
  %258 = trunc i32 %255 to i8
  %259 = load i64, ptr @DynALUCount, align 8
  %260 = add i64 %259, 1
  store i64 %260, ptr @DynALUCount, align 8
  %261 = and i64 %0, 3
  %262 = load i64, ptr @DynAddressMathCount, align 8
  %263 = add i64 %262, 1
  store i64 %263, ptr @DynAddressMathCount, align 8
  %264 = getelementptr i8, ptr %234, i64 %261
  %265 = load i64, ptr @DynAddressMathCount, align 8
  %266 = add i64 %265, 1
  store i64 %266, ptr @DynAddressMathCount, align 8
  %267 = getelementptr i8, ptr %264, i64 -1
  %268 = load i64, ptr @DynMemWriteCount, align 8
  %269 = add i64 %268, 1
  store i64 %269, ptr @DynMemWriteCount, align 8
  store i8 %258, ptr %267, align 1, !tbaa !17
  %270 = load i64, ptr @DynControlFlowCount, align 8
  %271 = add i64 %270, 1
  store i64 %271, ptr @DynControlFlowCount, align 8
  br label %272

272:                                              ; preds = %252, %240
  %273 = load i64, ptr @DynALUCount, align 8
  %274 = add i64 %273, 1
  store i64 %274, ptr @DynALUCount, align 8
  %275 = lshr i32 %246, 16
  %276 = load i64, ptr @DynCastCount, align 8
  %277 = add i64 %276, 1
  store i64 %277, ptr @DynCastCount, align 8
  %278 = trunc i32 %275 to i8
  %279 = load i64, ptr @DynAddressMathCount, align 8
  %280 = add i64 %279, 1
  store i64 %280, ptr @DynAddressMathCount, align 8
  %281 = getelementptr inbounds nuw i8, ptr %234, i64 1
  %282 = load i64, ptr @DynMemWriteCount, align 8
  %283 = add i64 %282, 1
  store i64 %283, ptr @DynMemWriteCount, align 8
  store i8 %278, ptr %281, align 1, !tbaa !17
  %284 = load i64, ptr @DynControlFlowCount, align 8
  %285 = add i64 %284, 1
  store i64 %285, ptr @DynControlFlowCount, align 8
  br label %286

286:                                              ; preds = %272, %240
  %287 = load i64, ptr @DynALUCount, align 8
  %288 = add i64 %287, 1
  store i64 %288, ptr @DynALUCount, align 8
  %289 = lshr i32 %246, 24
  %290 = load i64, ptr @DynCastCount, align 8
  %291 = add i64 %290, 1
  store i64 %291, ptr @DynCastCount, align 8
  %292 = trunc nuw i32 %289 to i8
  %293 = load i64, ptr @DynMemWriteCount, align 8
  %294 = add i64 %293, 1
  store i64 %294, ptr @DynMemWriteCount, align 8
  store i8 %292, ptr %234, align 1, !tbaa !17
  %295 = load i64, ptr @DynControlFlowCount, align 8
  %296 = add i64 %295, 1
  store i64 %296, ptr @DynControlFlowCount, align 8
  br label %297

297:                                              ; preds = %286, %233
  %298 = load i64, ptr @DynControlFlowCount, align 8
  %299 = add i64 %298, 1
  store i64 %299, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #8 {
  %2 = load i64, ptr @DynMemReadCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynMemReadCount, align 8
  %4 = load <8 x i8>, ptr @hash, align 16, !tbaa !17
  %5 = load i64, ptr @DynMemReadCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynMemReadCount, align 8
  %7 = load <8 x i8>, ptr @buffer, align 16, !tbaa !17
  %8 = load i64, ptr @DynALUCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynALUCount, align 8
  %10 = icmp eq <8 x i8> %4, %7
  %11 = load i64, ptr @DynVectorCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynVectorCount, align 8
  %13 = freeze <8 x i1> %10
  %14 = load i64, ptr @DynCastCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynCastCount, align 8
  %16 = bitcast <8 x i1> %13 to i8
  %17 = load i64, ptr @DynALUCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynALUCount, align 8
  %19 = icmp eq i8 %16, -1
  %20 = load i64, ptr @DynCastCount, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr @DynCastCount, align 8
  %22 = zext i1 %19 to i32
  %23 = load i64, ptr @DynControlFlowCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynControlFlowCount, align 8
  ret i32 %22
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @initialise_benchmark() local_unnamed_addr #9 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #10 {
  tail call fastcc void @benchmark_body(i32 noundef 1, i32 noundef %0)
  %2 = load i64, ptr @DynControlFlowCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define internal fastcc void @benchmark_body(i32 noundef range(i32 1, 563) %0, i32 noundef %1) unnamed_addr #11 {
  %3 = alloca %struct.sha256_ctx, align 8
  %4 = load i64, ptr @DynALUCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynALUCount, align 8
  %6 = icmp eq i32 %1, 0
  %7 = load i64, ptr @DynAddressMathCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynAddressMathCount, align 8
  %9 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %10 = load i64, ptr @DynAddressMathCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynAddressMathCount, align 8
  %12 = getelementptr inbounds nuw i8, ptr %3, i64 104
  %13 = load i64, ptr @DynAddressMathCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynAddressMathCount, align 8
  %15 = getelementptr inbounds nuw i8, ptr %3, i64 40
  %16 = load i64, ptr @DynControlFlowCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynControlFlowCount, align 8
  br label %18

18:                                               ; preds = %25, %2
  %19 = phi i32 [ 0, %2 ], [ %28, %25 ]
  %20 = load i64, ptr @DynControlFlowCount, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr @DynControlFlowCount, align 8
  br i1 %6, label %25, label %34

22:                                               ; preds = %25
  %23 = load i64, ptr @DynControlFlowCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynControlFlowCount, align 8
  ret void

25:                                               ; preds = %34, %18
  %26 = load i64, ptr @DynALUCount, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr @DynALUCount, align 8
  %28 = add nuw nsw i32 %19, 1
  %29 = load i64, ptr @DynALUCount, align 8
  %30 = add i64 %29, 1
  store i64 %30, ptr @DynALUCount, align 8
  %31 = icmp eq i32 %28, %0
  %32 = load i64, ptr @DynControlFlowCount, align 8
  %33 = add i64 %32, 1
  store i64 %33, ptr @DynControlFlowCount, align 8
  br i1 %31, label %22, label %18, !llvm.loop !22

34:                                               ; preds = %34, %18
  %35 = phi i32 [ %42, %34 ], [ 0, %18 ]
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) @buffer, i8 0, i64 32, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #17
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %3, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  %36 = load i64, ptr @DynMemWriteCount, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr @DynMemWriteCount, align 8
  store i64 0, ptr %9, align 8, !tbaa !12
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %15, ptr noundef nonnull align 16 dereferenceable(56) @msg, i64 56, i1 false)
  %38 = load i64, ptr @DynMemWriteCount, align 8
  %39 = add i64 %38, 1
  store i64 %39, ptr @DynMemWriteCount, align 8
  store i32 56, ptr %12, align 8, !tbaa !15
  call void @sha256_digest(ptr noundef nonnull %3, i64 noundef 32, ptr noundef nonnull @buffer)
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #17
  %40 = load i64, ptr @DynALUCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynALUCount, align 8
  %42 = add nuw i32 %35, 1
  %43 = load i64, ptr @DynALUCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynALUCount, align 8
  %45 = icmp eq i32 %42, %1
  %46 = load i64, ptr @DynControlFlowCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynControlFlowCount, align 8
  br i1 %45, label %25, label %34, !llvm.loop !23
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local noundef i32 @benchmark() local_unnamed_addr #12 {
  tail call fastcc void @benchmark_body(i32 noundef 562, i32 noundef 1)
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @initialise_board() local_unnamed_addr #9 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @start_trigger() local_unnamed_addr #9 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @stop_trigger() local_unnamed_addr #9 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 32768) i32 @rand_beebs() local_unnamed_addr #13 {
  %1 = load i64, ptr @DynMemReadCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynMemReadCount, align 8
  %3 = load i64, ptr @seed, align 8, !tbaa !24
  %4 = load i64, ptr @DynALUCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynALUCount, align 8
  %6 = mul nuw nsw i64 %3, 1103515245
  %7 = load i64, ptr @DynALUCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynALUCount, align 8
  %9 = add nuw nsw i64 %6, 12345
  %10 = load i64, ptr @DynALUCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynALUCount, align 8
  %12 = and i64 %9, 2147483647
  %13 = load i64, ptr @DynMemWriteCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynMemWriteCount, align 8
  store i64 %12, ptr @seed, align 8, !tbaa !24
  %15 = load i64, ptr @DynALUCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynALUCount, align 8
  %17 = lshr i64 %12, 16
  %18 = load i64, ptr @DynCastCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynCastCount, align 8
  %20 = trunc nuw nsw i64 %17 to i32
  %21 = load i64, ptr @DynControlFlowCount, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr @DynControlFlowCount, align 8
  ret i32 %20
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @srand_beebs(i32 noundef %0) local_unnamed_addr #14 {
  %2 = load i64, ptr @DynCastCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynCastCount, align 8
  %4 = zext i32 %0 to i64
  %5 = load i64, ptr @DynMemWriteCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynMemWriteCount, align 8
  store i64 %4, ptr @seed, align 8, !tbaa !24
  %7 = load i64, ptr @DynControlFlowCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @init_heap_beebs(ptr noundef %0, i64 noundef %1) local_unnamed_addr #15 {
  %3 = load i64, ptr @DynALUCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynALUCount, align 8
  %5 = and i64 %1, 7
  %6 = load i64, ptr @DynALUCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynALUCount, align 8
  %8 = icmp eq i64 %5, 0
  %9 = load i64, ptr @DynControlFlowCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynControlFlowCount, align 8
  br i1 %8, label %14, label %11

11:                                               ; preds = %11, %2
  %12 = load i64, ptr @DynControlFlowCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynControlFlowCount, align 8
  br label %11

14:                                               ; preds = %2
  %15 = load i64, ptr @DynMemWriteCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynMemWriteCount, align 8
  store ptr %0, ptr @heap_ptr, align 8, !tbaa !25
  %17 = load i64, ptr @DynAddressMathCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynAddressMathCount, align 8
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 %1
  %20 = load i64, ptr @DynMemWriteCount, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr @DynMemWriteCount, align 8
  store ptr %19, ptr @heap_end, align 8, !tbaa !25
  %22 = load i64, ptr @DynMemWriteCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynMemWriteCount, align 8
  store i64 0, ptr @heap_requested, align 8, !tbaa !24
  %24 = load i64, ptr @DynControlFlowCount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @check_heap_beebs(ptr noundef readnone captures(address) %0) local_unnamed_addr #8 {
  %2 = load i64, ptr @DynMemReadCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynMemReadCount, align 8
  %4 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %5 = load i64, ptr @DynAddressMathCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynAddressMathCount, align 8
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 %4
  %8 = load i64, ptr @DynMemReadCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynMemReadCount, align 8
  %10 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %11 = load i64, ptr @DynALUCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynALUCount, align 8
  %13 = icmp ule ptr %7, %10
  %14 = load i64, ptr @DynCastCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynCastCount, align 8
  %16 = zext i1 %13 to i32
  %17 = load i64, ptr @DynControlFlowCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynControlFlowCount, align 8
  ret i32 %16
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @malloc_beebs(i64 noundef %0) local_unnamed_addr #13 {
  %2 = load i64, ptr @DynALUCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynALUCount, align 8
  %4 = icmp eq i64 %0, 0
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  br i1 %4, label %54, label %7

7:                                                ; preds = %1
  %8 = load i64, ptr @DynMemReadCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynMemReadCount, align 8
  %10 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %11 = load i64, ptr @DynAddressMathCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynAddressMathCount, align 8
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 %0
  %14 = load i64, ptr @DynMemReadCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynMemReadCount, align 8
  %16 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %17 = load i64, ptr @DynALUCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynALUCount, align 8
  %19 = add i64 %16, %0
  %20 = load i64, ptr @DynCastCount, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr @DynCastCount, align 8
  %22 = ptrtoint ptr %13 to i64
  %23 = load i64, ptr @DynALUCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynALUCount, align 8
  %25 = and i64 %22, 7
  %26 = load i64, ptr @DynALUCount, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr @DynALUCount, align 8
  %28 = icmp eq i64 %25, 0
  %29 = load i64, ptr @DynALUCount, align 8
  %30 = add i64 %29, 1
  store i64 %30, ptr @DynALUCount, align 8
  %31 = sub nuw nsw i64 8, %25
  %32 = select i1 %28, i64 0, i64 %31
  %33 = load i64, ptr @DynALUCount, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr @DynALUCount, align 8
  %35 = add i64 %19, %32
  %36 = load i64, ptr @DynAddressMathCount, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr @DynAddressMathCount, align 8
  %38 = getelementptr inbounds nuw i8, ptr %13, i64 %32
  %39 = load i64, ptr @DynMemWriteCount, align 8
  %40 = add i64 %39, 1
  store i64 %40, ptr @DynMemWriteCount, align 8
  store i64 %35, ptr @heap_requested, align 8, !tbaa !24
  %41 = load i64, ptr @DynMemReadCount, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr @DynMemReadCount, align 8
  %43 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %44 = load i64, ptr @DynALUCount, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr @DynALUCount, align 8
  %46 = icmp ugt ptr %38, %43
  %47 = load i64, ptr @DynControlFlowCount, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr @DynControlFlowCount, align 8
  br i1 %46, label %54, label %49

49:                                               ; preds = %7
  %50 = load i64, ptr @DynMemWriteCount, align 8
  %51 = add i64 %50, 1
  store i64 %51, ptr @DynMemWriteCount, align 8
  store ptr %38, ptr @heap_ptr, align 8, !tbaa !25
  %52 = load i64, ptr @DynControlFlowCount, align 8
  %53 = add i64 %52, 1
  store i64 %53, ptr @DynControlFlowCount, align 8
  br label %54

54:                                               ; preds = %49, %7, %1
  %55 = phi ptr [ null, %1 ], [ %10, %49 ], [ null, %7 ]
  %56 = load i64, ptr @DynControlFlowCount, align 8
  %57 = add i64 %56, 1
  store i64 %57, ptr @DynControlFlowCount, align 8
  ret ptr %55
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) local_unnamed_addr #16 {
  %3 = load i64, ptr @DynALUCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynALUCount, align 8
  %5 = mul i64 %1, %0
  %6 = load i64, ptr @DynALUCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynALUCount, align 8
  %8 = icmp eq i64 %5, 0
  %9 = load i64, ptr @DynControlFlowCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynControlFlowCount, align 8
  br i1 %8, label %64, label %11

11:                                               ; preds = %2
  %12 = load i64, ptr @DynMemReadCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynMemReadCount, align 8
  %14 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %15 = load i64, ptr @DynAddressMathCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynAddressMathCount, align 8
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 %5
  %18 = load i64, ptr @DynMemReadCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynMemReadCount, align 8
  %20 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %21 = load i64, ptr @DynALUCount, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr @DynALUCount, align 8
  %23 = add i64 %20, %5
  %24 = load i64, ptr @DynCastCount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @DynCastCount, align 8
  %26 = ptrtoint ptr %17 to i64
  %27 = load i64, ptr @DynALUCount, align 8
  %28 = add i64 %27, 1
  store i64 %28, ptr @DynALUCount, align 8
  %29 = and i64 %26, 7
  %30 = load i64, ptr @DynALUCount, align 8
  %31 = add i64 %30, 1
  store i64 %31, ptr @DynALUCount, align 8
  %32 = icmp eq i64 %29, 0
  %33 = load i64, ptr @DynALUCount, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr @DynALUCount, align 8
  %35 = sub nuw nsw i64 8, %29
  %36 = select i1 %32, i64 0, i64 %35
  %37 = load i64, ptr @DynALUCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynALUCount, align 8
  %39 = add i64 %23, %36
  %40 = load i64, ptr @DynAddressMathCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynAddressMathCount, align 8
  %42 = getelementptr inbounds nuw i8, ptr %17, i64 %36
  %43 = load i64, ptr @DynMemWriteCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynMemWriteCount, align 8
  store i64 %39, ptr @heap_requested, align 8, !tbaa !24
  %45 = load i64, ptr @DynMemReadCount, align 8
  %46 = add i64 %45, 1
  store i64 %46, ptr @DynMemReadCount, align 8
  %47 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %48 = load i64, ptr @DynALUCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynALUCount, align 8
  %50 = icmp ugt ptr %42, %47
  %51 = load i64, ptr @DynControlFlowCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynControlFlowCount, align 8
  br i1 %50, label %64, label %53

53:                                               ; preds = %11
  %54 = load i64, ptr @DynMemWriteCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynMemWriteCount, align 8
  store ptr %42, ptr @heap_ptr, align 8, !tbaa !25
  %56 = load i64, ptr @DynALUCount, align 8
  %57 = add i64 %56, 1
  store i64 %57, ptr @DynALUCount, align 8
  %58 = icmp eq ptr %14, null
  %59 = load i64, ptr @DynControlFlowCount, align 8
  %60 = add i64 %59, 1
  store i64 %60, ptr @DynControlFlowCount, align 8
  br i1 %58, label %64, label %61

61:                                               ; preds = %53
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %14, i8 0, i64 %5, i1 false)
  %62 = load i64, ptr @DynControlFlowCount, align 8
  %63 = add i64 %62, 1
  store i64 %63, ptr @DynControlFlowCount, align 8
  br label %64

64:                                               ; preds = %61, %53, %11, %2
  %65 = phi ptr [ null, %53 ], [ %14, %61 ], [ null, %2 ], [ null, %11 ]
  %66 = load i64, ptr @DynControlFlowCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynControlFlowCount, align 8
  ret ptr %65
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @realloc_beebs(ptr noundef readonly captures(address_is_null) %0, i64 noundef %1) local_unnamed_addr #10 {
  %3 = load i64, ptr @DynCastCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynCastCount, align 8
  %5 = ptrtoint ptr %0 to i64
  %6 = load i64, ptr @DynALUCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynALUCount, align 8
  %8 = icmp eq ptr %0, null
  %9 = load i64, ptr @DynALUCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynALUCount, align 8
  %11 = icmp eq i64 %1, 0
  %12 = load i64, ptr @DynALUCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynALUCount, align 8
  %14 = or i1 %8, %11
  %15 = load i64, ptr @DynControlFlowCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynControlFlowCount, align 8
  br i1 %14, label %286, label %17

17:                                               ; preds = %2
  %18 = load i64, ptr @DynMemReadCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynMemReadCount, align 8
  %20 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %21 = load i64, ptr @DynCastCount, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr @DynCastCount, align 8
  %23 = ptrtoint ptr %20 to i64
  %24 = load i64, ptr @DynAddressMathCount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @DynAddressMathCount, align 8
  %26 = getelementptr inbounds nuw i8, ptr %20, i64 %1
  %27 = load i64, ptr @DynMemReadCount, align 8
  %28 = add i64 %27, 1
  store i64 %28, ptr @DynMemReadCount, align 8
  %29 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %30 = load i64, ptr @DynALUCount, align 8
  %31 = add i64 %30, 1
  store i64 %31, ptr @DynALUCount, align 8
  %32 = add i64 %29, %1
  %33 = load i64, ptr @DynCastCount, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr @DynCastCount, align 8
  %35 = ptrtoint ptr %26 to i64
  %36 = load i64, ptr @DynALUCount, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr @DynALUCount, align 8
  %38 = and i64 %35, 7
  %39 = load i64, ptr @DynALUCount, align 8
  %40 = add i64 %39, 1
  store i64 %40, ptr @DynALUCount, align 8
  %41 = icmp eq i64 %38, 0
  %42 = load i64, ptr @DynALUCount, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr @DynALUCount, align 8
  %44 = sub nuw nsw i64 8, %38
  %45 = select i1 %41, i64 0, i64 %44
  %46 = load i64, ptr @DynALUCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynALUCount, align 8
  %48 = add i64 %32, %45
  %49 = load i64, ptr @DynAddressMathCount, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr @DynAddressMathCount, align 8
  %51 = getelementptr inbounds nuw i8, ptr %26, i64 %45
  %52 = load i64, ptr @DynMemWriteCount, align 8
  %53 = add i64 %52, 1
  store i64 %53, ptr @DynMemWriteCount, align 8
  store i64 %48, ptr @heap_requested, align 8, !tbaa !24
  %54 = load i64, ptr @DynMemReadCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynMemReadCount, align 8
  %56 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %57 = load i64, ptr @DynALUCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynALUCount, align 8
  %59 = icmp ugt ptr %51, %56
  %60 = load i64, ptr @DynControlFlowCount, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr @DynControlFlowCount, align 8
  br i1 %59, label %286, label %62

62:                                               ; preds = %17
  %63 = load i64, ptr @DynMemWriteCount, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr @DynMemWriteCount, align 8
  store ptr %51, ptr @heap_ptr, align 8, !tbaa !25
  %65 = load i64, ptr @DynALUCount, align 8
  %66 = add i64 %65, 1
  store i64 %66, ptr @DynALUCount, align 8
  %67 = icmp eq ptr %20, null
  %68 = load i64, ptr @DynControlFlowCount, align 8
  %69 = add i64 %68, 1
  store i64 %69, ptr @DynControlFlowCount, align 8
  br i1 %67, label %286, label %70

70:                                               ; preds = %62
  %71 = load i64, ptr @DynALUCount, align 8
  %72 = add i64 %71, 1
  store i64 %72, ptr @DynALUCount, align 8
  %73 = icmp ult i64 %1, 4
  %74 = load i64, ptr @DynALUCount, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr @DynALUCount, align 8
  %76 = sub i64 %23, %5
  %77 = load i64, ptr @DynALUCount, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr @DynALUCount, align 8
  %79 = icmp ult i64 %76, 32
  %80 = load i64, ptr @DynALUCount, align 8
  %81 = add i64 %80, 1
  store i64 %81, ptr @DynALUCount, align 8
  %82 = or i1 %73, %79
  %83 = load i64, ptr @DynControlFlowCount, align 8
  %84 = add i64 %83, 1
  store i64 %84, ptr @DynControlFlowCount, align 8
  br i1 %82, label %178, label %85

85:                                               ; preds = %70
  %86 = load i64, ptr @DynALUCount, align 8
  %87 = add i64 %86, 1
  store i64 %87, ptr @DynALUCount, align 8
  %88 = icmp ult i64 %1, 32
  %89 = load i64, ptr @DynControlFlowCount, align 8
  %90 = add i64 %89, 1
  store i64 %90, ptr @DynControlFlowCount, align 8
  br i1 %88, label %144, label %91

91:                                               ; preds = %85
  %92 = load i64, ptr @DynALUCount, align 8
  %93 = add i64 %92, 1
  store i64 %93, ptr @DynALUCount, align 8
  %94 = and i64 %1, 28
  %95 = load i64, ptr @DynALUCount, align 8
  %96 = add i64 %95, 1
  store i64 %96, ptr @DynALUCount, align 8
  %97 = and i64 %1, -32
  %98 = load i64, ptr @DynControlFlowCount, align 8
  %99 = add i64 %98, 1
  store i64 %99, ptr @DynControlFlowCount, align 8
  br label %100

100:                                              ; preds = %100, %91
  %101 = phi i64 [ 0, %91 ], [ %126, %100 ]
  %102 = load i64, ptr @DynAddressMathCount, align 8
  %103 = add i64 %102, 1
  store i64 %103, ptr @DynAddressMathCount, align 8
  %104 = getelementptr inbounds nuw i8, ptr %0, i64 %101
  %105 = load i64, ptr @DynAddressMathCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynAddressMathCount, align 8
  %107 = getelementptr inbounds nuw i8, ptr %104, i64 16
  %108 = load i64, ptr @DynMemReadCount, align 8
  %109 = add i64 %108, 1
  store i64 %109, ptr @DynMemReadCount, align 8
  %110 = load <16 x i8>, ptr %104, align 1, !tbaa !17
  %111 = load i64, ptr @DynMemReadCount, align 8
  %112 = add i64 %111, 1
  store i64 %112, ptr @DynMemReadCount, align 8
  %113 = load <16 x i8>, ptr %107, align 1, !tbaa !17
  %114 = load i64, ptr @DynAddressMathCount, align 8
  %115 = add i64 %114, 1
  store i64 %115, ptr @DynAddressMathCount, align 8
  %116 = getelementptr inbounds nuw i8, ptr %20, i64 %101
  %117 = load i64, ptr @DynAddressMathCount, align 8
  %118 = add i64 %117, 1
  store i64 %118, ptr @DynAddressMathCount, align 8
  %119 = getelementptr inbounds nuw i8, ptr %116, i64 16
  %120 = load i64, ptr @DynMemWriteCount, align 8
  %121 = add i64 %120, 1
  store i64 %121, ptr @DynMemWriteCount, align 8
  store <16 x i8> %110, ptr %116, align 1, !tbaa !17
  %122 = load i64, ptr @DynMemWriteCount, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr @DynMemWriteCount, align 8
  store <16 x i8> %113, ptr %119, align 1, !tbaa !17
  %124 = load i64, ptr @DynALUCount, align 8
  %125 = add i64 %124, 1
  store i64 %125, ptr @DynALUCount, align 8
  %126 = add nuw i64 %101, 32
  %127 = load i64, ptr @DynALUCount, align 8
  %128 = add i64 %127, 1
  store i64 %128, ptr @DynALUCount, align 8
  %129 = icmp eq i64 %126, %97
  %130 = load i64, ptr @DynControlFlowCount, align 8
  %131 = add i64 %130, 1
  store i64 %131, ptr @DynControlFlowCount, align 8
  br i1 %129, label %132, label %100, !llvm.loop !27

132:                                              ; preds = %100
  %133 = load i64, ptr @DynALUCount, align 8
  %134 = add i64 %133, 1
  store i64 %134, ptr @DynALUCount, align 8
  %135 = icmp eq i64 %1, %97
  %136 = load i64, ptr @DynControlFlowCount, align 8
  %137 = add i64 %136, 1
  store i64 %137, ptr @DynControlFlowCount, align 8
  br i1 %135, label %286, label %138

138:                                              ; preds = %132
  %139 = load i64, ptr @DynALUCount, align 8
  %140 = add i64 %139, 1
  store i64 %140, ptr @DynALUCount, align 8
  %141 = icmp eq i64 %94, 0
  %142 = load i64, ptr @DynControlFlowCount, align 8
  %143 = add i64 %142, 1
  store i64 %143, ptr @DynControlFlowCount, align 8
  br i1 %141, label %178, label %144, !prof !30

144:                                              ; preds = %138, %85
  %145 = phi i64 [ %97, %138 ], [ 0, %85 ]
  %146 = load i64, ptr @DynALUCount, align 8
  %147 = add i64 %146, 1
  store i64 %147, ptr @DynALUCount, align 8
  %148 = and i64 %1, -4
  %149 = load i64, ptr @DynControlFlowCount, align 8
  %150 = add i64 %149, 1
  store i64 %150, ptr @DynControlFlowCount, align 8
  br label %151

151:                                              ; preds = %151, %144
  %152 = phi i64 [ %145, %144 ], [ %166, %151 ]
  %153 = load i64, ptr @DynAddressMathCount, align 8
  %154 = add i64 %153, 1
  store i64 %154, ptr @DynAddressMathCount, align 8
  %155 = getelementptr inbounds nuw i8, ptr %0, i64 %152
  %156 = load i64, ptr @DynMemReadCount, align 8
  %157 = add i64 %156, 1
  store i64 %157, ptr @DynMemReadCount, align 8
  %158 = load <4 x i8>, ptr %155, align 1, !tbaa !17
  %159 = load i64, ptr @DynAddressMathCount, align 8
  %160 = add i64 %159, 1
  store i64 %160, ptr @DynAddressMathCount, align 8
  %161 = getelementptr inbounds nuw i8, ptr %20, i64 %152
  %162 = load i64, ptr @DynMemWriteCount, align 8
  %163 = add i64 %162, 1
  store i64 %163, ptr @DynMemWriteCount, align 8
  store <4 x i8> %158, ptr %161, align 1, !tbaa !17
  %164 = load i64, ptr @DynALUCount, align 8
  %165 = add i64 %164, 1
  store i64 %165, ptr @DynALUCount, align 8
  %166 = add nuw i64 %152, 4
  %167 = load i64, ptr @DynALUCount, align 8
  %168 = add i64 %167, 1
  store i64 %168, ptr @DynALUCount, align 8
  %169 = icmp eq i64 %166, %148
  %170 = load i64, ptr @DynControlFlowCount, align 8
  %171 = add i64 %170, 1
  store i64 %171, ptr @DynControlFlowCount, align 8
  br i1 %169, label %172, label %151, !llvm.loop !31

172:                                              ; preds = %151
  %173 = load i64, ptr @DynALUCount, align 8
  %174 = add i64 %173, 1
  store i64 %174, ptr @DynALUCount, align 8
  %175 = icmp eq i64 %1, %148
  %176 = load i64, ptr @DynControlFlowCount, align 8
  %177 = add i64 %176, 1
  store i64 %177, ptr @DynControlFlowCount, align 8
  br i1 %175, label %286, label %178

178:                                              ; preds = %172, %138, %70
  %179 = phi i64 [ 0, %70 ], [ %97, %138 ], [ %148, %172 ]
  %180 = load i64, ptr @DynALUCount, align 8
  %181 = add i64 %180, 1
  store i64 %181, ptr @DynALUCount, align 8
  %182 = and i64 %1, 3
  %183 = load i64, ptr @DynALUCount, align 8
  %184 = add i64 %183, 1
  store i64 %184, ptr @DynALUCount, align 8
  %185 = icmp eq i64 %182, 0
  %186 = load i64, ptr @DynControlFlowCount, align 8
  %187 = add i64 %186, 1
  store i64 %187, ptr @DynControlFlowCount, align 8
  br i1 %185, label %213, label %188

188:                                              ; preds = %188, %178
  %189 = phi i64 [ %204, %188 ], [ %179, %178 ]
  %190 = phi i64 [ %207, %188 ], [ 0, %178 ]
  %191 = load i64, ptr @DynAddressMathCount, align 8
  %192 = add i64 %191, 1
  store i64 %192, ptr @DynAddressMathCount, align 8
  %193 = getelementptr inbounds nuw i8, ptr %0, i64 %189
  %194 = load i64, ptr @DynMemReadCount, align 8
  %195 = add i64 %194, 1
  store i64 %195, ptr @DynMemReadCount, align 8
  %196 = load i8, ptr %193, align 1, !tbaa !17
  %197 = load i64, ptr @DynAddressMathCount, align 8
  %198 = add i64 %197, 1
  store i64 %198, ptr @DynAddressMathCount, align 8
  %199 = getelementptr inbounds nuw i8, ptr %20, i64 %189
  %200 = load i64, ptr @DynMemWriteCount, align 8
  %201 = add i64 %200, 1
  store i64 %201, ptr @DynMemWriteCount, align 8
  store i8 %196, ptr %199, align 1, !tbaa !17
  %202 = load i64, ptr @DynALUCount, align 8
  %203 = add i64 %202, 1
  store i64 %203, ptr @DynALUCount, align 8
  %204 = add nuw i64 %189, 1
  %205 = load i64, ptr @DynALUCount, align 8
  %206 = add i64 %205, 1
  store i64 %206, ptr @DynALUCount, align 8
  %207 = add i64 %190, 1
  %208 = load i64, ptr @DynALUCount, align 8
  %209 = add i64 %208, 1
  store i64 %209, ptr @DynALUCount, align 8
  %210 = icmp eq i64 %207, %182
  %211 = load i64, ptr @DynControlFlowCount, align 8
  %212 = add i64 %211, 1
  store i64 %212, ptr @DynControlFlowCount, align 8
  br i1 %210, label %213, label %188, !llvm.loop !32

213:                                              ; preds = %188, %178
  %214 = phi i64 [ %179, %178 ], [ %204, %188 ]
  %215 = load i64, ptr @DynALUCount, align 8
  %216 = add i64 %215, 1
  store i64 %216, ptr @DynALUCount, align 8
  %217 = sub i64 %179, %1
  %218 = load i64, ptr @DynALUCount, align 8
  %219 = add i64 %218, 1
  store i64 %219, ptr @DynALUCount, align 8
  %220 = icmp ugt i64 %217, -4
  %221 = load i64, ptr @DynControlFlowCount, align 8
  %222 = add i64 %221, 1
  store i64 %222, ptr @DynControlFlowCount, align 8
  br i1 %220, label %286, label %223

223:                                              ; preds = %223, %213
  %224 = phi i64 [ %280, %223 ], [ %214, %213 ]
  %225 = load i64, ptr @DynAddressMathCount, align 8
  %226 = add i64 %225, 1
  store i64 %226, ptr @DynAddressMathCount, align 8
  %227 = getelementptr inbounds nuw i8, ptr %0, i64 %224
  %228 = load i64, ptr @DynMemReadCount, align 8
  %229 = add i64 %228, 1
  store i64 %229, ptr @DynMemReadCount, align 8
  %230 = load i8, ptr %227, align 1, !tbaa !17
  %231 = load i64, ptr @DynAddressMathCount, align 8
  %232 = add i64 %231, 1
  store i64 %232, ptr @DynAddressMathCount, align 8
  %233 = getelementptr inbounds nuw i8, ptr %20, i64 %224
  %234 = load i64, ptr @DynMemWriteCount, align 8
  %235 = add i64 %234, 1
  store i64 %235, ptr @DynMemWriteCount, align 8
  store i8 %230, ptr %233, align 1, !tbaa !17
  %236 = load i64, ptr @DynALUCount, align 8
  %237 = add i64 %236, 1
  store i64 %237, ptr @DynALUCount, align 8
  %238 = add nuw i64 %224, 1
  %239 = load i64, ptr @DynAddressMathCount, align 8
  %240 = add i64 %239, 1
  store i64 %240, ptr @DynAddressMathCount, align 8
  %241 = getelementptr inbounds nuw i8, ptr %0, i64 %238
  %242 = load i64, ptr @DynMemReadCount, align 8
  %243 = add i64 %242, 1
  store i64 %243, ptr @DynMemReadCount, align 8
  %244 = load i8, ptr %241, align 1, !tbaa !17
  %245 = load i64, ptr @DynAddressMathCount, align 8
  %246 = add i64 %245, 1
  store i64 %246, ptr @DynAddressMathCount, align 8
  %247 = getelementptr inbounds nuw i8, ptr %20, i64 %238
  %248 = load i64, ptr @DynMemWriteCount, align 8
  %249 = add i64 %248, 1
  store i64 %249, ptr @DynMemWriteCount, align 8
  store i8 %244, ptr %247, align 1, !tbaa !17
  %250 = load i64, ptr @DynALUCount, align 8
  %251 = add i64 %250, 1
  store i64 %251, ptr @DynALUCount, align 8
  %252 = add nuw i64 %224, 2
  %253 = load i64, ptr @DynAddressMathCount, align 8
  %254 = add i64 %253, 1
  store i64 %254, ptr @DynAddressMathCount, align 8
  %255 = getelementptr inbounds nuw i8, ptr %0, i64 %252
  %256 = load i64, ptr @DynMemReadCount, align 8
  %257 = add i64 %256, 1
  store i64 %257, ptr @DynMemReadCount, align 8
  %258 = load i8, ptr %255, align 1, !tbaa !17
  %259 = load i64, ptr @DynAddressMathCount, align 8
  %260 = add i64 %259, 1
  store i64 %260, ptr @DynAddressMathCount, align 8
  %261 = getelementptr inbounds nuw i8, ptr %20, i64 %252
  %262 = load i64, ptr @DynMemWriteCount, align 8
  %263 = add i64 %262, 1
  store i64 %263, ptr @DynMemWriteCount, align 8
  store i8 %258, ptr %261, align 1, !tbaa !17
  %264 = load i64, ptr @DynALUCount, align 8
  %265 = add i64 %264, 1
  store i64 %265, ptr @DynALUCount, align 8
  %266 = add nuw i64 %224, 3
  %267 = load i64, ptr @DynAddressMathCount, align 8
  %268 = add i64 %267, 1
  store i64 %268, ptr @DynAddressMathCount, align 8
  %269 = getelementptr inbounds nuw i8, ptr %0, i64 %266
  %270 = load i64, ptr @DynMemReadCount, align 8
  %271 = add i64 %270, 1
  store i64 %271, ptr @DynMemReadCount, align 8
  %272 = load i8, ptr %269, align 1, !tbaa !17
  %273 = load i64, ptr @DynAddressMathCount, align 8
  %274 = add i64 %273, 1
  store i64 %274, ptr @DynAddressMathCount, align 8
  %275 = getelementptr inbounds nuw i8, ptr %20, i64 %266
  %276 = load i64, ptr @DynMemWriteCount, align 8
  %277 = add i64 %276, 1
  store i64 %277, ptr @DynMemWriteCount, align 8
  store i8 %272, ptr %275, align 1, !tbaa !17
  %278 = load i64, ptr @DynALUCount, align 8
  %279 = add i64 %278, 1
  store i64 %279, ptr @DynALUCount, align 8
  %280 = add nuw i64 %224, 4
  %281 = load i64, ptr @DynALUCount, align 8
  %282 = add i64 %281, 1
  store i64 %282, ptr @DynALUCount, align 8
  %283 = icmp eq i64 %280, %1
  %284 = load i64, ptr @DynControlFlowCount, align 8
  %285 = add i64 %284, 1
  store i64 %285, ptr @DynControlFlowCount, align 8
  br i1 %283, label %286, label %223, !llvm.loop !34

286:                                              ; preds = %223, %213, %172, %132, %62, %17, %2
  %287 = phi ptr [ null, %2 ], [ null, %17 ], [ null, %62 ], [ %20, %132 ], [ %20, %172 ], [ %20, %223 ], [ %20, %213 ]
  %288 = load i64, ptr @DynControlFlowCount, align 8
  %289 = add i64 %288, 1
  store i64 %289, ptr @DynControlFlowCount, align 8
  ret ptr %287
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @free_beebs(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  %2 = load i64, ptr @DynControlFlowCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynControlFlowCount, align 8
  ret void
}

declare i32 @printf(ptr, ...)

attributes #0 = { nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: write) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }
attributes #8 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nounwind }

!llvm.ident = !{!0}
!llvm.errno.tbaa = !{!1}
!llvm.module.flags = !{!5, !6, !7, !8}

!0 = !{!"clang version 22.1.3"}
!1 = !{!2, !2, i64 0}
!2 = !{!"int", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{i32 8, !"PIC Level", i32 2}
!7 = !{i32 7, !"PIE Level", i32 2}
!8 = !{i32 7, !"uwtable", i32 2}
!9 = !{i64 1233}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = !{!13, !14, i64 32}
!13 = !{!"sha256_ctx", !3, i64 0, !14, i64 32, !3, i64 40, !2, i64 104}
!14 = !{!"long", !3, i64 0}
!15 = !{!13, !2, i64 104}
!16 = distinct !{!16, !11}
!17 = !{!3, !3, i64 0}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !11}
!22 = distinct !{!22, !11}
!23 = distinct !{!23, !11}
!24 = !{!14, !14, i64 0}
!25 = !{!26, !26, i64 0}
!26 = !{!"any pointer", !3, i64 0}
!27 = distinct !{!27, !11, !28, !29}
!28 = !{!"llvm.loop.isvectorized", i32 1}
!29 = !{!"llvm.loop.unroll.runtime.disable"}
!30 = !{!"branch_weights", i32 4, i32 28}
!31 = distinct !{!31, !11, !28, !29}
!32 = distinct !{!32, !33}
!33 = !{!"llvm.loop.unroll.disable"}
!34 = distinct !{!34, !11, !28}
