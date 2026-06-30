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
  %7 = load volatile i32, ptr %3, align 4, !tbaa !1
  %8 = tail call i32 @verify_benchmark(i32 noundef %7) #17
  %9 = icmp eq i32 %8, 0
  %10 = zext i1 %9 to i32
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  %11 = load i64, ptr @DynMemReadCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynMemReadCount, align 8
  %13 = load i64, ptr @DynControlFlowCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynControlFlowCount, align 8
  %15 = load i64, ptr @DynALUCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynALUCount, align 8
  %17 = load i64, ptr @DynCastCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynCastCount, align 8
  %19 = load i64, ptr @DynMemReadCount, align 8
  %20 = load i64, ptr @DynMemWriteCount, align 8
  %21 = load i64, ptr @DynAddressMathCount, align 8
  %22 = load i64, ptr @DynControlFlowCount, align 8
  %23 = load i64, ptr @DynALUCount, align 8
  %24 = load i64, ptr @DynVectorCount, align 8
  %25 = load i64, ptr @DynCastCount, align 8
  %26 = call i32 (ptr, ...) @printf(ptr @CSVFormatString, i64 %19, i64 %20, i64 %21, i64 %22, i64 %23, i64 %24, i64 %25)
  ret i32 %10

27:                                               ; preds = %27, %2
  %28 = phi i32 [ 0, %2 ], [ %31, %27 ]
  %29 = tail call i32 @benchmark() #17
  store volatile i32 %29, ptr %3, align 4, !tbaa !1
  %30 = load volatile i32, ptr %3, align 4, !tbaa !1
  tail call void asm sideeffect "", "r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 %30) #17, !srcloc !9
  %31 = add nuw nsw i32 %28, 1
  %32 = icmp eq i32 %31, 10000
  %33 = load i64, ptr @DynMemReadCount, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr @DynMemReadCount, align 8
  %35 = load i64, ptr @DynMemWriteCount, align 8
  %36 = add i64 %35, 1
  store i64 %36, ptr @DynMemWriteCount, align 8
  %37 = load i64, ptr @DynControlFlowCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynControlFlowCount, align 8
  %39 = load i64, ptr @DynALUCount, align 8
  %40 = add i64 %39, 2
  store i64 %40, ptr @DynALUCount, align 8
  br i1 %32, label %6, label %27, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(argmem: readwrite) uwtable
define dso_local void @sha256_init(ptr noundef writeonly captures(none) initializes((0, 40), (104, 108)) %0) #2 {
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 32
  store i64 0, ptr %2, align 8, !tbaa !12
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 104
  store i32 0, ptr %3, align 8, !tbaa !15
  %4 = load i64, ptr @DynMemWriteCount, align 8
  %5 = add i64 %4, 2
  store i64 %5, ptr @DynMemWriteCount, align 8
  %6 = load i64, ptr @DynAddressMathCount, align 8
  %7 = add i64 %6, 2
  store i64 %7, ptr @DynAddressMathCount, align 8
  %8 = load i64, ptr @DynControlFlowCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @sha256_update(ptr noundef captures(none) %0, i64 noundef %1, ptr noundef readonly captures(none) %2) #3 {
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 104
  %5 = load i32, ptr %4, align 8, !tbaa !15
  %6 = icmp eq i32 %5, 0
  %7 = load i64, ptr @DynMemReadCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynMemReadCount, align 8
  %9 = load i64, ptr @DynAddressMathCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynAddressMathCount, align 8
  %11 = load i64, ptr @DynControlFlowCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynControlFlowCount, align 8
  %13 = load i64, ptr @DynALUCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynALUCount, align 8
  br i1 %6, label %58, label %15

15:                                               ; preds = %3
  %16 = zext i32 %5 to i64
  %17 = sub i32 64, %5
  %18 = zext i32 %17 to i64
  %19 = icmp ult i64 %1, %18
  %20 = getelementptr inbounds nuw i8, ptr %0, i64 40
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 %16
  %22 = load i64, ptr @DynAddressMathCount, align 8
  %23 = add i64 %22, 2
  store i64 %23, ptr @DynAddressMathCount, align 8
  %24 = load i64, ptr @DynControlFlowCount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @DynControlFlowCount, align 8
  %26 = load i64, ptr @DynALUCount, align 8
  %27 = add i64 %26, 2
  store i64 %27, ptr @DynALUCount, align 8
  %28 = load i64, ptr @DynCastCount, align 8
  %29 = add i64 %28, 2
  store i64 %29, ptr @DynCastCount, align 8
  br i1 %19, label %46, label %30

30:                                               ; preds = %15
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %21, ptr align 1 %2, i64 %18, i1 false)
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %20, ptr noundef nonnull @K)
  %31 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %32 = load i64, ptr %31, align 8, !tbaa !12
  %33 = add i64 %32, 1
  store i64 %33, ptr %31, align 8, !tbaa !12
  %34 = getelementptr inbounds nuw i8, ptr %2, i64 %18
  %35 = sub nuw i64 %1, %18
  %36 = load i64, ptr @DynMemReadCount, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr @DynMemReadCount, align 8
  %38 = load i64, ptr @DynMemWriteCount, align 8
  %39 = add i64 %38, 1
  store i64 %39, ptr @DynMemWriteCount, align 8
  %40 = load i64, ptr @DynAddressMathCount, align 8
  %41 = add i64 %40, 2
  store i64 %41, ptr @DynAddressMathCount, align 8
  %42 = load i64, ptr @DynControlFlowCount, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr @DynControlFlowCount, align 8
  %44 = load i64, ptr @DynALUCount, align 8
  %45 = add i64 %44, 2
  store i64 %45, ptr @DynALUCount, align 8
  br label %58

46:                                               ; preds = %15
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %21, ptr align 1 %2, i64 %1, i1 false)
  %47 = load i32, ptr %4, align 8, !tbaa !15
  %48 = trunc nuw i64 %1 to i32
  %49 = add i32 %47, %48
  %50 = load i64, ptr @DynMemReadCount, align 8
  %51 = add i64 %50, 1
  store i64 %51, ptr @DynMemReadCount, align 8
  %52 = load i64, ptr @DynControlFlowCount, align 8
  %53 = add i64 %52, 1
  store i64 %53, ptr @DynControlFlowCount, align 8
  %54 = load i64, ptr @DynALUCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynALUCount, align 8
  %56 = load i64, ptr @DynCastCount, align 8
  %57 = add i64 %56, 1
  store i64 %57, ptr @DynCastCount, align 8
  br label %101

58:                                               ; preds = %30, %3
  %59 = phi ptr [ %34, %30 ], [ %2, %3 ]
  %60 = phi i64 [ %35, %30 ], [ %1, %3 ]
  %61 = icmp ugt i64 %60, 63
  %62 = load i64, ptr @DynControlFlowCount, align 8
  %63 = add i64 %62, 1
  store i64 %63, ptr @DynControlFlowCount, align 8
  %64 = load i64, ptr @DynALUCount, align 8
  %65 = add i64 %64, 1
  store i64 %65, ptr @DynALUCount, align 8
  br i1 %61, label %66, label %90

66:                                               ; preds = %58
  %67 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %68 = load i64, ptr @DynAddressMathCount, align 8
  %69 = add i64 %68, 1
  store i64 %69, ptr @DynAddressMathCount, align 8
  %70 = load i64, ptr @DynControlFlowCount, align 8
  %71 = add i64 %70, 1
  store i64 %71, ptr @DynControlFlowCount, align 8
  br label %72

72:                                               ; preds = %72, %66
  %73 = phi i64 [ %60, %66 ], [ %78, %72 ]
  %74 = phi ptr [ %59, %66 ], [ %77, %72 ]
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef %74, ptr noundef nonnull @K)
  %75 = load i64, ptr %67, align 8, !tbaa !12
  %76 = add i64 %75, 1
  store i64 %76, ptr %67, align 8, !tbaa !12
  %77 = getelementptr inbounds nuw i8, ptr %74, i64 64
  %78 = add i64 %73, -64
  %79 = icmp ugt i64 %78, 63
  %80 = load i64, ptr @DynMemReadCount, align 8
  %81 = add i64 %80, 1
  store i64 %81, ptr @DynMemReadCount, align 8
  %82 = load i64, ptr @DynMemWriteCount, align 8
  %83 = add i64 %82, 1
  store i64 %83, ptr @DynMemWriteCount, align 8
  %84 = load i64, ptr @DynAddressMathCount, align 8
  %85 = add i64 %84, 1
  store i64 %85, ptr @DynAddressMathCount, align 8
  %86 = load i64, ptr @DynControlFlowCount, align 8
  %87 = add i64 %86, 1
  store i64 %87, ptr @DynControlFlowCount, align 8
  %88 = load i64, ptr @DynALUCount, align 8
  %89 = add i64 %88, 3
  store i64 %89, ptr @DynALUCount, align 8
  br i1 %79, label %72, label %90, !llvm.loop !16

90:                                               ; preds = %72, %58
  %91 = phi ptr [ %59, %58 ], [ %77, %72 ]
  %92 = phi i64 [ %60, %58 ], [ %78, %72 ]
  %93 = getelementptr inbounds nuw i8, ptr %0, i64 40
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %93, ptr align 1 %91, i64 %92, i1 false)
  %94 = trunc nuw nsw i64 %92 to i32
  %95 = load i64, ptr @DynAddressMathCount, align 8
  %96 = add i64 %95, 1
  store i64 %96, ptr @DynAddressMathCount, align 8
  %97 = load i64, ptr @DynControlFlowCount, align 8
  %98 = add i64 %97, 1
  store i64 %98, ptr @DynControlFlowCount, align 8
  %99 = load i64, ptr @DynCastCount, align 8
  %100 = add i64 %99, 1
  store i64 %100, ptr @DynCastCount, align 8
  br label %101

101:                                              ; preds = %90, %46
  %102 = phi i32 [ %49, %46 ], [ %94, %90 ]
  store i32 %102, ptr %4, align 8, !tbaa !15
  %103 = load i64, ptr @DynMemWriteCount, align 8
  %104 = add i64 %103, 1
  store i64 %104, ptr @DynMemWriteCount, align 8
  %105 = load i64, ptr @DynControlFlowCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @sha256_digest(ptr noundef captures(none) %0, i64 noundef %1, ptr noundef writeonly captures(none) %2) #3 {
  %4 = icmp ult i64 %1, 33
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  %7 = load i64, ptr @DynALUCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynALUCount, align 8
  br i1 %4, label %12, label %9

9:                                                ; preds = %9, %3
  %10 = load i64, ptr @DynControlFlowCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynControlFlowCount, align 8
  br label %9

12:                                               ; preds = %3
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 104
  %14 = load i32, ptr %13, align 8, !tbaa !15
  %15 = icmp ult i32 %14, 64
  %16 = load i64, ptr @DynMemReadCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynMemReadCount, align 8
  %18 = load i64, ptr @DynAddressMathCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynAddressMathCount, align 8
  %20 = load i64, ptr @DynControlFlowCount, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr @DynControlFlowCount, align 8
  %22 = load i64, ptr @DynALUCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynALUCount, align 8
  br i1 %15, label %27, label %24

24:                                               ; preds = %24, %12
  %25 = load i64, ptr @DynControlFlowCount, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr @DynControlFlowCount, align 8
  br label %24

27:                                               ; preds = %12
  %28 = zext nneg i32 %14 to i64
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 40
  %30 = add nuw nsw i32 %14, 1
  %31 = getelementptr inbounds nuw i8, ptr %29, i64 %28
  store i8 -128, ptr %31, align 1, !tbaa !17
  %32 = icmp samesign ugt i32 %14, 55
  %33 = load i64, ptr @DynMemWriteCount, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr @DynMemWriteCount, align 8
  %35 = load i64, ptr @DynAddressMathCount, align 8
  %36 = add i64 %35, 2
  store i64 %36, ptr @DynAddressMathCount, align 8
  %37 = load i64, ptr @DynControlFlowCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynControlFlowCount, align 8
  %39 = load i64, ptr @DynALUCount, align 8
  %40 = add i64 %39, 2
  store i64 %40, ptr @DynALUCount, align 8
  %41 = load i64, ptr @DynCastCount, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr @DynCastCount, align 8
  br i1 %32, label %43, label %55

43:                                               ; preds = %27
  %44 = zext nneg i32 %30 to i64
  %45 = getelementptr inbounds nuw i8, ptr %29, i64 %44
  %46 = sub nuw nsw i64 64, %44
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %45, i8 0, i64 %46, i1 false)
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %29, ptr noundef nonnull @K)
  %47 = load i64, ptr @DynAddressMathCount, align 8
  %48 = add i64 %47, 1
  store i64 %48, ptr @DynAddressMathCount, align 8
  %49 = load i64, ptr @DynControlFlowCount, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr @DynControlFlowCount, align 8
  %51 = load i64, ptr @DynALUCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynALUCount, align 8
  %53 = load i64, ptr @DynCastCount, align 8
  %54 = add i64 %53, 1
  store i64 %54, ptr @DynCastCount, align 8
  br label %55

55:                                               ; preds = %43, %27
  %56 = phi i32 [ 0, %43 ], [ %30, %27 ]
  %57 = zext nneg i32 %56 to i64
  %58 = getelementptr inbounds nuw i8, ptr %29, i64 %57
  %59 = sub nuw nsw i64 56, %57
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %58, i8 0, i64 %59, i1 false)
  %60 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %61 = load i64, ptr %60, align 8, !tbaa !12
  %62 = shl i64 %61, 9
  %63 = load i32, ptr %13, align 8, !tbaa !15
  %64 = shl i32 %63, 3
  %65 = zext i32 %64 to i64
  %66 = or i64 %62, %65
  %67 = lshr i64 %62, 56
  %68 = trunc nuw i64 %67 to i8
  %69 = getelementptr inbounds nuw i8, ptr %0, i64 96
  store i8 %68, ptr %69, align 8, !tbaa !17
  %70 = lshr i64 %62, 48
  %71 = trunc i64 %70 to i8
  %72 = getelementptr inbounds nuw i8, ptr %0, i64 97
  store i8 %71, ptr %72, align 1, !tbaa !17
  %73 = lshr i64 %62, 40
  %74 = trunc i64 %73 to i8
  %75 = getelementptr inbounds nuw i8, ptr %0, i64 98
  store i8 %74, ptr %75, align 2, !tbaa !17
  %76 = lshr i64 %62, 32
  %77 = trunc i64 %76 to i8
  %78 = getelementptr inbounds nuw i8, ptr %0, i64 99
  store i8 %77, ptr %78, align 1, !tbaa !17
  %79 = lshr i64 %66, 24
  %80 = trunc i64 %79 to i8
  %81 = getelementptr inbounds nuw i8, ptr %0, i64 100
  store i8 %80, ptr %81, align 4, !tbaa !17
  %82 = lshr i64 %66, 16
  %83 = trunc i64 %82 to i8
  %84 = getelementptr inbounds nuw i8, ptr %0, i64 101
  store i8 %83, ptr %84, align 1, !tbaa !17
  %85 = lshr i64 %66, 8
  %86 = trunc i64 %85 to i8
  %87 = getelementptr inbounds nuw i8, ptr %0, i64 102
  store i8 %86, ptr %87, align 2, !tbaa !17
  %88 = trunc i32 %64 to i8
  %89 = getelementptr inbounds nuw i8, ptr %0, i64 103
  store i8 %88, ptr %89, align 1, !tbaa !17
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %29, ptr noundef nonnull @K)
  %90 = lshr i64 %1, 2
  %91 = trunc nuw nsw i64 %1 to i32
  %92 = and i32 %91, 3
  %93 = icmp eq i64 %90, 0
  %94 = load i64, ptr @DynMemReadCount, align 8
  %95 = add i64 %94, 2
  store i64 %95, ptr @DynMemReadCount, align 8
  %96 = load i64, ptr @DynMemWriteCount, align 8
  %97 = add i64 %96, 8
  store i64 %97, ptr @DynMemWriteCount, align 8
  %98 = load i64, ptr @DynAddressMathCount, align 8
  %99 = add i64 %98, 10
  store i64 %99, ptr @DynAddressMathCount, align 8
  %100 = load i64, ptr @DynControlFlowCount, align 8
  %101 = add i64 %100, 1
  store i64 %101, ptr @DynControlFlowCount, align 8
  %102 = load i64, ptr @DynALUCount, align 8
  %103 = add i64 %102, 14
  store i64 %103, ptr @DynALUCount, align 8
  %104 = load i64, ptr @DynCastCount, align 8
  %105 = add i64 %104, 11
  store i64 %105, ptr @DynCastCount, align 8
  br i1 %93, label %209, label %106

106:                                              ; preds = %55
  %107 = and i64 %90, 1
  %108 = icmp eq i64 %90, 1
  %109 = load i64, ptr @DynControlFlowCount, align 8
  %110 = add i64 %109, 1
  store i64 %110, ptr @DynControlFlowCount, align 8
  %111 = load i64, ptr @DynALUCount, align 8
  %112 = add i64 %111, 2
  store i64 %112, ptr @DynALUCount, align 8
  br i1 %108, label %177, label %113

113:                                              ; preds = %106
  %114 = and i64 %90, 14
  %115 = load i64, ptr @DynControlFlowCount, align 8
  %116 = add i64 %115, 1
  store i64 %116, ptr @DynControlFlowCount, align 8
  %117 = load i64, ptr @DynALUCount, align 8
  %118 = add i64 %117, 1
  store i64 %118, ptr @DynALUCount, align 8
  br label %119

119:                                              ; preds = %119, %113
  %120 = phi ptr [ %2, %113 ], [ %156, %119 ]
  %121 = phi i64 [ 0, %113 ], [ %155, %119 ]
  %122 = phi i64 [ 0, %113 ], [ %157, %119 ]
  %123 = getelementptr inbounds nuw i32, ptr %0, i64 %121
  %124 = load i32, ptr %123, align 4, !tbaa !1
  %125 = lshr i32 %124, 24
  %126 = trunc nuw i32 %125 to i8
  store i8 %126, ptr %120, align 1, !tbaa !17
  %127 = load i32, ptr %123, align 4, !tbaa !1
  %128 = lshr i32 %127, 16
  %129 = trunc i32 %128 to i8
  %130 = getelementptr inbounds nuw i8, ptr %120, i64 1
  store i8 %129, ptr %130, align 1, !tbaa !17
  %131 = load i32, ptr %123, align 4, !tbaa !1
  %132 = lshr i32 %131, 8
  %133 = trunc i32 %132 to i8
  %134 = getelementptr inbounds nuw i8, ptr %120, i64 2
  store i8 %133, ptr %134, align 1, !tbaa !17
  %135 = load i32, ptr %123, align 4, !tbaa !1
  %136 = trunc i32 %135 to i8
  %137 = getelementptr inbounds nuw i8, ptr %120, i64 3
  store i8 %136, ptr %137, align 1, !tbaa !17
  %138 = getelementptr inbounds nuw i8, ptr %120, i64 4
  %139 = getelementptr inbounds nuw i32, ptr %0, i64 %121
  %140 = getelementptr inbounds nuw i8, ptr %139, i64 4
  %141 = load i32, ptr %140, align 4, !tbaa !1
  %142 = lshr i32 %141, 24
  %143 = trunc nuw i32 %142 to i8
  store i8 %143, ptr %138, align 1, !tbaa !17
  %144 = load i32, ptr %140, align 4, !tbaa !1
  %145 = lshr i32 %144, 16
  %146 = trunc i32 %145 to i8
  %147 = getelementptr inbounds nuw i8, ptr %120, i64 5
  store i8 %146, ptr %147, align 1, !tbaa !17
  %148 = load i32, ptr %140, align 4, !tbaa !1
  %149 = lshr i32 %148, 8
  %150 = trunc i32 %149 to i8
  %151 = getelementptr inbounds nuw i8, ptr %120, i64 6
  store i8 %150, ptr %151, align 1, !tbaa !17
  %152 = load i32, ptr %140, align 4, !tbaa !1
  %153 = trunc i32 %152 to i8
  %154 = getelementptr inbounds nuw i8, ptr %120, i64 7
  store i8 %153, ptr %154, align 1, !tbaa !17
  %155 = add nuw nsw i64 %121, 2
  %156 = getelementptr inbounds nuw i8, ptr %120, i64 8
  %157 = add i64 %122, 2
  %158 = icmp eq i64 %157, %114
  %159 = load i64, ptr @DynMemReadCount, align 8
  %160 = add i64 %159, 8
  store i64 %160, ptr @DynMemReadCount, align 8
  %161 = load i64, ptr @DynMemWriteCount, align 8
  %162 = add i64 %161, 8
  store i64 %162, ptr @DynMemWriteCount, align 8
  %163 = load i64, ptr @DynAddressMathCount, align 8
  %164 = add i64 %163, 11
  store i64 %164, ptr @DynAddressMathCount, align 8
  %165 = load i64, ptr @DynControlFlowCount, align 8
  %166 = add i64 %165, 1
  store i64 %166, ptr @DynControlFlowCount, align 8
  %167 = load i64, ptr @DynALUCount, align 8
  %168 = add i64 %167, 9
  store i64 %168, ptr @DynALUCount, align 8
  %169 = load i64, ptr @DynCastCount, align 8
  %170 = add i64 %169, 8
  store i64 %170, ptr @DynCastCount, align 8
  br i1 %158, label %171, label %119, !llvm.loop !18

171:                                              ; preds = %119
  %172 = icmp eq i64 %107, 0
  %173 = load i64, ptr @DynControlFlowCount, align 8
  %174 = add i64 %173, 1
  store i64 %174, ptr @DynControlFlowCount, align 8
  %175 = load i64, ptr @DynALUCount, align 8
  %176 = add i64 %175, 1
  store i64 %176, ptr @DynALUCount, align 8
  br i1 %172, label %209, label %177

177:                                              ; preds = %171, %106
  %178 = phi ptr [ %2, %106 ], [ %156, %171 ]
  %179 = phi i64 [ 0, %106 ], [ %155, %171 ]
  %180 = icmp ne i64 %107, 0
  tail call void @llvm.assume(i1 %180)
  %181 = getelementptr inbounds nuw i32, ptr %0, i64 %179
  %182 = load i32, ptr %181, align 4, !tbaa !1
  %183 = lshr i32 %182, 24
  %184 = trunc nuw i32 %183 to i8
  store i8 %184, ptr %178, align 1, !tbaa !17
  %185 = load i32, ptr %181, align 4, !tbaa !1
  %186 = lshr i32 %185, 16
  %187 = trunc i32 %186 to i8
  %188 = getelementptr inbounds nuw i8, ptr %178, i64 1
  store i8 %187, ptr %188, align 1, !tbaa !17
  %189 = load i32, ptr %181, align 4, !tbaa !1
  %190 = lshr i32 %189, 8
  %191 = trunc i32 %190 to i8
  %192 = getelementptr inbounds nuw i8, ptr %178, i64 2
  store i8 %191, ptr %192, align 1, !tbaa !17
  %193 = load i32, ptr %181, align 4, !tbaa !1
  %194 = trunc i32 %193 to i8
  %195 = getelementptr inbounds nuw i8, ptr %178, i64 3
  store i8 %194, ptr %195, align 1, !tbaa !17
  %196 = getelementptr inbounds nuw i8, ptr %178, i64 4
  %197 = load i64, ptr @DynMemReadCount, align 8
  %198 = add i64 %197, 4
  store i64 %198, ptr @DynMemReadCount, align 8
  %199 = load i64, ptr @DynMemWriteCount, align 8
  %200 = add i64 %199, 4
  store i64 %200, ptr @DynMemWriteCount, align 8
  %201 = load i64, ptr @DynAddressMathCount, align 8
  %202 = add i64 %201, 5
  store i64 %202, ptr @DynAddressMathCount, align 8
  %203 = load i64, ptr @DynControlFlowCount, align 8
  %204 = add i64 %203, 1
  store i64 %204, ptr @DynControlFlowCount, align 8
  %205 = load i64, ptr @DynALUCount, align 8
  %206 = add i64 %205, 4
  store i64 %206, ptr @DynALUCount, align 8
  %207 = load i64, ptr @DynCastCount, align 8
  %208 = add i64 %207, 4
  store i64 %208, ptr @DynCastCount, align 8
  br label %209

209:                                              ; preds = %177, %171, %55
  %210 = phi ptr [ %2, %55 ], [ %156, %171 ], [ %196, %177 ]
  %211 = icmp eq i32 %92, 0
  %212 = load i64, ptr @DynControlFlowCount, align 8
  %213 = add i64 %212, 1
  store i64 %213, ptr @DynControlFlowCount, align 8
  %214 = load i64, ptr @DynALUCount, align 8
  %215 = add i64 %214, 1
  store i64 %215, ptr @DynALUCount, align 8
  br i1 %211, label %269, label %216

216:                                              ; preds = %209
  %217 = getelementptr inbounds nuw i32, ptr %0, i64 %90
  %218 = load i32, ptr %217, align 4, !tbaa !1
  %219 = load i64, ptr @DynMemReadCount, align 8
  %220 = add i64 %219, 1
  store i64 %220, ptr @DynMemReadCount, align 8
  %221 = load i64, ptr @DynAddressMathCount, align 8
  %222 = add i64 %221, 1
  store i64 %222, ptr @DynAddressMathCount, align 8
  %223 = load i64, ptr @DynControlFlowCount, align 8
  %224 = add i64 %223, 1
  store i64 %224, ptr @DynControlFlowCount, align 8
  switch i32 %92, label %225 [
    i32 3, label %228
    i32 2, label %244
    i32 1, label %258
  ]

225:                                              ; preds = %216
  %226 = load i64, ptr @DynControlFlowCount, align 8
  %227 = add i64 %226, 1
  store i64 %227, ptr @DynControlFlowCount, align 8
  unreachable

228:                                              ; preds = %216
  %229 = lshr i32 %218, 8
  %230 = trunc i32 %229 to i8
  %231 = and i64 %1, 3
  %232 = getelementptr i8, ptr %210, i64 %231
  %233 = getelementptr i8, ptr %232, i64 -1
  store i8 %230, ptr %233, align 1, !tbaa !17
  %234 = load i64, ptr @DynMemWriteCount, align 8
  %235 = add i64 %234, 1
  store i64 %235, ptr @DynMemWriteCount, align 8
  %236 = load i64, ptr @DynAddressMathCount, align 8
  %237 = add i64 %236, 2
  store i64 %237, ptr @DynAddressMathCount, align 8
  %238 = load i64, ptr @DynControlFlowCount, align 8
  %239 = add i64 %238, 1
  store i64 %239, ptr @DynControlFlowCount, align 8
  %240 = load i64, ptr @DynALUCount, align 8
  %241 = add i64 %240, 2
  store i64 %241, ptr @DynALUCount, align 8
  %242 = load i64, ptr @DynCastCount, align 8
  %243 = add i64 %242, 1
  store i64 %243, ptr @DynCastCount, align 8
  br label %244

244:                                              ; preds = %228, %216
  %245 = lshr i32 %218, 16
  %246 = trunc i32 %245 to i8
  %247 = getelementptr inbounds nuw i8, ptr %210, i64 1
  store i8 %246, ptr %247, align 1, !tbaa !17
  %248 = load i64, ptr @DynMemWriteCount, align 8
  %249 = add i64 %248, 1
  store i64 %249, ptr @DynMemWriteCount, align 8
  %250 = load i64, ptr @DynAddressMathCount, align 8
  %251 = add i64 %250, 1
  store i64 %251, ptr @DynAddressMathCount, align 8
  %252 = load i64, ptr @DynControlFlowCount, align 8
  %253 = add i64 %252, 1
  store i64 %253, ptr @DynControlFlowCount, align 8
  %254 = load i64, ptr @DynALUCount, align 8
  %255 = add i64 %254, 1
  store i64 %255, ptr @DynALUCount, align 8
  %256 = load i64, ptr @DynCastCount, align 8
  %257 = add i64 %256, 1
  store i64 %257, ptr @DynCastCount, align 8
  br label %258

258:                                              ; preds = %244, %216
  %259 = lshr i32 %218, 24
  %260 = trunc nuw i32 %259 to i8
  store i8 %260, ptr %210, align 1, !tbaa !17
  %261 = load i64, ptr @DynMemWriteCount, align 8
  %262 = add i64 %261, 1
  store i64 %262, ptr @DynMemWriteCount, align 8
  %263 = load i64, ptr @DynControlFlowCount, align 8
  %264 = add i64 %263, 1
  store i64 %264, ptr @DynControlFlowCount, align 8
  %265 = load i64, ptr @DynALUCount, align 8
  %266 = add i64 %265, 1
  store i64 %266, ptr @DynALUCount, align 8
  %267 = load i64, ptr @DynCastCount, align 8
  %268 = add i64 %267, 1
  store i64 %268, ptr @DynCastCount, align 8
  br label %269

269:                                              ; preds = %258, %209
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  store i64 0, ptr %60, align 8, !tbaa !12
  store i32 0, ptr %13, align 8, !tbaa !15
  %270 = load i64, ptr @DynMemWriteCount, align 8
  %271 = add i64 %270, 2
  store i64 %271, ptr @DynMemWriteCount, align 8
  %272 = load i64, ptr @DynControlFlowCount, align 8
  %273 = add i64 %272, 1
  store i64 %273, ptr @DynControlFlowCount, align 8
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
  %8 = phi i64 [ 0, %3 ], [ %48, %7 ]
  %9 = phi ptr [ %1, %3 ], [ %49, %7 ]
  %10 = load i8, ptr %9, align 1, !tbaa !17
  %11 = zext i8 %10 to i32
  %12 = shl nuw i32 %11, 24
  %13 = getelementptr inbounds nuw i8, ptr %9, i64 1
  %14 = load i8, ptr %13, align 1, !tbaa !17
  %15 = zext i8 %14 to i32
  %16 = shl nuw nsw i32 %15, 16
  %17 = or disjoint i32 %16, %12
  %18 = getelementptr inbounds nuw i8, ptr %9, i64 2
  %19 = load i8, ptr %18, align 1, !tbaa !17
  %20 = zext i8 %19 to i32
  %21 = shl nuw nsw i32 %20, 8
  %22 = or disjoint i32 %17, %21
  %23 = getelementptr inbounds nuw i8, ptr %9, i64 3
  %24 = load i8, ptr %23, align 1, !tbaa !17
  %25 = zext i8 %24 to i32
  %26 = or disjoint i32 %22, %25
  %27 = getelementptr inbounds nuw i32, ptr %4, i64 %8
  store i32 %26, ptr %27, align 8, !tbaa !1
  %28 = getelementptr inbounds nuw i8, ptr %9, i64 4
  %29 = load i8, ptr %28, align 1, !tbaa !17
  %30 = zext i8 %29 to i32
  %31 = shl nuw i32 %30, 24
  %32 = getelementptr inbounds nuw i8, ptr %9, i64 5
  %33 = load i8, ptr %32, align 1, !tbaa !17
  %34 = zext i8 %33 to i32
  %35 = shl nuw nsw i32 %34, 16
  %36 = or disjoint i32 %35, %31
  %37 = getelementptr inbounds nuw i8, ptr %9, i64 6
  %38 = load i8, ptr %37, align 1, !tbaa !17
  %39 = zext i8 %38 to i32
  %40 = shl nuw nsw i32 %39, 8
  %41 = or disjoint i32 %36, %40
  %42 = getelementptr inbounds nuw i8, ptr %9, i64 7
  %43 = load i8, ptr %42, align 1, !tbaa !17
  %44 = zext i8 %43 to i32
  %45 = or disjoint i32 %41, %44
  %46 = getelementptr inbounds nuw i32, ptr %4, i64 %8
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 4
  store i32 %45, ptr %47, align 4, !tbaa !1
  %48 = add nuw nsw i64 %8, 2
  %49 = getelementptr inbounds nuw i8, ptr %9, i64 8
  %50 = icmp eq i64 %48, 16
  %51 = load i64, ptr @DynMemReadCount, align 8
  %52 = add i64 %51, 8
  store i64 %52, ptr @DynMemReadCount, align 8
  %53 = load i64, ptr @DynMemWriteCount, align 8
  %54 = add i64 %53, 2
  store i64 %54, ptr @DynMemWriteCount, align 8
  %55 = load i64, ptr @DynAddressMathCount, align 8
  %56 = add i64 %55, 11
  store i64 %56, ptr @DynAddressMathCount, align 8
  %57 = load i64, ptr @DynControlFlowCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynControlFlowCount, align 8
  %59 = load i64, ptr @DynALUCount, align 8
  %60 = add i64 %59, 14
  store i64 %60, ptr @DynALUCount, align 8
  %61 = load i64, ptr @DynCastCount, align 8
  %62 = add i64 %61, 8
  store i64 %62, ptr @DynCastCount, align 8
  br i1 %50, label %63, label %7, !llvm.loop !19

63:                                               ; preds = %7
  %64 = load i32, ptr %0, align 4, !tbaa !1
  %65 = getelementptr inbounds nuw i8, ptr %0, i64 4
  %66 = load i32, ptr %65, align 4, !tbaa !1
  %67 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %68 = load i32, ptr %67, align 4, !tbaa !1
  %69 = getelementptr inbounds nuw i8, ptr %0, i64 12
  %70 = load i32, ptr %69, align 4, !tbaa !1
  %71 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %72 = load i32, ptr %71, align 4, !tbaa !1
  %73 = getelementptr inbounds nuw i8, ptr %0, i64 20
  %74 = load i32, ptr %73, align 4, !tbaa !1
  %75 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %76 = load i32, ptr %75, align 4, !tbaa !1
  %77 = getelementptr inbounds nuw i8, ptr %0, i64 28
  %78 = load i32, ptr %77, align 4, !tbaa !1
  %79 = load i64, ptr @DynMemReadCount, align 8
  %80 = add i64 %79, 8
  store i64 %80, ptr @DynMemReadCount, align 8
  %81 = load i64, ptr @DynAddressMathCount, align 8
  %82 = add i64 %81, 7
  store i64 %82, ptr @DynAddressMathCount, align 8
  %83 = load i64, ptr @DynControlFlowCount, align 8
  %84 = add i64 %83, 1
  store i64 %84, ptr @DynControlFlowCount, align 8
  br label %123

85:                                               ; preds = %123
  %86 = load i32, ptr %4, align 16
  %87 = getelementptr inbounds nuw i8, ptr %4, i64 56
  %88 = getelementptr inbounds nuw i8, ptr %4, i64 36
  %89 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %90 = getelementptr inbounds nuw i8, ptr %4, i64 60
  %91 = getelementptr inbounds nuw i8, ptr %4, i64 40
  %92 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %93 = getelementptr inbounds nuw i8, ptr %4, i64 44
  %94 = getelementptr inbounds nuw i8, ptr %4, i64 12
  %95 = getelementptr inbounds nuw i8, ptr %4, i64 48
  %96 = getelementptr inbounds nuw i8, ptr %4, i64 16
  %97 = getelementptr inbounds nuw i8, ptr %4, i64 52
  %98 = getelementptr inbounds nuw i8, ptr %4, i64 20
  %99 = getelementptr inbounds nuw i8, ptr %4, i64 24
  %100 = getelementptr inbounds nuw i8, ptr %4, i64 28
  %101 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %102 = load i32, ptr %87, align 8, !tbaa !1
  %103 = load i32, ptr %88, align 4, !tbaa !1
  %104 = load i32, ptr %89, align 4, !tbaa !1
  %105 = load i32, ptr %90, align 4, !tbaa !1
  %106 = load i32, ptr %91, align 8, !tbaa !1
  %107 = load i32, ptr %92, align 8, !tbaa !1
  %108 = load i32, ptr %93, align 4, !tbaa !1
  %109 = load i32, ptr %94, align 4, !tbaa !1
  %110 = load i32, ptr %95, align 16, !tbaa !1
  %111 = load i32, ptr %96, align 16, !tbaa !1
  %112 = load i32, ptr %97, align 4, !tbaa !1
  %113 = load i32, ptr %98, align 4, !tbaa !1
  %114 = load i32, ptr %99, align 8, !tbaa !1
  %115 = load i32, ptr %100, align 4, !tbaa !1
  %116 = load i32, ptr %101, align 16, !tbaa !1
  %117 = load i64, ptr @DynMemReadCount, align 8
  %118 = add i64 %117, 16
  store i64 %118, ptr @DynMemReadCount, align 8
  %119 = load i64, ptr @DynAddressMathCount, align 8
  %120 = add i64 %119, 15
  store i64 %120, ptr @DynAddressMathCount, align 8
  %121 = load i64, ptr @DynControlFlowCount, align 8
  %122 = add i64 %121, 1
  store i64 %122, ptr @DynControlFlowCount, align 8
  br label %367

123:                                              ; preds = %123, %63
  %124 = phi ptr [ %4, %63 ], [ %358, %123 ]
  %125 = phi i1 [ true, %63 ], [ false, %123 ]
  %126 = phi i32 [ %78, %63 ], [ %261, %123 ]
  %127 = phi i32 [ %76, %63 ], [ %289, %123 ]
  %128 = phi i32 [ %74, %63 ], [ %317, %123 ]
  %129 = phi i32 [ %72, %63 ], [ %345, %123 ]
  %130 = phi i32 [ %70, %63 ], [ %272, %123 ]
  %131 = phi i32 [ %68, %63 ], [ %300, %123 ]
  %132 = phi i32 [ %66, %63 ], [ %328, %123 ]
  %133 = phi i32 [ %64, %63 ], [ %356, %123 ]
  %134 = phi ptr [ %2, %63 ], [ %357, %123 ]
  %135 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 26)
  %136 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 21)
  %137 = xor i32 %135, %136
  %138 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %129, i32 7)
  %139 = xor i32 %137, %138
  %140 = xor i32 %127, %128
  %141 = and i32 %140, %129
  %142 = xor i32 %141, %127
  %143 = load i32, ptr %134, align 4, !tbaa !1
  %144 = load i32, ptr %124, align 4, !tbaa !1
  %145 = add i32 %126, %139
  %146 = add i32 %145, %142
  %147 = add i32 %146, %143
  %148 = add i32 %147, %144
  %149 = add i32 %148, %130
  %150 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %133, i32 30)
  %151 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %133, i32 19)
  %152 = xor i32 %150, %151
  %153 = tail call i32 @llvm.fshl.i32(i32 %133, i32 %133, i32 10)
  %154 = xor i32 %152, %153
  %155 = and i32 %132, %133
  %156 = xor i32 %132, %133
  %157 = and i32 %131, %156
  %158 = xor i32 %157, %155
  %159 = add i32 %158, %154
  %160 = add i32 %159, %148
  %161 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 26)
  %162 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 21)
  %163 = xor i32 %161, %162
  %164 = tail call i32 @llvm.fshl.i32(i32 %149, i32 %149, i32 7)
  %165 = xor i32 %163, %164
  %166 = xor i32 %128, %129
  %167 = and i32 %149, %166
  %168 = xor i32 %167, %128
  %169 = getelementptr inbounds nuw i8, ptr %134, i64 4
  %170 = load i32, ptr %169, align 4, !tbaa !1
  %171 = getelementptr inbounds nuw i8, ptr %124, i64 4
  %172 = load i32, ptr %171, align 4, !tbaa !1
  %173 = add i32 %170, %127
  %174 = add i32 %173, %172
  %175 = add i32 %174, %168
  %176 = add i32 %175, %165
  %177 = add i32 %176, %131
  %178 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 30)
  %179 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 19)
  %180 = xor i32 %178, %179
  %181 = tail call i32 @llvm.fshl.i32(i32 %160, i32 %160, i32 10)
  %182 = xor i32 %180, %181
  %183 = and i32 %160, %133
  %184 = xor i32 %160, %133
  %185 = and i32 %184, %132
  %186 = xor i32 %185, %183
  %187 = add i32 %182, %186
  %188 = add i32 %187, %176
  %189 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 26)
  %190 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 21)
  %191 = xor i32 %189, %190
  %192 = tail call i32 @llvm.fshl.i32(i32 %177, i32 %177, i32 7)
  %193 = xor i32 %191, %192
  %194 = xor i32 %149, %129
  %195 = and i32 %177, %194
  %196 = xor i32 %195, %129
  %197 = getelementptr inbounds nuw i8, ptr %134, i64 8
  %198 = load i32, ptr %197, align 4, !tbaa !1
  %199 = getelementptr inbounds nuw i8, ptr %124, i64 8
  %200 = load i32, ptr %199, align 4, !tbaa !1
  %201 = add i32 %198, %128
  %202 = add i32 %201, %200
  %203 = add i32 %202, %196
  %204 = add i32 %203, %193
  %205 = add i32 %204, %132
  %206 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %188, i32 30)
  %207 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %188, i32 19)
  %208 = xor i32 %206, %207
  %209 = tail call i32 @llvm.fshl.i32(i32 %188, i32 %188, i32 10)
  %210 = xor i32 %208, %209
  %211 = and i32 %188, %160
  %212 = xor i32 %188, %160
  %213 = and i32 %212, %133
  %214 = xor i32 %213, %211
  %215 = add i32 %210, %214
  %216 = add i32 %215, %204
  %217 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 26)
  %218 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 21)
  %219 = xor i32 %217, %218
  %220 = tail call i32 @llvm.fshl.i32(i32 %205, i32 %205, i32 7)
  %221 = xor i32 %219, %220
  %222 = xor i32 %177, %149
  %223 = and i32 %205, %222
  %224 = xor i32 %223, %149
  %225 = getelementptr inbounds nuw i8, ptr %134, i64 12
  %226 = load i32, ptr %225, align 4, !tbaa !1
  %227 = getelementptr inbounds nuw i8, ptr %124, i64 12
  %228 = load i32, ptr %227, align 4, !tbaa !1
  %229 = add i32 %226, %129
  %230 = add i32 %229, %228
  %231 = add i32 %230, %224
  %232 = add i32 %231, %221
  %233 = add i32 %232, %133
  %234 = tail call i32 @llvm.fshl.i32(i32 %216, i32 %216, i32 30)
  %235 = tail call i32 @llvm.fshl.i32(i32 %216, i32 %216, i32 19)
  %236 = xor i32 %234, %235
  %237 = tail call i32 @llvm.fshl.i32(i32 %216, i32 %216, i32 10)
  %238 = xor i32 %236, %237
  %239 = and i32 %216, %188
  %240 = xor i32 %216, %188
  %241 = and i32 %240, %160
  %242 = xor i32 %241, %239
  %243 = add i32 %238, %242
  %244 = add i32 %243, %232
  %245 = tail call i32 @llvm.fshl.i32(i32 %233, i32 %233, i32 26)
  %246 = tail call i32 @llvm.fshl.i32(i32 %233, i32 %233, i32 21)
  %247 = xor i32 %245, %246
  %248 = tail call i32 @llvm.fshl.i32(i32 %233, i32 %233, i32 7)
  %249 = xor i32 %247, %248
  %250 = xor i32 %205, %177
  %251 = and i32 %233, %250
  %252 = xor i32 %251, %177
  %253 = getelementptr inbounds nuw i8, ptr %134, i64 16
  %254 = load i32, ptr %253, align 4, !tbaa !1
  %255 = getelementptr inbounds nuw i8, ptr %124, i64 16
  %256 = load i32, ptr %255, align 4, !tbaa !1
  %257 = add i32 %254, %149
  %258 = add i32 %257, %256
  %259 = add i32 %258, %252
  %260 = add i32 %259, %249
  %261 = add i32 %260, %160
  %262 = tail call i32 @llvm.fshl.i32(i32 %244, i32 %244, i32 30)
  %263 = tail call i32 @llvm.fshl.i32(i32 %244, i32 %244, i32 19)
  %264 = xor i32 %262, %263
  %265 = tail call i32 @llvm.fshl.i32(i32 %244, i32 %244, i32 10)
  %266 = xor i32 %264, %265
  %267 = and i32 %244, %216
  %268 = xor i32 %244, %216
  %269 = and i32 %268, %188
  %270 = xor i32 %269, %267
  %271 = add i32 %266, %270
  %272 = add i32 %271, %260
  %273 = tail call i32 @llvm.fshl.i32(i32 %261, i32 %261, i32 26)
  %274 = tail call i32 @llvm.fshl.i32(i32 %261, i32 %261, i32 21)
  %275 = xor i32 %273, %274
  %276 = tail call i32 @llvm.fshl.i32(i32 %261, i32 %261, i32 7)
  %277 = xor i32 %275, %276
  %278 = xor i32 %233, %205
  %279 = and i32 %261, %278
  %280 = xor i32 %279, %205
  %281 = getelementptr inbounds nuw i8, ptr %134, i64 20
  %282 = load i32, ptr %281, align 4, !tbaa !1
  %283 = getelementptr inbounds nuw i8, ptr %124, i64 20
  %284 = load i32, ptr %283, align 4, !tbaa !1
  %285 = add i32 %284, %282
  %286 = add i32 %285, %177
  %287 = add i32 %286, %280
  %288 = add i32 %287, %277
  %289 = add i32 %288, %188
  %290 = tail call i32 @llvm.fshl.i32(i32 %272, i32 %272, i32 30)
  %291 = tail call i32 @llvm.fshl.i32(i32 %272, i32 %272, i32 19)
  %292 = xor i32 %290, %291
  %293 = tail call i32 @llvm.fshl.i32(i32 %272, i32 %272, i32 10)
  %294 = xor i32 %292, %293
  %295 = and i32 %272, %244
  %296 = xor i32 %272, %244
  %297 = and i32 %296, %216
  %298 = xor i32 %297, %295
  %299 = add i32 %294, %298
  %300 = add i32 %299, %288
  %301 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 26)
  %302 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 21)
  %303 = xor i32 %301, %302
  %304 = tail call i32 @llvm.fshl.i32(i32 %289, i32 %289, i32 7)
  %305 = xor i32 %303, %304
  %306 = xor i32 %261, %233
  %307 = and i32 %289, %306
  %308 = xor i32 %307, %233
  %309 = getelementptr inbounds nuw i8, ptr %134, i64 24
  %310 = load i32, ptr %309, align 4, !tbaa !1
  %311 = getelementptr inbounds nuw i8, ptr %124, i64 24
  %312 = load i32, ptr %311, align 4, !tbaa !1
  %313 = add i32 %312, %310
  %314 = add i32 %313, %205
  %315 = add i32 %314, %308
  %316 = add i32 %315, %305
  %317 = add i32 %316, %216
  %318 = tail call i32 @llvm.fshl.i32(i32 %300, i32 %300, i32 30)
  %319 = tail call i32 @llvm.fshl.i32(i32 %300, i32 %300, i32 19)
  %320 = xor i32 %318, %319
  %321 = tail call i32 @llvm.fshl.i32(i32 %300, i32 %300, i32 10)
  %322 = xor i32 %320, %321
  %323 = and i32 %300, %272
  %324 = xor i32 %300, %272
  %325 = and i32 %324, %244
  %326 = xor i32 %325, %323
  %327 = add i32 %322, %326
  %328 = add i32 %327, %316
  %329 = tail call i32 @llvm.fshl.i32(i32 %317, i32 %317, i32 26)
  %330 = tail call i32 @llvm.fshl.i32(i32 %317, i32 %317, i32 21)
  %331 = xor i32 %329, %330
  %332 = tail call i32 @llvm.fshl.i32(i32 %317, i32 %317, i32 7)
  %333 = xor i32 %331, %332
  %334 = xor i32 %289, %261
  %335 = and i32 %317, %334
  %336 = xor i32 %335, %261
  %337 = getelementptr inbounds nuw i8, ptr %134, i64 28
  %338 = load i32, ptr %337, align 4, !tbaa !1
  %339 = getelementptr inbounds nuw i8, ptr %124, i64 28
  %340 = load i32, ptr %339, align 4, !tbaa !1
  %341 = add i32 %340, %338
  %342 = add i32 %341, %233
  %343 = add i32 %342, %336
  %344 = add i32 %343, %333
  %345 = add i32 %344, %244
  %346 = tail call i32 @llvm.fshl.i32(i32 %328, i32 %328, i32 30)
  %347 = tail call i32 @llvm.fshl.i32(i32 %328, i32 %328, i32 19)
  %348 = xor i32 %346, %347
  %349 = tail call i32 @llvm.fshl.i32(i32 %328, i32 %328, i32 10)
  %350 = xor i32 %348, %349
  %351 = and i32 %328, %300
  %352 = xor i32 %328, %300
  %353 = and i32 %352, %272
  %354 = xor i32 %353, %351
  %355 = add i32 %350, %354
  %356 = add i32 %355, %344
  %357 = getelementptr inbounds nuw i8, ptr %134, i64 32
  %358 = getelementptr inbounds nuw i8, ptr %124, i64 32
  %359 = load i64, ptr @DynMemReadCount, align 8
  %360 = add i64 %359, 16
  store i64 %360, ptr @DynMemReadCount, align 8
  %361 = load i64, ptr @DynAddressMathCount, align 8
  %362 = add i64 %361, 16
  store i64 %362, ptr @DynAddressMathCount, align 8
  %363 = load i64, ptr @DynControlFlowCount, align 8
  %364 = add i64 %363, 1
  store i64 %364, ptr @DynControlFlowCount, align 8
  %365 = load i64, ptr @DynALUCount, align 8
  %366 = add i64 %365, 144
  store i64 %366, ptr @DynALUCount, align 8
  br i1 %125, label %123, label %85, !llvm.loop !20

367:                                              ; preds = %367, %85
  %368 = phi i32 [ %116, %85 ], [ %728, %367 ]
  %369 = phi i32 [ %115, %85 ], [ %689, %367 ]
  %370 = phi i32 [ %114, %85 ], [ %650, %367 ]
  %371 = phi i32 [ %113, %85 ], [ %611, %367 ]
  %372 = phi i32 [ %112, %85 ], [ %923, %367 ]
  %373 = phi i32 [ %111, %85 ], [ %572, %367 ]
  %374 = phi i32 [ %110, %85 ], [ %884, %367 ]
  %375 = phi i32 [ %109, %85 ], [ %533, %367 ]
  %376 = phi i32 [ %108, %85 ], [ %845, %367 ]
  %377 = phi i32 [ %107, %85 ], [ %494, %367 ]
  %378 = phi i32 [ %106, %85 ], [ %806, %367 ]
  %379 = phi i32 [ %105, %85 ], [ %1001, %367 ]
  %380 = phi i32 [ %104, %85 ], [ %455, %367 ]
  %381 = phi i32 [ %103, %85 ], [ %767, %367 ]
  %382 = phi i32 [ %102, %85 ], [ %962, %367 ]
  %383 = phi i32 [ 16, %85 ], [ %1018, %367 ]
  %384 = phi i32 [ %261, %85 ], [ %889, %367 ]
  %385 = phi i32 [ %289, %85 ], [ %928, %367 ]
  %386 = phi i32 [ %317, %85 ], [ %967, %367 ]
  %387 = phi i32 [ %345, %85 ], [ %1006, %367 ]
  %388 = phi i32 [ %272, %85 ], [ %900, %367 ]
  %389 = phi i32 [ %300, %85 ], [ %939, %367 ]
  %390 = phi i32 [ %328, %85 ], [ %978, %367 ]
  %391 = phi i32 [ %356, %85 ], [ %1017, %367 ]
  %392 = phi ptr [ %2, %85 ], [ %394, %367 ]
  %393 = phi i32 [ %86, %85 ], [ %416, %367 ]
  %394 = getelementptr i8, ptr %392, i64 64
  %395 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %387, i32 26)
  %396 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %387, i32 21)
  %397 = xor i32 %395, %396
  %398 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %387, i32 7)
  %399 = xor i32 %397, %398
  %400 = xor i32 %385, %386
  %401 = and i32 %400, %387
  %402 = xor i32 %401, %385
  %403 = load i32, ptr %394, align 4, !tbaa !1
  %404 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 15)
  %405 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 13)
  %406 = xor i32 %404, %405
  %407 = lshr i32 %382, 10
  %408 = xor i32 %406, %407
  %409 = add i32 %408, %381
  %410 = tail call i32 @llvm.fshl.i32(i32 %380, i32 %380, i32 25)
  %411 = tail call i32 @llvm.fshl.i32(i32 %380, i32 %380, i32 14)
  %412 = xor i32 %410, %411
  %413 = lshr i32 %380, 3
  %414 = xor i32 %412, %413
  %415 = add i32 %409, %393
  %416 = add i32 %415, %414
  %417 = add i32 %384, %399
  %418 = add i32 %417, %402
  %419 = add i32 %418, %403
  %420 = add i32 %419, %416
  %421 = add i32 %420, %388
  %422 = tail call i32 @llvm.fshl.i32(i32 %391, i32 %391, i32 30)
  %423 = tail call i32 @llvm.fshl.i32(i32 %391, i32 %391, i32 19)
  %424 = xor i32 %422, %423
  %425 = tail call i32 @llvm.fshl.i32(i32 %391, i32 %391, i32 10)
  %426 = xor i32 %424, %425
  %427 = and i32 %390, %391
  %428 = xor i32 %390, %391
  %429 = and i32 %389, %428
  %430 = xor i32 %429, %427
  %431 = add i32 %430, %426
  %432 = add i32 %431, %420
  %433 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 26)
  %434 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 21)
  %435 = xor i32 %433, %434
  %436 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 7)
  %437 = xor i32 %435, %436
  %438 = xor i32 %386, %387
  %439 = and i32 %421, %438
  %440 = xor i32 %439, %386
  %441 = getelementptr i8, ptr %392, i64 68
  %442 = load i32, ptr %441, align 4, !tbaa !1
  %443 = tail call i32 @llvm.fshl.i32(i32 %379, i32 %379, i32 15)
  %444 = tail call i32 @llvm.fshl.i32(i32 %379, i32 %379, i32 13)
  %445 = xor i32 %443, %444
  %446 = lshr i32 %379, 10
  %447 = xor i32 %445, %446
  %448 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %377, i32 25)
  %449 = tail call i32 @llvm.fshl.i32(i32 %377, i32 %377, i32 14)
  %450 = xor i32 %448, %449
  %451 = lshr i32 %377, 3
  %452 = xor i32 %450, %451
  %453 = add i32 %378, %380
  %454 = add i32 %453, %447
  %455 = add i32 %454, %452
  %456 = add i32 %442, %385
  %457 = add i32 %456, %440
  %458 = add i32 %457, %437
  %459 = add i32 %458, %455
  %460 = add i32 %459, %389
  %461 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 30)
  %462 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 19)
  %463 = xor i32 %461, %462
  %464 = tail call i32 @llvm.fshl.i32(i32 %432, i32 %432, i32 10)
  %465 = xor i32 %463, %464
  %466 = and i32 %432, %391
  %467 = xor i32 %432, %391
  %468 = and i32 %467, %390
  %469 = xor i32 %468, %466
  %470 = add i32 %465, %469
  %471 = add i32 %470, %459
  %472 = tail call i32 @llvm.fshl.i32(i32 %460, i32 %460, i32 26)
  %473 = tail call i32 @llvm.fshl.i32(i32 %460, i32 %460, i32 21)
  %474 = xor i32 %472, %473
  %475 = tail call i32 @llvm.fshl.i32(i32 %460, i32 %460, i32 7)
  %476 = xor i32 %474, %475
  %477 = xor i32 %421, %387
  %478 = and i32 %460, %477
  %479 = xor i32 %478, %387
  %480 = getelementptr i8, ptr %392, i64 72
  %481 = load i32, ptr %480, align 4, !tbaa !1
  %482 = tail call i32 @llvm.fshl.i32(i32 %416, i32 %416, i32 15)
  %483 = tail call i32 @llvm.fshl.i32(i32 %416, i32 %416, i32 13)
  %484 = xor i32 %482, %483
  %485 = lshr i32 %416, 10
  %486 = xor i32 %484, %485
  %487 = tail call i32 @llvm.fshl.i32(i32 %375, i32 %375, i32 25)
  %488 = tail call i32 @llvm.fshl.i32(i32 %375, i32 %375, i32 14)
  %489 = xor i32 %487, %488
  %490 = lshr i32 %375, 3
  %491 = xor i32 %489, %490
  %492 = add i32 %486, %377
  %493 = add i32 %492, %376
  %494 = add i32 %493, %491
  %495 = add i32 %481, %386
  %496 = add i32 %495, %494
  %497 = add i32 %496, %479
  %498 = add i32 %497, %476
  %499 = add i32 %498, %390
  %500 = tail call i32 @llvm.fshl.i32(i32 %471, i32 %471, i32 30)
  %501 = tail call i32 @llvm.fshl.i32(i32 %471, i32 %471, i32 19)
  %502 = xor i32 %500, %501
  %503 = tail call i32 @llvm.fshl.i32(i32 %471, i32 %471, i32 10)
  %504 = xor i32 %502, %503
  %505 = and i32 %471, %432
  %506 = xor i32 %471, %432
  %507 = and i32 %506, %391
  %508 = xor i32 %507, %505
  %509 = add i32 %504, %508
  %510 = add i32 %509, %498
  %511 = tail call i32 @llvm.fshl.i32(i32 %499, i32 %499, i32 26)
  %512 = tail call i32 @llvm.fshl.i32(i32 %499, i32 %499, i32 21)
  %513 = xor i32 %511, %512
  %514 = tail call i32 @llvm.fshl.i32(i32 %499, i32 %499, i32 7)
  %515 = xor i32 %513, %514
  %516 = xor i32 %460, %421
  %517 = and i32 %499, %516
  %518 = xor i32 %517, %421
  %519 = getelementptr i8, ptr %392, i64 76
  %520 = load i32, ptr %519, align 4, !tbaa !1
  %521 = tail call i32 @llvm.fshl.i32(i32 %455, i32 %455, i32 15)
  %522 = tail call i32 @llvm.fshl.i32(i32 %455, i32 %455, i32 13)
  %523 = xor i32 %521, %522
  %524 = lshr i32 %455, 10
  %525 = xor i32 %523, %524
  %526 = tail call i32 @llvm.fshl.i32(i32 %373, i32 %373, i32 25)
  %527 = tail call i32 @llvm.fshl.i32(i32 %373, i32 %373, i32 14)
  %528 = xor i32 %526, %527
  %529 = lshr i32 %373, 3
  %530 = xor i32 %528, %529
  %531 = add i32 %374, %375
  %532 = add i32 %531, %525
  %533 = add i32 %532, %530
  %534 = add i32 %520, %387
  %535 = add i32 %534, %533
  %536 = add i32 %535, %518
  %537 = add i32 %536, %515
  %538 = add i32 %537, %391
  %539 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 30)
  %540 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 19)
  %541 = xor i32 %539, %540
  %542 = tail call i32 @llvm.fshl.i32(i32 %510, i32 %510, i32 10)
  %543 = xor i32 %541, %542
  %544 = and i32 %510, %471
  %545 = xor i32 %510, %471
  %546 = and i32 %545, %432
  %547 = xor i32 %546, %544
  %548 = add i32 %543, %547
  %549 = add i32 %548, %537
  %550 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 26)
  %551 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 21)
  %552 = xor i32 %550, %551
  %553 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 7)
  %554 = xor i32 %552, %553
  %555 = xor i32 %499, %460
  %556 = and i32 %538, %555
  %557 = xor i32 %556, %460
  %558 = getelementptr i8, ptr %392, i64 80
  %559 = load i32, ptr %558, align 4, !tbaa !1
  %560 = tail call i32 @llvm.fshl.i32(i32 %494, i32 %494, i32 15)
  %561 = tail call i32 @llvm.fshl.i32(i32 %494, i32 %494, i32 13)
  %562 = xor i32 %560, %561
  %563 = lshr i32 %494, 10
  %564 = xor i32 %562, %563
  %565 = tail call i32 @llvm.fshl.i32(i32 %371, i32 %371, i32 25)
  %566 = tail call i32 @llvm.fshl.i32(i32 %371, i32 %371, i32 14)
  %567 = xor i32 %565, %566
  %568 = lshr i32 %371, 3
  %569 = xor i32 %567, %568
  %570 = add i32 %372, %373
  %571 = add i32 %570, %564
  %572 = add i32 %571, %569
  %573 = add i32 %559, %421
  %574 = add i32 %573, %572
  %575 = add i32 %574, %557
  %576 = add i32 %575, %554
  %577 = add i32 %576, %432
  %578 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 30)
  %579 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 19)
  %580 = xor i32 %578, %579
  %581 = tail call i32 @llvm.fshl.i32(i32 %549, i32 %549, i32 10)
  %582 = xor i32 %580, %581
  %583 = and i32 %549, %510
  %584 = xor i32 %549, %510
  %585 = and i32 %584, %471
  %586 = xor i32 %585, %583
  %587 = add i32 %582, %586
  %588 = add i32 %587, %576
  %589 = tail call i32 @llvm.fshl.i32(i32 %577, i32 %577, i32 26)
  %590 = tail call i32 @llvm.fshl.i32(i32 %577, i32 %577, i32 21)
  %591 = xor i32 %589, %590
  %592 = tail call i32 @llvm.fshl.i32(i32 %577, i32 %577, i32 7)
  %593 = xor i32 %591, %592
  %594 = xor i32 %538, %499
  %595 = and i32 %577, %594
  %596 = xor i32 %595, %499
  %597 = getelementptr i8, ptr %392, i64 84
  %598 = load i32, ptr %597, align 4, !tbaa !1
  %599 = tail call i32 @llvm.fshl.i32(i32 %533, i32 %533, i32 15)
  %600 = tail call i32 @llvm.fshl.i32(i32 %533, i32 %533, i32 13)
  %601 = xor i32 %599, %600
  %602 = lshr i32 %533, 10
  %603 = xor i32 %601, %602
  %604 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 25)
  %605 = tail call i32 @llvm.fshl.i32(i32 %370, i32 %370, i32 14)
  %606 = xor i32 %604, %605
  %607 = lshr i32 %370, 3
  %608 = xor i32 %606, %607
  %609 = add i32 %371, %382
  %610 = add i32 %609, %603
  %611 = add i32 %610, %608
  %612 = add i32 %598, %460
  %613 = add i32 %612, %611
  %614 = add i32 %613, %596
  %615 = add i32 %614, %593
  %616 = add i32 %615, %471
  %617 = tail call i32 @llvm.fshl.i32(i32 %588, i32 %588, i32 30)
  %618 = tail call i32 @llvm.fshl.i32(i32 %588, i32 %588, i32 19)
  %619 = xor i32 %617, %618
  %620 = tail call i32 @llvm.fshl.i32(i32 %588, i32 %588, i32 10)
  %621 = xor i32 %619, %620
  %622 = and i32 %588, %549
  %623 = xor i32 %588, %549
  %624 = and i32 %623, %510
  %625 = xor i32 %624, %622
  %626 = add i32 %621, %625
  %627 = add i32 %626, %615
  %628 = tail call i32 @llvm.fshl.i32(i32 %616, i32 %616, i32 26)
  %629 = tail call i32 @llvm.fshl.i32(i32 %616, i32 %616, i32 21)
  %630 = xor i32 %628, %629
  %631 = tail call i32 @llvm.fshl.i32(i32 %616, i32 %616, i32 7)
  %632 = xor i32 %630, %631
  %633 = xor i32 %577, %538
  %634 = and i32 %616, %633
  %635 = xor i32 %634, %538
  %636 = getelementptr i8, ptr %392, i64 88
  %637 = load i32, ptr %636, align 4, !tbaa !1
  %638 = tail call i32 @llvm.fshl.i32(i32 %572, i32 %572, i32 15)
  %639 = tail call i32 @llvm.fshl.i32(i32 %572, i32 %572, i32 13)
  %640 = xor i32 %638, %639
  %641 = lshr i32 %572, 10
  %642 = xor i32 %640, %641
  %643 = tail call i32 @llvm.fshl.i32(i32 %369, i32 %369, i32 25)
  %644 = tail call i32 @llvm.fshl.i32(i32 %369, i32 %369, i32 14)
  %645 = xor i32 %643, %644
  %646 = lshr i32 %369, 3
  %647 = xor i32 %645, %646
  %648 = add i32 %370, %379
  %649 = add i32 %648, %642
  %650 = add i32 %649, %647
  %651 = add i32 %499, %637
  %652 = add i32 %651, %650
  %653 = add i32 %652, %635
  %654 = add i32 %653, %632
  %655 = add i32 %654, %510
  %656 = tail call i32 @llvm.fshl.i32(i32 %627, i32 %627, i32 30)
  %657 = tail call i32 @llvm.fshl.i32(i32 %627, i32 %627, i32 19)
  %658 = xor i32 %656, %657
  %659 = tail call i32 @llvm.fshl.i32(i32 %627, i32 %627, i32 10)
  %660 = xor i32 %658, %659
  %661 = and i32 %627, %588
  %662 = xor i32 %627, %588
  %663 = and i32 %662, %549
  %664 = xor i32 %663, %661
  %665 = add i32 %660, %664
  %666 = add i32 %665, %654
  %667 = tail call i32 @llvm.fshl.i32(i32 %655, i32 %655, i32 26)
  %668 = tail call i32 @llvm.fshl.i32(i32 %655, i32 %655, i32 21)
  %669 = xor i32 %667, %668
  %670 = tail call i32 @llvm.fshl.i32(i32 %655, i32 %655, i32 7)
  %671 = xor i32 %669, %670
  %672 = xor i32 %616, %577
  %673 = and i32 %655, %672
  %674 = xor i32 %673, %577
  %675 = getelementptr i8, ptr %392, i64 92
  %676 = load i32, ptr %675, align 4, !tbaa !1
  %677 = tail call i32 @llvm.fshl.i32(i32 %611, i32 %611, i32 15)
  %678 = tail call i32 @llvm.fshl.i32(i32 %611, i32 %611, i32 13)
  %679 = xor i32 %677, %678
  %680 = lshr i32 %611, 10
  %681 = xor i32 %679, %680
  %682 = tail call i32 @llvm.fshl.i32(i32 %368, i32 %368, i32 25)
  %683 = tail call i32 @llvm.fshl.i32(i32 %368, i32 %368, i32 14)
  %684 = xor i32 %682, %683
  %685 = lshr i32 %368, 3
  %686 = xor i32 %684, %685
  %687 = add i32 %369, %416
  %688 = add i32 %687, %681
  %689 = add i32 %688, %686
  %690 = add i32 %689, %676
  %691 = add i32 %690, %538
  %692 = add i32 %691, %674
  %693 = add i32 %692, %671
  %694 = add i32 %693, %549
  %695 = tail call i32 @llvm.fshl.i32(i32 %666, i32 %666, i32 30)
  %696 = tail call i32 @llvm.fshl.i32(i32 %666, i32 %666, i32 19)
  %697 = xor i32 %695, %696
  %698 = tail call i32 @llvm.fshl.i32(i32 %666, i32 %666, i32 10)
  %699 = xor i32 %697, %698
  %700 = and i32 %666, %627
  %701 = xor i32 %666, %627
  %702 = and i32 %701, %588
  %703 = xor i32 %702, %700
  %704 = add i32 %699, %703
  %705 = add i32 %704, %693
  %706 = tail call i32 @llvm.fshl.i32(i32 %694, i32 %694, i32 26)
  %707 = tail call i32 @llvm.fshl.i32(i32 %694, i32 %694, i32 21)
  %708 = xor i32 %706, %707
  %709 = tail call i32 @llvm.fshl.i32(i32 %694, i32 %694, i32 7)
  %710 = xor i32 %708, %709
  %711 = xor i32 %655, %616
  %712 = and i32 %694, %711
  %713 = xor i32 %712, %616
  %714 = getelementptr i8, ptr %392, i64 96
  %715 = load i32, ptr %714, align 4, !tbaa !1
  %716 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 15)
  %717 = tail call i32 @llvm.fshl.i32(i32 %650, i32 %650, i32 13)
  %718 = xor i32 %716, %717
  %719 = lshr i32 %650, 10
  %720 = xor i32 %718, %719
  %721 = tail call i32 @llvm.fshl.i32(i32 %381, i32 %381, i32 25)
  %722 = tail call i32 @llvm.fshl.i32(i32 %381, i32 %381, i32 14)
  %723 = xor i32 %721, %722
  %724 = lshr i32 %381, 3
  %725 = xor i32 %723, %724
  %726 = add i32 %455, %725
  %727 = add i32 %726, %368
  %728 = add i32 %727, %720
  %729 = add i32 %728, %715
  %730 = add i32 %729, %577
  %731 = add i32 %730, %713
  %732 = add i32 %731, %710
  %733 = add i32 %732, %588
  %734 = tail call i32 @llvm.fshl.i32(i32 %705, i32 %705, i32 30)
  %735 = tail call i32 @llvm.fshl.i32(i32 %705, i32 %705, i32 19)
  %736 = xor i32 %734, %735
  %737 = tail call i32 @llvm.fshl.i32(i32 %705, i32 %705, i32 10)
  %738 = xor i32 %736, %737
  %739 = and i32 %705, %666
  %740 = xor i32 %705, %666
  %741 = and i32 %740, %627
  %742 = xor i32 %741, %739
  %743 = add i32 %738, %742
  %744 = add i32 %743, %732
  %745 = tail call i32 @llvm.fshl.i32(i32 %733, i32 %733, i32 26)
  %746 = tail call i32 @llvm.fshl.i32(i32 %733, i32 %733, i32 21)
  %747 = xor i32 %745, %746
  %748 = tail call i32 @llvm.fshl.i32(i32 %733, i32 %733, i32 7)
  %749 = xor i32 %747, %748
  %750 = xor i32 %694, %655
  %751 = and i32 %733, %750
  %752 = xor i32 %751, %655
  %753 = getelementptr i8, ptr %392, i64 100
  %754 = load i32, ptr %753, align 4, !tbaa !1
  %755 = tail call i32 @llvm.fshl.i32(i32 %689, i32 %689, i32 15)
  %756 = tail call i32 @llvm.fshl.i32(i32 %689, i32 %689, i32 13)
  %757 = xor i32 %755, %756
  %758 = lshr i32 %689, 10
  %759 = xor i32 %757, %758
  %760 = tail call i32 @llvm.fshl.i32(i32 %378, i32 %378, i32 25)
  %761 = tail call i32 @llvm.fshl.i32(i32 %378, i32 %378, i32 14)
  %762 = xor i32 %760, %761
  %763 = lshr i32 %378, 3
  %764 = xor i32 %762, %763
  %765 = add i32 %764, %381
  %766 = add i32 %765, %494
  %767 = add i32 %766, %759
  %768 = add i32 %767, %754
  %769 = add i32 %768, %616
  %770 = add i32 %769, %752
  %771 = add i32 %770, %749
  %772 = add i32 %771, %627
  %773 = tail call i32 @llvm.fshl.i32(i32 %744, i32 %744, i32 30)
  %774 = tail call i32 @llvm.fshl.i32(i32 %744, i32 %744, i32 19)
  %775 = xor i32 %773, %774
  %776 = tail call i32 @llvm.fshl.i32(i32 %744, i32 %744, i32 10)
  %777 = xor i32 %775, %776
  %778 = and i32 %744, %705
  %779 = xor i32 %744, %705
  %780 = and i32 %779, %666
  %781 = xor i32 %780, %778
  %782 = add i32 %777, %781
  %783 = add i32 %782, %771
  %784 = tail call i32 @llvm.fshl.i32(i32 %772, i32 %772, i32 26)
  %785 = tail call i32 @llvm.fshl.i32(i32 %772, i32 %772, i32 21)
  %786 = xor i32 %784, %785
  %787 = tail call i32 @llvm.fshl.i32(i32 %772, i32 %772, i32 7)
  %788 = xor i32 %786, %787
  %789 = xor i32 %733, %694
  %790 = and i32 %772, %789
  %791 = xor i32 %790, %694
  %792 = getelementptr i8, ptr %392, i64 104
  %793 = load i32, ptr %792, align 4, !tbaa !1
  %794 = tail call i32 @llvm.fshl.i32(i32 %728, i32 %728, i32 15)
  %795 = tail call i32 @llvm.fshl.i32(i32 %728, i32 %728, i32 13)
  %796 = xor i32 %794, %795
  %797 = lshr i32 %728, 10
  %798 = xor i32 %796, %797
  %799 = tail call i32 @llvm.fshl.i32(i32 %376, i32 %376, i32 25)
  %800 = tail call i32 @llvm.fshl.i32(i32 %376, i32 %376, i32 14)
  %801 = xor i32 %799, %800
  %802 = lshr i32 %376, 3
  %803 = xor i32 %801, %802
  %804 = add i32 %803, %378
  %805 = add i32 %804, %533
  %806 = add i32 %805, %798
  %807 = add i32 %806, %793
  %808 = add i32 %807, %655
  %809 = add i32 %808, %791
  %810 = add i32 %809, %788
  %811 = add i32 %810, %666
  %812 = tail call i32 @llvm.fshl.i32(i32 %783, i32 %783, i32 30)
  %813 = tail call i32 @llvm.fshl.i32(i32 %783, i32 %783, i32 19)
  %814 = xor i32 %812, %813
  %815 = tail call i32 @llvm.fshl.i32(i32 %783, i32 %783, i32 10)
  %816 = xor i32 %814, %815
  %817 = and i32 %783, %744
  %818 = xor i32 %783, %744
  %819 = and i32 %818, %705
  %820 = xor i32 %819, %817
  %821 = add i32 %816, %820
  %822 = add i32 %821, %810
  %823 = tail call i32 @llvm.fshl.i32(i32 %811, i32 %811, i32 26)
  %824 = tail call i32 @llvm.fshl.i32(i32 %811, i32 %811, i32 21)
  %825 = xor i32 %823, %824
  %826 = tail call i32 @llvm.fshl.i32(i32 %811, i32 %811, i32 7)
  %827 = xor i32 %825, %826
  %828 = xor i32 %772, %733
  %829 = and i32 %811, %828
  %830 = xor i32 %829, %733
  %831 = getelementptr i8, ptr %392, i64 108
  %832 = load i32, ptr %831, align 4, !tbaa !1
  %833 = tail call i32 @llvm.fshl.i32(i32 %767, i32 %767, i32 15)
  %834 = tail call i32 @llvm.fshl.i32(i32 %767, i32 %767, i32 13)
  %835 = xor i32 %833, %834
  %836 = lshr i32 %767, 10
  %837 = xor i32 %835, %836
  %838 = tail call i32 @llvm.fshl.i32(i32 %374, i32 %374, i32 25)
  %839 = tail call i32 @llvm.fshl.i32(i32 %374, i32 %374, i32 14)
  %840 = xor i32 %838, %839
  %841 = lshr i32 %374, 3
  %842 = xor i32 %840, %841
  %843 = add i32 %842, %376
  %844 = add i32 %843, %572
  %845 = add i32 %844, %837
  %846 = add i32 %845, %832
  %847 = add i32 %846, %694
  %848 = add i32 %847, %830
  %849 = add i32 %848, %827
  %850 = add i32 %849, %705
  %851 = tail call i32 @llvm.fshl.i32(i32 %822, i32 %822, i32 30)
  %852 = tail call i32 @llvm.fshl.i32(i32 %822, i32 %822, i32 19)
  %853 = xor i32 %851, %852
  %854 = tail call i32 @llvm.fshl.i32(i32 %822, i32 %822, i32 10)
  %855 = xor i32 %853, %854
  %856 = and i32 %822, %783
  %857 = xor i32 %822, %783
  %858 = and i32 %857, %744
  %859 = xor i32 %858, %856
  %860 = add i32 %855, %859
  %861 = add i32 %860, %849
  %862 = tail call i32 @llvm.fshl.i32(i32 %850, i32 %850, i32 26)
  %863 = tail call i32 @llvm.fshl.i32(i32 %850, i32 %850, i32 21)
  %864 = xor i32 %862, %863
  %865 = tail call i32 @llvm.fshl.i32(i32 %850, i32 %850, i32 7)
  %866 = xor i32 %864, %865
  %867 = xor i32 %811, %772
  %868 = and i32 %850, %867
  %869 = xor i32 %868, %772
  %870 = getelementptr i8, ptr %392, i64 112
  %871 = load i32, ptr %870, align 4, !tbaa !1
  %872 = tail call i32 @llvm.fshl.i32(i32 %806, i32 %806, i32 15)
  %873 = tail call i32 @llvm.fshl.i32(i32 %806, i32 %806, i32 13)
  %874 = xor i32 %872, %873
  %875 = lshr i32 %806, 10
  %876 = xor i32 %874, %875
  %877 = tail call i32 @llvm.fshl.i32(i32 %372, i32 %372, i32 25)
  %878 = tail call i32 @llvm.fshl.i32(i32 %372, i32 %372, i32 14)
  %879 = xor i32 %877, %878
  %880 = lshr i32 %372, 3
  %881 = xor i32 %879, %880
  %882 = add i32 %881, %374
  %883 = add i32 %882, %611
  %884 = add i32 %883, %876
  %885 = add i32 %884, %871
  %886 = add i32 %885, %733
  %887 = add i32 %886, %869
  %888 = add i32 %887, %866
  %889 = add i32 %888, %744
  %890 = tail call i32 @llvm.fshl.i32(i32 %861, i32 %861, i32 30)
  %891 = tail call i32 @llvm.fshl.i32(i32 %861, i32 %861, i32 19)
  %892 = xor i32 %890, %891
  %893 = tail call i32 @llvm.fshl.i32(i32 %861, i32 %861, i32 10)
  %894 = xor i32 %892, %893
  %895 = and i32 %861, %822
  %896 = xor i32 %861, %822
  %897 = and i32 %896, %783
  %898 = xor i32 %897, %895
  %899 = add i32 %894, %898
  %900 = add i32 %899, %888
  %901 = tail call i32 @llvm.fshl.i32(i32 %889, i32 %889, i32 26)
  %902 = tail call i32 @llvm.fshl.i32(i32 %889, i32 %889, i32 21)
  %903 = xor i32 %901, %902
  %904 = tail call i32 @llvm.fshl.i32(i32 %889, i32 %889, i32 7)
  %905 = xor i32 %903, %904
  %906 = xor i32 %850, %811
  %907 = and i32 %889, %906
  %908 = xor i32 %907, %811
  %909 = getelementptr i8, ptr %392, i64 116
  %910 = load i32, ptr %909, align 4, !tbaa !1
  %911 = tail call i32 @llvm.fshl.i32(i32 %845, i32 %845, i32 15)
  %912 = tail call i32 @llvm.fshl.i32(i32 %845, i32 %845, i32 13)
  %913 = xor i32 %911, %912
  %914 = lshr i32 %845, 10
  %915 = xor i32 %913, %914
  %916 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 25)
  %917 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 14)
  %918 = xor i32 %916, %917
  %919 = lshr i32 %382, 3
  %920 = xor i32 %918, %919
  %921 = add i32 %372, %920
  %922 = add i32 %921, %650
  %923 = add i32 %922, %915
  %924 = add i32 %923, %910
  %925 = add i32 %924, %772
  %926 = add i32 %925, %908
  %927 = add i32 %926, %905
  %928 = add i32 %927, %783
  %929 = tail call i32 @llvm.fshl.i32(i32 %900, i32 %900, i32 30)
  %930 = tail call i32 @llvm.fshl.i32(i32 %900, i32 %900, i32 19)
  %931 = xor i32 %929, %930
  %932 = tail call i32 @llvm.fshl.i32(i32 %900, i32 %900, i32 10)
  %933 = xor i32 %931, %932
  %934 = and i32 %900, %861
  %935 = xor i32 %900, %861
  %936 = and i32 %935, %822
  %937 = xor i32 %936, %934
  %938 = add i32 %933, %937
  %939 = add i32 %938, %927
  %940 = tail call i32 @llvm.fshl.i32(i32 %928, i32 %928, i32 26)
  %941 = tail call i32 @llvm.fshl.i32(i32 %928, i32 %928, i32 21)
  %942 = xor i32 %940, %941
  %943 = tail call i32 @llvm.fshl.i32(i32 %928, i32 %928, i32 7)
  %944 = xor i32 %942, %943
  %945 = xor i32 %889, %850
  %946 = and i32 %928, %945
  %947 = xor i32 %946, %850
  %948 = getelementptr i8, ptr %392, i64 120
  %949 = load i32, ptr %948, align 4, !tbaa !1
  %950 = tail call i32 @llvm.fshl.i32(i32 %884, i32 %884, i32 15)
  %951 = tail call i32 @llvm.fshl.i32(i32 %884, i32 %884, i32 13)
  %952 = xor i32 %950, %951
  %953 = lshr i32 %884, 10
  %954 = xor i32 %952, %953
  %955 = tail call i32 @llvm.fshl.i32(i32 %379, i32 %379, i32 25)
  %956 = tail call i32 @llvm.fshl.i32(i32 %379, i32 %379, i32 14)
  %957 = xor i32 %955, %956
  %958 = lshr i32 %379, 3
  %959 = xor i32 %957, %958
  %960 = add i32 %959, %382
  %961 = add i32 %960, %689
  %962 = add i32 %961, %954
  %963 = add i32 %962, %949
  %964 = add i32 %963, %811
  %965 = add i32 %964, %947
  %966 = add i32 %965, %944
  %967 = add i32 %966, %822
  %968 = tail call i32 @llvm.fshl.i32(i32 %939, i32 %939, i32 30)
  %969 = tail call i32 @llvm.fshl.i32(i32 %939, i32 %939, i32 19)
  %970 = xor i32 %968, %969
  %971 = tail call i32 @llvm.fshl.i32(i32 %939, i32 %939, i32 10)
  %972 = xor i32 %970, %971
  %973 = and i32 %939, %900
  %974 = xor i32 %939, %900
  %975 = and i32 %974, %861
  %976 = xor i32 %975, %973
  %977 = add i32 %972, %976
  %978 = add i32 %977, %966
  %979 = tail call i32 @llvm.fshl.i32(i32 %967, i32 %967, i32 26)
  %980 = tail call i32 @llvm.fshl.i32(i32 %967, i32 %967, i32 21)
  %981 = xor i32 %979, %980
  %982 = tail call i32 @llvm.fshl.i32(i32 %967, i32 %967, i32 7)
  %983 = xor i32 %981, %982
  %984 = xor i32 %928, %889
  %985 = and i32 %967, %984
  %986 = xor i32 %985, %889
  %987 = getelementptr i8, ptr %392, i64 124
  %988 = load i32, ptr %987, align 4, !tbaa !1
  %989 = tail call i32 @llvm.fshl.i32(i32 %923, i32 %923, i32 15)
  %990 = tail call i32 @llvm.fshl.i32(i32 %923, i32 %923, i32 13)
  %991 = xor i32 %989, %990
  %992 = lshr i32 %923, 10
  %993 = xor i32 %991, %992
  %994 = tail call i32 @llvm.fshl.i32(i32 %416, i32 %416, i32 25)
  %995 = tail call i32 @llvm.fshl.i32(i32 %416, i32 %416, i32 14)
  %996 = xor i32 %994, %995
  %997 = lshr i32 %416, 3
  %998 = xor i32 %996, %997
  %999 = add i32 %998, %379
  %1000 = add i32 %999, %728
  %1001 = add i32 %1000, %993
  %1002 = add i32 %1001, %988
  %1003 = add i32 %1002, %850
  %1004 = add i32 %1003, %986
  %1005 = add i32 %1004, %983
  %1006 = add i32 %1005, %861
  %1007 = tail call i32 @llvm.fshl.i32(i32 %978, i32 %978, i32 30)
  %1008 = tail call i32 @llvm.fshl.i32(i32 %978, i32 %978, i32 19)
  %1009 = xor i32 %1007, %1008
  %1010 = tail call i32 @llvm.fshl.i32(i32 %978, i32 %978, i32 10)
  %1011 = xor i32 %1009, %1010
  %1012 = and i32 %978, %939
  %1013 = xor i32 %978, %939
  %1014 = and i32 %1013, %900
  %1015 = xor i32 %1014, %1012
  %1016 = add i32 %1011, %1015
  %1017 = add i32 %1016, %1005
  %1018 = add nuw nsw i32 %383, 16
  %1019 = icmp samesign ult i32 %383, 48
  %1020 = load i64, ptr @DynMemReadCount, align 8
  %1021 = add i64 %1020, 16
  store i64 %1021, ptr @DynMemReadCount, align 8
  %1022 = load i64, ptr @DynAddressMathCount, align 8
  %1023 = add i64 %1022, 16
  store i64 %1023, ptr @DynAddressMathCount, align 8
  %1024 = load i64, ptr @DynControlFlowCount, align 8
  %1025 = add i64 %1024, 1
  store i64 %1025, ptr @DynControlFlowCount, align 8
  %1026 = load i64, ptr @DynALUCount, align 8
  %1027 = add i64 %1026, 434
  store i64 %1027, ptr @DynALUCount, align 8
  br i1 %1019, label %367, label %1028, !llvm.loop !21

1028:                                             ; preds = %367
  %1029 = add i32 %1017, %64
  store i32 %1029, ptr %0, align 4, !tbaa !1
  %1030 = add i32 %978, %66
  store i32 %1030, ptr %65, align 4, !tbaa !1
  %1031 = add i32 %939, %68
  store i32 %1031, ptr %67, align 4, !tbaa !1
  %1032 = add i32 %900, %70
  store i32 %1032, ptr %69, align 4, !tbaa !1
  %1033 = add i32 %1006, %72
  store i32 %1033, ptr %71, align 4, !tbaa !1
  %1034 = add i32 %967, %74
  store i32 %1034, ptr %73, align 4, !tbaa !1
  %1035 = add i32 %928, %76
  store i32 %1035, ptr %75, align 4, !tbaa !1
  %1036 = add i32 %889, %78
  store i32 %1036, ptr %77, align 4, !tbaa !1
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #17
  %1037 = load i64, ptr @DynMemWriteCount, align 8
  %1038 = add i64 %1037, 8
  store i64 %1038, ptr @DynMemWriteCount, align 8
  %1039 = load i64, ptr @DynControlFlowCount, align 8
  %1040 = add i64 %1039, 1
  store i64 %1040, ptr @DynControlFlowCount, align 8
  %1041 = load i64, ptr @DynALUCount, align 8
  %1042 = add i64 %1041, 8
  store i64 %1042, ptr @DynALUCount, align 8
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
  %4 = lshr i64 %0, 2
  %5 = trunc i64 %0 to i32
  %6 = and i32 %5, 3
  %7 = icmp eq i64 %4, 0
  %8 = load i64, ptr @DynControlFlowCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynControlFlowCount, align 8
  %10 = load i64, ptr @DynALUCount, align 8
  %11 = add i64 %10, 3
  store i64 %11, ptr @DynALUCount, align 8
  %12 = load i64, ptr @DynCastCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynCastCount, align 8
  br i1 %7, label %117, label %14

14:                                               ; preds = %3
  %15 = and i64 %4, 1
  %16 = icmp eq i64 %4, 1
  %17 = load i64, ptr @DynControlFlowCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynControlFlowCount, align 8
  %19 = load i64, ptr @DynALUCount, align 8
  %20 = add i64 %19, 2
  store i64 %20, ptr @DynALUCount, align 8
  br i1 %16, label %85, label %21

21:                                               ; preds = %14
  %22 = and i64 %4, 4611686018427387902
  %23 = load i64, ptr @DynControlFlowCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynControlFlowCount, align 8
  %25 = load i64, ptr @DynALUCount, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr @DynALUCount, align 8
  br label %27

27:                                               ; preds = %27, %21
  %28 = phi ptr [ %1, %21 ], [ %64, %27 ]
  %29 = phi i64 [ 0, %21 ], [ %63, %27 ]
  %30 = phi i64 [ 0, %21 ], [ %65, %27 ]
  %31 = getelementptr inbounds nuw i32, ptr %2, i64 %29
  %32 = load i32, ptr %31, align 4, !tbaa !1
  %33 = lshr i32 %32, 24
  %34 = trunc nuw i32 %33 to i8
  store i8 %34, ptr %28, align 1, !tbaa !17
  %35 = load i32, ptr %31, align 4, !tbaa !1
  %36 = lshr i32 %35, 16
  %37 = trunc i32 %36 to i8
  %38 = getelementptr inbounds nuw i8, ptr %28, i64 1
  store i8 %37, ptr %38, align 1, !tbaa !17
  %39 = load i32, ptr %31, align 4, !tbaa !1
  %40 = lshr i32 %39, 8
  %41 = trunc i32 %40 to i8
  %42 = getelementptr inbounds nuw i8, ptr %28, i64 2
  store i8 %41, ptr %42, align 1, !tbaa !17
  %43 = load i32, ptr %31, align 4, !tbaa !1
  %44 = trunc i32 %43 to i8
  %45 = getelementptr inbounds nuw i8, ptr %28, i64 3
  store i8 %44, ptr %45, align 1, !tbaa !17
  %46 = getelementptr inbounds nuw i8, ptr %28, i64 4
  %47 = getelementptr inbounds nuw i32, ptr %2, i64 %29
  %48 = getelementptr inbounds nuw i8, ptr %47, i64 4
  %49 = load i32, ptr %48, align 4, !tbaa !1
  %50 = lshr i32 %49, 24
  %51 = trunc nuw i32 %50 to i8
  store i8 %51, ptr %46, align 1, !tbaa !17
  %52 = load i32, ptr %48, align 4, !tbaa !1
  %53 = lshr i32 %52, 16
  %54 = trunc i32 %53 to i8
  %55 = getelementptr inbounds nuw i8, ptr %28, i64 5
  store i8 %54, ptr %55, align 1, !tbaa !17
  %56 = load i32, ptr %48, align 4, !tbaa !1
  %57 = lshr i32 %56, 8
  %58 = trunc i32 %57 to i8
  %59 = getelementptr inbounds nuw i8, ptr %28, i64 6
  store i8 %58, ptr %59, align 1, !tbaa !17
  %60 = load i32, ptr %48, align 4, !tbaa !1
  %61 = trunc i32 %60 to i8
  %62 = getelementptr inbounds nuw i8, ptr %28, i64 7
  store i8 %61, ptr %62, align 1, !tbaa !17
  %63 = add nuw nsw i64 %29, 2
  %64 = getelementptr inbounds nuw i8, ptr %28, i64 8
  %65 = add i64 %30, 2
  %66 = icmp eq i64 %65, %22
  %67 = load i64, ptr @DynMemReadCount, align 8
  %68 = add i64 %67, 8
  store i64 %68, ptr @DynMemReadCount, align 8
  %69 = load i64, ptr @DynMemWriteCount, align 8
  %70 = add i64 %69, 8
  store i64 %70, ptr @DynMemWriteCount, align 8
  %71 = load i64, ptr @DynAddressMathCount, align 8
  %72 = add i64 %71, 11
  store i64 %72, ptr @DynAddressMathCount, align 8
  %73 = load i64, ptr @DynControlFlowCount, align 8
  %74 = add i64 %73, 1
  store i64 %74, ptr @DynControlFlowCount, align 8
  %75 = load i64, ptr @DynALUCount, align 8
  %76 = add i64 %75, 9
  store i64 %76, ptr @DynALUCount, align 8
  %77 = load i64, ptr @DynCastCount, align 8
  %78 = add i64 %77, 8
  store i64 %78, ptr @DynCastCount, align 8
  br i1 %66, label %79, label %27, !llvm.loop !18

79:                                               ; preds = %27
  %80 = icmp eq i64 %15, 0
  %81 = load i64, ptr @DynControlFlowCount, align 8
  %82 = add i64 %81, 1
  store i64 %82, ptr @DynControlFlowCount, align 8
  %83 = load i64, ptr @DynALUCount, align 8
  %84 = add i64 %83, 1
  store i64 %84, ptr @DynALUCount, align 8
  br i1 %80, label %117, label %85

85:                                               ; preds = %79, %14
  %86 = phi ptr [ %1, %14 ], [ %64, %79 ]
  %87 = phi i64 [ 0, %14 ], [ %63, %79 ]
  %88 = icmp ne i64 %15, 0
  tail call void @llvm.assume(i1 %88)
  %89 = getelementptr inbounds nuw i32, ptr %2, i64 %87
  %90 = load i32, ptr %89, align 4, !tbaa !1
  %91 = lshr i32 %90, 24
  %92 = trunc nuw i32 %91 to i8
  store i8 %92, ptr %86, align 1, !tbaa !17
  %93 = load i32, ptr %89, align 4, !tbaa !1
  %94 = lshr i32 %93, 16
  %95 = trunc i32 %94 to i8
  %96 = getelementptr inbounds nuw i8, ptr %86, i64 1
  store i8 %95, ptr %96, align 1, !tbaa !17
  %97 = load i32, ptr %89, align 4, !tbaa !1
  %98 = lshr i32 %97, 8
  %99 = trunc i32 %98 to i8
  %100 = getelementptr inbounds nuw i8, ptr %86, i64 2
  store i8 %99, ptr %100, align 1, !tbaa !17
  %101 = load i32, ptr %89, align 4, !tbaa !1
  %102 = trunc i32 %101 to i8
  %103 = getelementptr inbounds nuw i8, ptr %86, i64 3
  store i8 %102, ptr %103, align 1, !tbaa !17
  %104 = getelementptr inbounds nuw i8, ptr %86, i64 4
  %105 = load i64, ptr @DynMemReadCount, align 8
  %106 = add i64 %105, 4
  store i64 %106, ptr @DynMemReadCount, align 8
  %107 = load i64, ptr @DynMemWriteCount, align 8
  %108 = add i64 %107, 4
  store i64 %108, ptr @DynMemWriteCount, align 8
  %109 = load i64, ptr @DynAddressMathCount, align 8
  %110 = add i64 %109, 5
  store i64 %110, ptr @DynAddressMathCount, align 8
  %111 = load i64, ptr @DynControlFlowCount, align 8
  %112 = add i64 %111, 1
  store i64 %112, ptr @DynControlFlowCount, align 8
  %113 = load i64, ptr @DynALUCount, align 8
  %114 = add i64 %113, 4
  store i64 %114, ptr @DynALUCount, align 8
  %115 = load i64, ptr @DynCastCount, align 8
  %116 = add i64 %115, 4
  store i64 %116, ptr @DynCastCount, align 8
  br label %117

117:                                              ; preds = %85, %79, %3
  %118 = phi ptr [ %1, %3 ], [ %64, %79 ], [ %104, %85 ]
  %119 = icmp eq i32 %6, 0
  %120 = load i64, ptr @DynControlFlowCount, align 8
  %121 = add i64 %120, 1
  store i64 %121, ptr @DynControlFlowCount, align 8
  %122 = load i64, ptr @DynALUCount, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr @DynALUCount, align 8
  br i1 %119, label %177, label %124

124:                                              ; preds = %117
  %125 = getelementptr inbounds nuw i32, ptr %2, i64 %4
  %126 = load i32, ptr %125, align 4, !tbaa !1
  %127 = load i64, ptr @DynMemReadCount, align 8
  %128 = add i64 %127, 1
  store i64 %128, ptr @DynMemReadCount, align 8
  %129 = load i64, ptr @DynAddressMathCount, align 8
  %130 = add i64 %129, 1
  store i64 %130, ptr @DynAddressMathCount, align 8
  %131 = load i64, ptr @DynControlFlowCount, align 8
  %132 = add i64 %131, 1
  store i64 %132, ptr @DynControlFlowCount, align 8
  switch i32 %6, label %133 [
    i32 3, label %136
    i32 2, label %152
    i32 1, label %166
  ]

133:                                              ; preds = %124
  %134 = load i64, ptr @DynControlFlowCount, align 8
  %135 = add i64 %134, 1
  store i64 %135, ptr @DynControlFlowCount, align 8
  unreachable

136:                                              ; preds = %124
  %137 = lshr i32 %126, 8
  %138 = trunc i32 %137 to i8
  %139 = and i64 %0, 3
  %140 = getelementptr i8, ptr %118, i64 %139
  %141 = getelementptr i8, ptr %140, i64 -1
  store i8 %138, ptr %141, align 1, !tbaa !17
  %142 = load i64, ptr @DynMemWriteCount, align 8
  %143 = add i64 %142, 1
  store i64 %143, ptr @DynMemWriteCount, align 8
  %144 = load i64, ptr @DynAddressMathCount, align 8
  %145 = add i64 %144, 2
  store i64 %145, ptr @DynAddressMathCount, align 8
  %146 = load i64, ptr @DynControlFlowCount, align 8
  %147 = add i64 %146, 1
  store i64 %147, ptr @DynControlFlowCount, align 8
  %148 = load i64, ptr @DynALUCount, align 8
  %149 = add i64 %148, 2
  store i64 %149, ptr @DynALUCount, align 8
  %150 = load i64, ptr @DynCastCount, align 8
  %151 = add i64 %150, 1
  store i64 %151, ptr @DynCastCount, align 8
  br label %152

152:                                              ; preds = %136, %124
  %153 = lshr i32 %126, 16
  %154 = trunc i32 %153 to i8
  %155 = getelementptr inbounds nuw i8, ptr %118, i64 1
  store i8 %154, ptr %155, align 1, !tbaa !17
  %156 = load i64, ptr @DynMemWriteCount, align 8
  %157 = add i64 %156, 1
  store i64 %157, ptr @DynMemWriteCount, align 8
  %158 = load i64, ptr @DynAddressMathCount, align 8
  %159 = add i64 %158, 1
  store i64 %159, ptr @DynAddressMathCount, align 8
  %160 = load i64, ptr @DynControlFlowCount, align 8
  %161 = add i64 %160, 1
  store i64 %161, ptr @DynControlFlowCount, align 8
  %162 = load i64, ptr @DynALUCount, align 8
  %163 = add i64 %162, 1
  store i64 %163, ptr @DynALUCount, align 8
  %164 = load i64, ptr @DynCastCount, align 8
  %165 = add i64 %164, 1
  store i64 %165, ptr @DynCastCount, align 8
  br label %166

166:                                              ; preds = %152, %124
  %167 = lshr i32 %126, 24
  %168 = trunc nuw i32 %167 to i8
  store i8 %168, ptr %118, align 1, !tbaa !17
  %169 = load i64, ptr @DynMemWriteCount, align 8
  %170 = add i64 %169, 1
  store i64 %170, ptr @DynMemWriteCount, align 8
  %171 = load i64, ptr @DynControlFlowCount, align 8
  %172 = add i64 %171, 1
  store i64 %172, ptr @DynControlFlowCount, align 8
  %173 = load i64, ptr @DynALUCount, align 8
  %174 = add i64 %173, 1
  store i64 %174, ptr @DynALUCount, align 8
  %175 = load i64, ptr @DynCastCount, align 8
  %176 = add i64 %175, 1
  store i64 %176, ptr @DynCastCount, align 8
  br label %177

177:                                              ; preds = %166, %117
  %178 = load i64, ptr @DynControlFlowCount, align 8
  %179 = add i64 %178, 1
  store i64 %179, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #8 {
  %2 = load <8 x i8>, ptr @hash, align 16, !tbaa !17
  %3 = load <8 x i8>, ptr @buffer, align 16, !tbaa !17
  %4 = icmp eq <8 x i8> %2, %3
  %5 = freeze <8 x i1> %4
  %6 = bitcast <8 x i1> %5 to i8
  %7 = icmp eq i8 %6, -1
  %8 = zext i1 %7 to i32
  %9 = load i64, ptr @DynMemReadCount, align 8
  %10 = add i64 %9, 2
  store i64 %10, ptr @DynMemReadCount, align 8
  %11 = load i64, ptr @DynControlFlowCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynControlFlowCount, align 8
  %13 = load i64, ptr @DynALUCount, align 8
  %14 = add i64 %13, 2
  store i64 %14, ptr @DynALUCount, align 8
  %15 = load i64, ptr @DynVectorCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynVectorCount, align 8
  %17 = load i64, ptr @DynCastCount, align 8
  %18 = add i64 %17, 2
  store i64 %18, ptr @DynCastCount, align 8
  ret i32 %8
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
  %4 = icmp eq i32 %1, 0
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 104
  %7 = getelementptr inbounds nuw i8, ptr %3, i64 40
  %8 = load i64, ptr @DynAddressMathCount, align 8
  %9 = add i64 %8, 3
  store i64 %9, ptr @DynAddressMathCount, align 8
  %10 = load i64, ptr @DynControlFlowCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynControlFlowCount, align 8
  %12 = load i64, ptr @DynALUCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynALUCount, align 8
  br label %14

14:                                               ; preds = %21, %2
  %15 = phi i32 [ 0, %2 ], [ %22, %21 ]
  %16 = load i64, ptr @DynControlFlowCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynControlFlowCount, align 8
  br i1 %4, label %21, label %28

18:                                               ; preds = %21
  %19 = load i64, ptr @DynControlFlowCount, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr @DynControlFlowCount, align 8
  ret void

21:                                               ; preds = %28, %14
  %22 = add nuw nsw i32 %15, 1
  %23 = icmp eq i32 %22, %0
  %24 = load i64, ptr @DynControlFlowCount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @DynControlFlowCount, align 8
  %26 = load i64, ptr @DynALUCount, align 8
  %27 = add i64 %26, 2
  store i64 %27, ptr @DynALUCount, align 8
  br i1 %23, label %18, label %14, !llvm.loop !22

28:                                               ; preds = %28, %14
  %29 = phi i32 [ %30, %28 ], [ 0, %14 ]
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) @buffer, i8 0, i64 32, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #17
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %3, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  store i64 0, ptr %5, align 8, !tbaa !12
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %7, ptr noundef nonnull align 16 dereferenceable(56) @msg, i64 56, i1 false)
  store i32 56, ptr %6, align 8, !tbaa !15
  call void @sha256_digest(ptr noundef nonnull %3, i64 noundef 32, ptr noundef nonnull @buffer)
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #17
  %30 = add nuw i32 %29, 1
  %31 = icmp eq i32 %30, %1
  %32 = load i64, ptr @DynMemWriteCount, align 8
  %33 = add i64 %32, 2
  store i64 %33, ptr @DynMemWriteCount, align 8
  %34 = load i64, ptr @DynControlFlowCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynControlFlowCount, align 8
  %36 = load i64, ptr @DynALUCount, align 8
  %37 = add i64 %36, 2
  store i64 %37, ptr @DynALUCount, align 8
  br i1 %31, label %21, label %28, !llvm.loop !23
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
  %1 = load i64, ptr @seed, align 8, !tbaa !24
  %2 = mul nuw nsw i64 %1, 1103515245
  %3 = add nuw nsw i64 %2, 12345
  %4 = and i64 %3, 2147483647
  store i64 %4, ptr @seed, align 8, !tbaa !24
  %5 = lshr i64 %4, 16
  %6 = trunc nuw nsw i64 %5 to i32
  %7 = load i64, ptr @DynMemReadCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynMemReadCount, align 8
  %9 = load i64, ptr @DynMemWriteCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynMemWriteCount, align 8
  %11 = load i64, ptr @DynControlFlowCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynControlFlowCount, align 8
  %13 = load i64, ptr @DynALUCount, align 8
  %14 = add i64 %13, 4
  store i64 %14, ptr @DynALUCount, align 8
  %15 = load i64, ptr @DynCastCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynCastCount, align 8
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @srand_beebs(i32 noundef %0) local_unnamed_addr #14 {
  %2 = zext i32 %0 to i64
  store i64 %2, ptr @seed, align 8, !tbaa !24
  %3 = load i64, ptr @DynMemWriteCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynMemWriteCount, align 8
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  %7 = load i64, ptr @DynCastCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynCastCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @init_heap_beebs(ptr noundef %0, i64 noundef %1) local_unnamed_addr #15 {
  %3 = and i64 %1, 7
  %4 = icmp eq i64 %3, 0
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  %7 = load i64, ptr @DynALUCount, align 8
  %8 = add i64 %7, 2
  store i64 %8, ptr @DynALUCount, align 8
  br i1 %4, label %12, label %9

9:                                                ; preds = %9, %2
  %10 = load i64, ptr @DynControlFlowCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynControlFlowCount, align 8
  br label %9

12:                                               ; preds = %2
  store ptr %0, ptr @heap_ptr, align 8, !tbaa !25
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 %1
  store ptr %13, ptr @heap_end, align 8, !tbaa !25
  store i64 0, ptr @heap_requested, align 8, !tbaa !24
  %14 = load i64, ptr @DynMemWriteCount, align 8
  %15 = add i64 %14, 3
  store i64 %15, ptr @DynMemWriteCount, align 8
  %16 = load i64, ptr @DynAddressMathCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynAddressMathCount, align 8
  %18 = load i64, ptr @DynControlFlowCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @check_heap_beebs(ptr noundef readnone captures(address) %0) local_unnamed_addr #8 {
  %2 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 %2
  %4 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %5 = icmp ule ptr %3, %4
  %6 = zext i1 %5 to i32
  %7 = load i64, ptr @DynMemReadCount, align 8
  %8 = add i64 %7, 2
  store i64 %8, ptr @DynMemReadCount, align 8
  %9 = load i64, ptr @DynAddressMathCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynAddressMathCount, align 8
  %11 = load i64, ptr @DynControlFlowCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynControlFlowCount, align 8
  %13 = load i64, ptr @DynALUCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynALUCount, align 8
  %15 = load i64, ptr @DynCastCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynCastCount, align 8
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @malloc_beebs(i64 noundef %0) local_unnamed_addr #13 {
  %2 = icmp eq i64 %0, 0
  %3 = load i64, ptr @DynControlFlowCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynControlFlowCount, align 8
  %5 = load i64, ptr @DynALUCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynALUCount, align 8
  br i1 %2, label %38, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 %0
  %10 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %11 = add i64 %10, %0
  %12 = ptrtoint ptr %9 to i64
  %13 = and i64 %12, 7
  %14 = icmp eq i64 %13, 0
  %15 = sub nuw nsw i64 8, %13
  %16 = select i1 %14, i64 0, i64 %15
  %17 = add i64 %11, %16
  %18 = getelementptr inbounds nuw i8, ptr %9, i64 %16
  store i64 %17, ptr @heap_requested, align 8, !tbaa !24
  %19 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %20 = icmp ugt ptr %18, %19
  %21 = load i64, ptr @DynMemReadCount, align 8
  %22 = add i64 %21, 3
  store i64 %22, ptr @DynMemReadCount, align 8
  %23 = load i64, ptr @DynMemWriteCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynMemWriteCount, align 8
  %25 = load i64, ptr @DynAddressMathCount, align 8
  %26 = add i64 %25, 2
  store i64 %26, ptr @DynAddressMathCount, align 8
  %27 = load i64, ptr @DynControlFlowCount, align 8
  %28 = add i64 %27, 1
  store i64 %28, ptr @DynControlFlowCount, align 8
  %29 = load i64, ptr @DynALUCount, align 8
  %30 = add i64 %29, 6
  store i64 %30, ptr @DynALUCount, align 8
  %31 = load i64, ptr @DynCastCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynCastCount, align 8
  br i1 %20, label %38, label %33

33:                                               ; preds = %7
  store ptr %18, ptr @heap_ptr, align 8, !tbaa !25
  %34 = load i64, ptr @DynMemWriteCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynMemWriteCount, align 8
  %36 = load i64, ptr @DynControlFlowCount, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr @DynControlFlowCount, align 8
  br label %38

38:                                               ; preds = %33, %7, %1
  %39 = phi ptr [ null, %1 ], [ %8, %33 ], [ null, %7 ]
  %40 = load i64, ptr @DynControlFlowCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynControlFlowCount, align 8
  ret ptr %39
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) local_unnamed_addr #16 {
  %3 = mul i64 %1, %0
  %4 = icmp eq i64 %3, 0
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  %7 = load i64, ptr @DynALUCount, align 8
  %8 = add i64 %7, 2
  store i64 %8, ptr @DynALUCount, align 8
  br i1 %4, label %46, label %9

9:                                                ; preds = %2
  %10 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 %3
  %12 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %13 = add i64 %12, %3
  %14 = ptrtoint ptr %11 to i64
  %15 = and i64 %14, 7
  %16 = icmp eq i64 %15, 0
  %17 = sub nuw nsw i64 8, %15
  %18 = select i1 %16, i64 0, i64 %17
  %19 = add i64 %13, %18
  %20 = getelementptr inbounds nuw i8, ptr %11, i64 %18
  store i64 %19, ptr @heap_requested, align 8, !tbaa !24
  %21 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %22 = icmp ugt ptr %20, %21
  %23 = load i64, ptr @DynMemReadCount, align 8
  %24 = add i64 %23, 3
  store i64 %24, ptr @DynMemReadCount, align 8
  %25 = load i64, ptr @DynMemWriteCount, align 8
  %26 = add i64 %25, 1
  store i64 %26, ptr @DynMemWriteCount, align 8
  %27 = load i64, ptr @DynAddressMathCount, align 8
  %28 = add i64 %27, 2
  store i64 %28, ptr @DynAddressMathCount, align 8
  %29 = load i64, ptr @DynControlFlowCount, align 8
  %30 = add i64 %29, 1
  store i64 %30, ptr @DynControlFlowCount, align 8
  %31 = load i64, ptr @DynALUCount, align 8
  %32 = add i64 %31, 6
  store i64 %32, ptr @DynALUCount, align 8
  %33 = load i64, ptr @DynCastCount, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr @DynCastCount, align 8
  br i1 %22, label %46, label %35

35:                                               ; preds = %9
  store ptr %20, ptr @heap_ptr, align 8, !tbaa !25
  %36 = icmp eq ptr %10, null
  %37 = load i64, ptr @DynMemWriteCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynMemWriteCount, align 8
  %39 = load i64, ptr @DynControlFlowCount, align 8
  %40 = add i64 %39, 1
  store i64 %40, ptr @DynControlFlowCount, align 8
  %41 = load i64, ptr @DynALUCount, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr @DynALUCount, align 8
  br i1 %36, label %46, label %43

43:                                               ; preds = %35
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %10, i8 0, i64 %3, i1 false)
  %44 = load i64, ptr @DynControlFlowCount, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr @DynControlFlowCount, align 8
  br label %46

46:                                               ; preds = %43, %35, %9, %2
  %47 = phi ptr [ null, %35 ], [ %10, %43 ], [ null, %2 ], [ null, %9 ]
  %48 = load i64, ptr @DynControlFlowCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynControlFlowCount, align 8
  ret ptr %47
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @realloc_beebs(ptr noundef readonly captures(address_is_null) %0, i64 noundef %1) local_unnamed_addr #10 {
  %3 = ptrtoint ptr %0 to i64
  %4 = icmp eq ptr %0, null
  %5 = icmp eq i64 %1, 0
  %6 = or i1 %4, %5
  %7 = load i64, ptr @DynControlFlowCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynControlFlowCount, align 8
  %9 = load i64, ptr @DynALUCount, align 8
  %10 = add i64 %9, 3
  store i64 %10, ptr @DynALUCount, align 8
  %11 = load i64, ptr @DynCastCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynCastCount, align 8
  br i1 %6, label %196, label %13

13:                                               ; preds = %2
  %14 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %15 = ptrtoint ptr %14 to i64
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 %1
  %17 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %18 = add i64 %17, %1
  %19 = ptrtoint ptr %16 to i64
  %20 = and i64 %19, 7
  %21 = icmp eq i64 %20, 0
  %22 = sub nuw nsw i64 8, %20
  %23 = select i1 %21, i64 0, i64 %22
  %24 = add i64 %18, %23
  %25 = getelementptr inbounds nuw i8, ptr %16, i64 %23
  store i64 %24, ptr @heap_requested, align 8, !tbaa !24
  %26 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %27 = icmp ugt ptr %25, %26
  %28 = load i64, ptr @DynMemReadCount, align 8
  %29 = add i64 %28, 3
  store i64 %29, ptr @DynMemReadCount, align 8
  %30 = load i64, ptr @DynMemWriteCount, align 8
  %31 = add i64 %30, 1
  store i64 %31, ptr @DynMemWriteCount, align 8
  %32 = load i64, ptr @DynAddressMathCount, align 8
  %33 = add i64 %32, 2
  store i64 %33, ptr @DynAddressMathCount, align 8
  %34 = load i64, ptr @DynControlFlowCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynControlFlowCount, align 8
  %36 = load i64, ptr @DynALUCount, align 8
  %37 = add i64 %36, 6
  store i64 %37, ptr @DynALUCount, align 8
  %38 = load i64, ptr @DynCastCount, align 8
  %39 = add i64 %38, 2
  store i64 %39, ptr @DynCastCount, align 8
  br i1 %27, label %196, label %40

40:                                               ; preds = %13
  store ptr %25, ptr @heap_ptr, align 8, !tbaa !25
  %41 = icmp eq ptr %14, null
  %42 = load i64, ptr @DynMemWriteCount, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr @DynMemWriteCount, align 8
  %44 = load i64, ptr @DynControlFlowCount, align 8
  %45 = add i64 %44, 1
  store i64 %45, ptr @DynControlFlowCount, align 8
  %46 = load i64, ptr @DynALUCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynALUCount, align 8
  br i1 %41, label %196, label %48

48:                                               ; preds = %40
  %49 = icmp ult i64 %1, 4
  %50 = sub i64 %15, %3
  %51 = icmp ult i64 %50, 32
  %52 = or i1 %49, %51
  %53 = load i64, ptr @DynControlFlowCount, align 8
  %54 = add i64 %53, 1
  store i64 %54, ptr @DynControlFlowCount, align 8
  %55 = load i64, ptr @DynALUCount, align 8
  %56 = add i64 %55, 4
  store i64 %56, ptr @DynALUCount, align 8
  br i1 %52, label %132, label %57

57:                                               ; preds = %48
  %58 = icmp ult i64 %1, 32
  %59 = load i64, ptr @DynControlFlowCount, align 8
  %60 = add i64 %59, 1
  store i64 %60, ptr @DynControlFlowCount, align 8
  %61 = load i64, ptr @DynALUCount, align 8
  %62 = add i64 %61, 1
  store i64 %62, ptr @DynALUCount, align 8
  br i1 %58, label %102, label %63

63:                                               ; preds = %57
  %64 = and i64 %1, 28
  %65 = and i64 %1, -32
  %66 = load i64, ptr @DynControlFlowCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynControlFlowCount, align 8
  %68 = load i64, ptr @DynALUCount, align 8
  %69 = add i64 %68, 2
  store i64 %69, ptr @DynALUCount, align 8
  br label %70

70:                                               ; preds = %70, %63
  %71 = phi i64 [ 0, %63 ], [ %78, %70 ]
  %72 = getelementptr inbounds nuw i8, ptr %0, i64 %71
  %73 = getelementptr inbounds nuw i8, ptr %72, i64 16
  %74 = load <16 x i8>, ptr %72, align 1, !tbaa !17
  %75 = load <16 x i8>, ptr %73, align 1, !tbaa !17
  %76 = getelementptr inbounds nuw i8, ptr %14, i64 %71
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 16
  store <16 x i8> %74, ptr %76, align 1, !tbaa !17
  store <16 x i8> %75, ptr %77, align 1, !tbaa !17
  %78 = add nuw i64 %71, 32
  %79 = icmp eq i64 %78, %65
  %80 = load i64, ptr @DynMemReadCount, align 8
  %81 = add i64 %80, 2
  store i64 %81, ptr @DynMemReadCount, align 8
  %82 = load i64, ptr @DynMemWriteCount, align 8
  %83 = add i64 %82, 2
  store i64 %83, ptr @DynMemWriteCount, align 8
  %84 = load i64, ptr @DynAddressMathCount, align 8
  %85 = add i64 %84, 4
  store i64 %85, ptr @DynAddressMathCount, align 8
  %86 = load i64, ptr @DynControlFlowCount, align 8
  %87 = add i64 %86, 1
  store i64 %87, ptr @DynControlFlowCount, align 8
  %88 = load i64, ptr @DynALUCount, align 8
  %89 = add i64 %88, 2
  store i64 %89, ptr @DynALUCount, align 8
  br i1 %79, label %90, label %70, !llvm.loop !27

90:                                               ; preds = %70
  %91 = icmp eq i64 %1, %65
  %92 = load i64, ptr @DynControlFlowCount, align 8
  %93 = add i64 %92, 1
  store i64 %93, ptr @DynControlFlowCount, align 8
  %94 = load i64, ptr @DynALUCount, align 8
  %95 = add i64 %94, 1
  store i64 %95, ptr @DynALUCount, align 8
  br i1 %91, label %196, label %96

96:                                               ; preds = %90
  %97 = icmp eq i64 %64, 0
  %98 = load i64, ptr @DynControlFlowCount, align 8
  %99 = add i64 %98, 1
  store i64 %99, ptr @DynControlFlowCount, align 8
  %100 = load i64, ptr @DynALUCount, align 8
  %101 = add i64 %100, 1
  store i64 %101, ptr @DynALUCount, align 8
  br i1 %97, label %132, label %102, !prof !30

102:                                              ; preds = %96, %57
  %103 = phi i64 [ %65, %96 ], [ 0, %57 ]
  %104 = and i64 %1, -4
  %105 = load i64, ptr @DynControlFlowCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynControlFlowCount, align 8
  %107 = load i64, ptr @DynALUCount, align 8
  %108 = add i64 %107, 1
  store i64 %108, ptr @DynALUCount, align 8
  br label %109

109:                                              ; preds = %109, %102
  %110 = phi i64 [ %103, %102 ], [ %114, %109 ]
  %111 = getelementptr inbounds nuw i8, ptr %0, i64 %110
  %112 = load <4 x i8>, ptr %111, align 1, !tbaa !17
  %113 = getelementptr inbounds nuw i8, ptr %14, i64 %110
  store <4 x i8> %112, ptr %113, align 1, !tbaa !17
  %114 = add nuw i64 %110, 4
  %115 = icmp eq i64 %114, %104
  %116 = load i64, ptr @DynMemReadCount, align 8
  %117 = add i64 %116, 1
  store i64 %117, ptr @DynMemReadCount, align 8
  %118 = load i64, ptr @DynMemWriteCount, align 8
  %119 = add i64 %118, 1
  store i64 %119, ptr @DynMemWriteCount, align 8
  %120 = load i64, ptr @DynAddressMathCount, align 8
  %121 = add i64 %120, 2
  store i64 %121, ptr @DynAddressMathCount, align 8
  %122 = load i64, ptr @DynControlFlowCount, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr @DynControlFlowCount, align 8
  %124 = load i64, ptr @DynALUCount, align 8
  %125 = add i64 %124, 2
  store i64 %125, ptr @DynALUCount, align 8
  br i1 %115, label %126, label %109, !llvm.loop !31

126:                                              ; preds = %109
  %127 = icmp eq i64 %1, %104
  %128 = load i64, ptr @DynControlFlowCount, align 8
  %129 = add i64 %128, 1
  store i64 %129, ptr @DynControlFlowCount, align 8
  %130 = load i64, ptr @DynALUCount, align 8
  %131 = add i64 %130, 1
  store i64 %131, ptr @DynALUCount, align 8
  br i1 %127, label %196, label %132

132:                                              ; preds = %126, %96, %48
  %133 = phi i64 [ 0, %48 ], [ %65, %96 ], [ %104, %126 ]
  %134 = and i64 %1, 3
  %135 = icmp eq i64 %134, 0
  %136 = load i64, ptr @DynControlFlowCount, align 8
  %137 = add i64 %136, 1
  store i64 %137, ptr @DynControlFlowCount, align 8
  %138 = load i64, ptr @DynALUCount, align 8
  %139 = add i64 %138, 2
  store i64 %139, ptr @DynALUCount, align 8
  br i1 %135, label %159, label %140

140:                                              ; preds = %140, %132
  %141 = phi i64 [ %146, %140 ], [ %133, %132 ]
  %142 = phi i64 [ %147, %140 ], [ 0, %132 ]
  %143 = getelementptr inbounds nuw i8, ptr %0, i64 %141
  %144 = load i8, ptr %143, align 1, !tbaa !17
  %145 = getelementptr inbounds nuw i8, ptr %14, i64 %141
  store i8 %144, ptr %145, align 1, !tbaa !17
  %146 = add nuw i64 %141, 1
  %147 = add i64 %142, 1
  %148 = icmp eq i64 %147, %134
  %149 = load i64, ptr @DynMemReadCount, align 8
  %150 = add i64 %149, 1
  store i64 %150, ptr @DynMemReadCount, align 8
  %151 = load i64, ptr @DynMemWriteCount, align 8
  %152 = add i64 %151, 1
  store i64 %152, ptr @DynMemWriteCount, align 8
  %153 = load i64, ptr @DynAddressMathCount, align 8
  %154 = add i64 %153, 2
  store i64 %154, ptr @DynAddressMathCount, align 8
  %155 = load i64, ptr @DynControlFlowCount, align 8
  %156 = add i64 %155, 1
  store i64 %156, ptr @DynControlFlowCount, align 8
  %157 = load i64, ptr @DynALUCount, align 8
  %158 = add i64 %157, 3
  store i64 %158, ptr @DynALUCount, align 8
  br i1 %148, label %159, label %140, !llvm.loop !32

159:                                              ; preds = %140, %132
  %160 = phi i64 [ %133, %132 ], [ %146, %140 ]
  %161 = sub i64 %133, %1
  %162 = icmp ugt i64 %161, -4
  %163 = load i64, ptr @DynControlFlowCount, align 8
  %164 = add i64 %163, 1
  store i64 %164, ptr @DynControlFlowCount, align 8
  %165 = load i64, ptr @DynALUCount, align 8
  %166 = add i64 %165, 2
  store i64 %166, ptr @DynALUCount, align 8
  br i1 %162, label %196, label %167

167:                                              ; preds = %167, %159
  %168 = phi i64 [ %184, %167 ], [ %160, %159 ]
  %169 = getelementptr inbounds nuw i8, ptr %0, i64 %168
  %170 = load i8, ptr %169, align 1, !tbaa !17
  %171 = getelementptr inbounds nuw i8, ptr %14, i64 %168
  store i8 %170, ptr %171, align 1, !tbaa !17
  %172 = add nuw i64 %168, 1
  %173 = getelementptr inbounds nuw i8, ptr %0, i64 %172
  %174 = load i8, ptr %173, align 1, !tbaa !17
  %175 = getelementptr inbounds nuw i8, ptr %14, i64 %172
  store i8 %174, ptr %175, align 1, !tbaa !17
  %176 = add nuw i64 %168, 2
  %177 = getelementptr inbounds nuw i8, ptr %0, i64 %176
  %178 = load i8, ptr %177, align 1, !tbaa !17
  %179 = getelementptr inbounds nuw i8, ptr %14, i64 %176
  store i8 %178, ptr %179, align 1, !tbaa !17
  %180 = add nuw i64 %168, 3
  %181 = getelementptr inbounds nuw i8, ptr %0, i64 %180
  %182 = load i8, ptr %181, align 1, !tbaa !17
  %183 = getelementptr inbounds nuw i8, ptr %14, i64 %180
  store i8 %182, ptr %183, align 1, !tbaa !17
  %184 = add nuw i64 %168, 4
  %185 = icmp eq i64 %184, %1
  %186 = load i64, ptr @DynMemReadCount, align 8
  %187 = add i64 %186, 4
  store i64 %187, ptr @DynMemReadCount, align 8
  %188 = load i64, ptr @DynMemWriteCount, align 8
  %189 = add i64 %188, 4
  store i64 %189, ptr @DynMemWriteCount, align 8
  %190 = load i64, ptr @DynAddressMathCount, align 8
  %191 = add i64 %190, 8
  store i64 %191, ptr @DynAddressMathCount, align 8
  %192 = load i64, ptr @DynControlFlowCount, align 8
  %193 = add i64 %192, 1
  store i64 %193, ptr @DynControlFlowCount, align 8
  %194 = load i64, ptr @DynALUCount, align 8
  %195 = add i64 %194, 5
  store i64 %195, ptr @DynALUCount, align 8
  br i1 %185, label %196, label %167, !llvm.loop !34

196:                                              ; preds = %167, %159, %126, %90, %40, %13, %2
  %197 = phi ptr [ null, %2 ], [ null, %13 ], [ null, %40 ], [ %14, %90 ], [ %14, %126 ], [ %14, %167 ], [ %14, %159 ]
  %198 = load i64, ptr @DynControlFlowCount, align 8
  %199 = add i64 %198, 1
  store i64 %199, ptr @DynControlFlowCount, align 8
  ret ptr %197
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
