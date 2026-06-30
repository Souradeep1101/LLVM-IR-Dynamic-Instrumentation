; ModuleID = 'llvm-link'
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

; Function Attrs: nounwind sspstrong uwtable
define dso_local range(i32 0, 2) i32 @main(i32 %0, ptr readnone captures(none) %1) #0 {
  %3 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  tail call void @initialise_board() #17
  tail call void @initialise_benchmark() #17
  tail call void @warm_caches(i32 noundef 1) #17
  tail call void @start_trigger() #17
  br label %9

4:                                                ; preds = %9
  tail call void @stop_trigger() #17
  %5 = load volatile i32, ptr %3, align 4, !tbaa !1
  %6 = tail call i32 @verify_benchmark(i32 noundef %5) #17
  %7 = icmp eq i32 %6, 0
  %8 = zext i1 %7 to i32
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  ret i32 %8

9:                                                ; preds = %9, %2
  %10 = phi i32 [ 0, %2 ], [ %13, %9 ]
  %11 = tail call i32 @benchmark() #17
  store volatile i32 %11, ptr %3, align 4, !tbaa !1
  %12 = load volatile i32, ptr %3, align 4, !tbaa !1
  tail call void asm sideeffect "", "r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 %12) #17, !srcloc !9
  %13 = add nuw nsw i32 %10, 1
  %14 = icmp eq i32 %13, 10000
  br i1 %14, label %4, label %9, !llvm.loop !10
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
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @sha256_update(ptr noundef captures(none) %0, i64 noundef %1, ptr noundef readonly captures(none) %2) #3 {
  %4 = getelementptr inbounds nuw i8, ptr %0, i64 104
  %5 = load i32, ptr %4, align 8, !tbaa !15
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %24, label %7

7:                                                ; preds = %3
  %8 = zext i32 %5 to i64
  %9 = sub i32 64, %5
  %10 = zext i32 %9 to i64
  %11 = icmp ult i64 %1, %10
  %12 = getelementptr inbounds nuw i8, ptr %0, i64 40
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 %8
  br i1 %11, label %20, label %14

14:                                               ; preds = %7
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %13, ptr align 1 %2, i64 %10, i1 false)
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %12, ptr noundef nonnull @K)
  %15 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %16 = load i64, ptr %15, align 8, !tbaa !12
  %17 = add i64 %16, 1
  store i64 %17, ptr %15, align 8, !tbaa !12
  %18 = getelementptr inbounds nuw i8, ptr %2, i64 %10
  %19 = sub nuw i64 %1, %10
  br label %24

20:                                               ; preds = %7
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 1 %13, ptr align 1 %2, i64 %1, i1 false)
  %21 = load i32, ptr %4, align 8, !tbaa !15
  %22 = trunc nuw i64 %1 to i32
  %23 = add i32 %21, %22
  br label %43

24:                                               ; preds = %14, %3
  %25 = phi ptr [ %18, %14 ], [ %2, %3 ]
  %26 = phi i64 [ %19, %14 ], [ %1, %3 ]
  %27 = icmp ugt i64 %26, 63
  br i1 %27, label %28, label %38

28:                                               ; preds = %24
  %29 = getelementptr inbounds nuw i8, ptr %0, i64 32
  br label %30

30:                                               ; preds = %30, %28
  %31 = phi i64 [ %26, %28 ], [ %36, %30 ]
  %32 = phi ptr [ %25, %28 ], [ %35, %30 ]
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef %32, ptr noundef nonnull @K)
  %33 = load i64, ptr %29, align 8, !tbaa !12
  %34 = add i64 %33, 1
  store i64 %34, ptr %29, align 8, !tbaa !12
  %35 = getelementptr inbounds nuw i8, ptr %32, i64 64
  %36 = add i64 %31, -64
  %37 = icmp ugt i64 %36, 63
  br i1 %37, label %30, label %38, !llvm.loop !16

38:                                               ; preds = %30, %24
  %39 = phi ptr [ %25, %24 ], [ %35, %30 ]
  %40 = phi i64 [ %26, %24 ], [ %36, %30 ]
  %41 = getelementptr inbounds nuw i8, ptr %0, i64 40
  tail call void @llvm.memcpy.p0.p0.i64(ptr nonnull align 8 %41, ptr align 1 %39, i64 %40, i1 false)
  %42 = trunc nuw nsw i64 %40 to i32
  br label %43

43:                                               ; preds = %38, %20
  %44 = phi i32 [ %23, %20 ], [ %42, %38 ]
  store i32 %44, ptr %4, align 8, !tbaa !15
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @sha256_digest(ptr noundef captures(none) %0, i64 noundef %1, ptr noundef writeonly captures(none) %2) #3 {
  %4 = icmp ult i64 %1, 33
  br i1 %4, label %6, label %5

5:                                                ; preds = %5, %3
  br label %5

6:                                                ; preds = %3
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 104
  %8 = load i32, ptr %7, align 8, !tbaa !15
  %9 = icmp ult i32 %8, 64
  br i1 %9, label %11, label %10

10:                                               ; preds = %10, %6
  br label %10

11:                                               ; preds = %6
  %12 = zext nneg i32 %8 to i64
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 40
  %14 = add nuw nsw i32 %8, 1
  %15 = getelementptr inbounds nuw i8, ptr %13, i64 %12
  store i8 -128, ptr %15, align 1, !tbaa !17
  %16 = icmp samesign ugt i32 %8, 55
  br i1 %16, label %17, label %21

17:                                               ; preds = %11
  %18 = zext nneg i32 %14 to i64
  %19 = getelementptr inbounds nuw i8, ptr %13, i64 %18
  %20 = sub nuw nsw i64 64, %18
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %19, i8 0, i64 %20, i1 false)
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %13, ptr noundef nonnull @K)
  br label %21

21:                                               ; preds = %17, %11
  %22 = phi i32 [ 0, %17 ], [ %14, %11 ]
  %23 = zext nneg i32 %22 to i64
  %24 = getelementptr inbounds nuw i8, ptr %13, i64 %23
  %25 = sub nuw nsw i64 56, %23
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %24, i8 0, i64 %25, i1 false)
  %26 = getelementptr inbounds nuw i8, ptr %0, i64 32
  %27 = load i64, ptr %26, align 8, !tbaa !12
  %28 = shl i64 %27, 9
  %29 = load i32, ptr %7, align 8, !tbaa !15
  %30 = shl i32 %29, 3
  %31 = zext i32 %30 to i64
  %32 = or i64 %28, %31
  %33 = lshr i64 %28, 56
  %34 = trunc nuw i64 %33 to i8
  %35 = getelementptr inbounds nuw i8, ptr %0, i64 96
  store i8 %34, ptr %35, align 8, !tbaa !17
  %36 = lshr i64 %28, 48
  %37 = trunc i64 %36 to i8
  %38 = getelementptr inbounds nuw i8, ptr %0, i64 97
  store i8 %37, ptr %38, align 1, !tbaa !17
  %39 = lshr i64 %28, 40
  %40 = trunc i64 %39 to i8
  %41 = getelementptr inbounds nuw i8, ptr %0, i64 98
  store i8 %40, ptr %41, align 2, !tbaa !17
  %42 = lshr i64 %28, 32
  %43 = trunc i64 %42 to i8
  %44 = getelementptr inbounds nuw i8, ptr %0, i64 99
  store i8 %43, ptr %44, align 1, !tbaa !17
  %45 = lshr i64 %32, 24
  %46 = trunc i64 %45 to i8
  %47 = getelementptr inbounds nuw i8, ptr %0, i64 100
  store i8 %46, ptr %47, align 4, !tbaa !17
  %48 = lshr i64 %32, 16
  %49 = trunc i64 %48 to i8
  %50 = getelementptr inbounds nuw i8, ptr %0, i64 101
  store i8 %49, ptr %50, align 1, !tbaa !17
  %51 = lshr i64 %32, 8
  %52 = trunc i64 %51 to i8
  %53 = getelementptr inbounds nuw i8, ptr %0, i64 102
  store i8 %52, ptr %53, align 2, !tbaa !17
  %54 = trunc i32 %30 to i8
  %55 = getelementptr inbounds nuw i8, ptr %0, i64 103
  store i8 %54, ptr %55, align 1, !tbaa !17
  tail call void @_nettle_sha256_compress(ptr noundef nonnull %0, ptr noundef nonnull %13, ptr noundef nonnull @K)
  %56 = lshr i64 %1, 2
  %57 = trunc nuw nsw i64 %1 to i32
  %58 = and i32 %57, 3
  %59 = icmp eq i64 %56, 0
  br i1 %59, label %127, label %60

60:                                               ; preds = %21
  %61 = and i64 %56, 1
  %62 = icmp eq i64 %56, 1
  br i1 %62, label %107, label %63

63:                                               ; preds = %60
  %64 = and i64 %56, 14
  br label %65

65:                                               ; preds = %65, %63
  %66 = phi ptr [ %2, %63 ], [ %102, %65 ]
  %67 = phi i64 [ 0, %63 ], [ %101, %65 ]
  %68 = phi i64 [ 0, %63 ], [ %103, %65 ]
  %69 = getelementptr inbounds nuw i32, ptr %0, i64 %67
  %70 = load i32, ptr %69, align 4, !tbaa !1
  %71 = lshr i32 %70, 24
  %72 = trunc nuw i32 %71 to i8
  store i8 %72, ptr %66, align 1, !tbaa !17
  %73 = load i32, ptr %69, align 4, !tbaa !1
  %74 = lshr i32 %73, 16
  %75 = trunc i32 %74 to i8
  %76 = getelementptr inbounds nuw i8, ptr %66, i64 1
  store i8 %75, ptr %76, align 1, !tbaa !17
  %77 = load i32, ptr %69, align 4, !tbaa !1
  %78 = lshr i32 %77, 8
  %79 = trunc i32 %78 to i8
  %80 = getelementptr inbounds nuw i8, ptr %66, i64 2
  store i8 %79, ptr %80, align 1, !tbaa !17
  %81 = load i32, ptr %69, align 4, !tbaa !1
  %82 = trunc i32 %81 to i8
  %83 = getelementptr inbounds nuw i8, ptr %66, i64 3
  store i8 %82, ptr %83, align 1, !tbaa !17
  %84 = getelementptr inbounds nuw i8, ptr %66, i64 4
  %85 = getelementptr inbounds nuw i32, ptr %0, i64 %67
  %86 = getelementptr inbounds nuw i8, ptr %85, i64 4
  %87 = load i32, ptr %86, align 4, !tbaa !1
  %88 = lshr i32 %87, 24
  %89 = trunc nuw i32 %88 to i8
  store i8 %89, ptr %84, align 1, !tbaa !17
  %90 = load i32, ptr %86, align 4, !tbaa !1
  %91 = lshr i32 %90, 16
  %92 = trunc i32 %91 to i8
  %93 = getelementptr inbounds nuw i8, ptr %66, i64 5
  store i8 %92, ptr %93, align 1, !tbaa !17
  %94 = load i32, ptr %86, align 4, !tbaa !1
  %95 = lshr i32 %94, 8
  %96 = trunc i32 %95 to i8
  %97 = getelementptr inbounds nuw i8, ptr %66, i64 6
  store i8 %96, ptr %97, align 1, !tbaa !17
  %98 = load i32, ptr %86, align 4, !tbaa !1
  %99 = trunc i32 %98 to i8
  %100 = getelementptr inbounds nuw i8, ptr %66, i64 7
  store i8 %99, ptr %100, align 1, !tbaa !17
  %101 = add nuw nsw i64 %67, 2
  %102 = getelementptr inbounds nuw i8, ptr %66, i64 8
  %103 = add i64 %68, 2
  %104 = icmp eq i64 %103, %64
  br i1 %104, label %105, label %65, !llvm.loop !18

105:                                              ; preds = %65
  %106 = icmp eq i64 %61, 0
  br i1 %106, label %127, label %107

107:                                              ; preds = %105, %60
  %108 = phi ptr [ %2, %60 ], [ %102, %105 ]
  %109 = phi i64 [ 0, %60 ], [ %101, %105 ]
  %110 = icmp ne i64 %61, 0
  tail call void @llvm.assume(i1 %110)
  %111 = getelementptr inbounds nuw i32, ptr %0, i64 %109
  %112 = load i32, ptr %111, align 4, !tbaa !1
  %113 = lshr i32 %112, 24
  %114 = trunc nuw i32 %113 to i8
  store i8 %114, ptr %108, align 1, !tbaa !17
  %115 = load i32, ptr %111, align 4, !tbaa !1
  %116 = lshr i32 %115, 16
  %117 = trunc i32 %116 to i8
  %118 = getelementptr inbounds nuw i8, ptr %108, i64 1
  store i8 %117, ptr %118, align 1, !tbaa !17
  %119 = load i32, ptr %111, align 4, !tbaa !1
  %120 = lshr i32 %119, 8
  %121 = trunc i32 %120 to i8
  %122 = getelementptr inbounds nuw i8, ptr %108, i64 2
  store i8 %121, ptr %122, align 1, !tbaa !17
  %123 = load i32, ptr %111, align 4, !tbaa !1
  %124 = trunc i32 %123 to i8
  %125 = getelementptr inbounds nuw i8, ptr %108, i64 3
  store i8 %124, ptr %125, align 1, !tbaa !17
  %126 = getelementptr inbounds nuw i8, ptr %108, i64 4
  br label %127

127:                                              ; preds = %107, %105, %21
  %128 = phi ptr [ %2, %21 ], [ %102, %105 ], [ %126, %107 ]
  %129 = icmp eq i32 %58, 0
  br i1 %129, label %147, label %130

130:                                              ; preds = %127
  %131 = getelementptr inbounds nuw i32, ptr %0, i64 %56
  %132 = load i32, ptr %131, align 4, !tbaa !1
  switch i32 %58, label %133 [
    i32 3, label %134
    i32 2, label %140
    i32 1, label %144
  ]

133:                                              ; preds = %130
  unreachable

134:                                              ; preds = %130
  %135 = lshr i32 %132, 8
  %136 = trunc i32 %135 to i8
  %137 = and i64 %1, 3
  %138 = getelementptr i8, ptr %128, i64 %137
  %139 = getelementptr i8, ptr %138, i64 -1
  store i8 %136, ptr %139, align 1, !tbaa !17
  br label %140

140:                                              ; preds = %134, %130
  %141 = lshr i32 %132, 16
  %142 = trunc i32 %141 to i8
  %143 = getelementptr inbounds nuw i8, ptr %128, i64 1
  store i8 %142, ptr %143, align 1, !tbaa !17
  br label %144

144:                                              ; preds = %140, %130
  %145 = lshr i32 %132, 24
  %146 = trunc nuw i32 %145 to i8
  store i8 %146, ptr %128, align 1, !tbaa !17
  br label %147

147:                                              ; preds = %144, %127
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %0, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  store i64 0, ptr %26, align 8, !tbaa !12
  store i32 0, ptr %7, align 8, !tbaa !15
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #4

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @_nettle_sha256_compress(ptr noundef captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef readonly captures(none) %2) local_unnamed_addr #3 {
  %4 = alloca [16 x i32], align 16
  call void @llvm.lifetime.start.p0(ptr nonnull %4) #17
  br label %5

5:                                                ; preds = %5, %3
  %6 = phi i64 [ 0, %3 ], [ %46, %5 ]
  %7 = phi ptr [ %1, %3 ], [ %47, %5 ]
  %8 = load i8, ptr %7, align 1, !tbaa !17
  %9 = zext i8 %8 to i32
  %10 = shl nuw i32 %9, 24
  %11 = getelementptr inbounds nuw i8, ptr %7, i64 1
  %12 = load i8, ptr %11, align 1, !tbaa !17
  %13 = zext i8 %12 to i32
  %14 = shl nuw nsw i32 %13, 16
  %15 = or disjoint i32 %14, %10
  %16 = getelementptr inbounds nuw i8, ptr %7, i64 2
  %17 = load i8, ptr %16, align 1, !tbaa !17
  %18 = zext i8 %17 to i32
  %19 = shl nuw nsw i32 %18, 8
  %20 = or disjoint i32 %15, %19
  %21 = getelementptr inbounds nuw i8, ptr %7, i64 3
  %22 = load i8, ptr %21, align 1, !tbaa !17
  %23 = zext i8 %22 to i32
  %24 = or disjoint i32 %20, %23
  %25 = getelementptr inbounds nuw i32, ptr %4, i64 %6
  store i32 %24, ptr %25, align 8, !tbaa !1
  %26 = getelementptr inbounds nuw i8, ptr %7, i64 4
  %27 = load i8, ptr %26, align 1, !tbaa !17
  %28 = zext i8 %27 to i32
  %29 = shl nuw i32 %28, 24
  %30 = getelementptr inbounds nuw i8, ptr %7, i64 5
  %31 = load i8, ptr %30, align 1, !tbaa !17
  %32 = zext i8 %31 to i32
  %33 = shl nuw nsw i32 %32, 16
  %34 = or disjoint i32 %33, %29
  %35 = getelementptr inbounds nuw i8, ptr %7, i64 6
  %36 = load i8, ptr %35, align 1, !tbaa !17
  %37 = zext i8 %36 to i32
  %38 = shl nuw nsw i32 %37, 8
  %39 = or disjoint i32 %34, %38
  %40 = getelementptr inbounds nuw i8, ptr %7, i64 7
  %41 = load i8, ptr %40, align 1, !tbaa !17
  %42 = zext i8 %41 to i32
  %43 = or disjoint i32 %39, %42
  %44 = getelementptr inbounds nuw i32, ptr %4, i64 %6
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 4
  store i32 %43, ptr %45, align 4, !tbaa !1
  %46 = add nuw nsw i64 %6, 2
  %47 = getelementptr inbounds nuw i8, ptr %7, i64 8
  %48 = icmp eq i64 %46, 16
  br i1 %48, label %49, label %5, !llvm.loop !19

49:                                               ; preds = %5
  %50 = load i32, ptr %0, align 4, !tbaa !1
  %51 = getelementptr inbounds nuw i8, ptr %0, i64 4
  %52 = load i32, ptr %51, align 4, !tbaa !1
  %53 = getelementptr inbounds nuw i8, ptr %0, i64 8
  %54 = load i32, ptr %53, align 4, !tbaa !1
  %55 = getelementptr inbounds nuw i8, ptr %0, i64 12
  %56 = load i32, ptr %55, align 4, !tbaa !1
  %57 = getelementptr inbounds nuw i8, ptr %0, i64 16
  %58 = load i32, ptr %57, align 4, !tbaa !1
  %59 = getelementptr inbounds nuw i8, ptr %0, i64 20
  %60 = load i32, ptr %59, align 4, !tbaa !1
  %61 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %62 = load i32, ptr %61, align 4, !tbaa !1
  %63 = getelementptr inbounds nuw i8, ptr %0, i64 28
  %64 = load i32, ptr %63, align 4, !tbaa !1
  br label %97

65:                                               ; preds = %97
  %66 = load i32, ptr %4, align 16
  %67 = getelementptr inbounds nuw i8, ptr %4, i64 56
  %68 = getelementptr inbounds nuw i8, ptr %4, i64 36
  %69 = getelementptr inbounds nuw i8, ptr %4, i64 4
  %70 = getelementptr inbounds nuw i8, ptr %4, i64 60
  %71 = getelementptr inbounds nuw i8, ptr %4, i64 40
  %72 = getelementptr inbounds nuw i8, ptr %4, i64 8
  %73 = getelementptr inbounds nuw i8, ptr %4, i64 44
  %74 = getelementptr inbounds nuw i8, ptr %4, i64 12
  %75 = getelementptr inbounds nuw i8, ptr %4, i64 48
  %76 = getelementptr inbounds nuw i8, ptr %4, i64 16
  %77 = getelementptr inbounds nuw i8, ptr %4, i64 52
  %78 = getelementptr inbounds nuw i8, ptr %4, i64 20
  %79 = getelementptr inbounds nuw i8, ptr %4, i64 24
  %80 = getelementptr inbounds nuw i8, ptr %4, i64 28
  %81 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %82 = load i32, ptr %67, align 8, !tbaa !1
  %83 = load i32, ptr %68, align 4, !tbaa !1
  %84 = load i32, ptr %69, align 4, !tbaa !1
  %85 = load i32, ptr %70, align 4, !tbaa !1
  %86 = load i32, ptr %71, align 8, !tbaa !1
  %87 = load i32, ptr %72, align 8, !tbaa !1
  %88 = load i32, ptr %73, align 4, !tbaa !1
  %89 = load i32, ptr %74, align 4, !tbaa !1
  %90 = load i32, ptr %75, align 16, !tbaa !1
  %91 = load i32, ptr %76, align 16, !tbaa !1
  %92 = load i32, ptr %77, align 4, !tbaa !1
  %93 = load i32, ptr %78, align 4, !tbaa !1
  %94 = load i32, ptr %79, align 8, !tbaa !1
  %95 = load i32, ptr %80, align 4, !tbaa !1
  %96 = load i32, ptr %81, align 16, !tbaa !1
  br label %333

97:                                               ; preds = %97, %49
  %98 = phi ptr [ %4, %49 ], [ %332, %97 ]
  %99 = phi i1 [ true, %49 ], [ false, %97 ]
  %100 = phi i32 [ %64, %49 ], [ %235, %97 ]
  %101 = phi i32 [ %62, %49 ], [ %263, %97 ]
  %102 = phi i32 [ %60, %49 ], [ %291, %97 ]
  %103 = phi i32 [ %58, %49 ], [ %319, %97 ]
  %104 = phi i32 [ %56, %49 ], [ %246, %97 ]
  %105 = phi i32 [ %54, %49 ], [ %274, %97 ]
  %106 = phi i32 [ %52, %49 ], [ %302, %97 ]
  %107 = phi i32 [ %50, %49 ], [ %330, %97 ]
  %108 = phi ptr [ %2, %49 ], [ %331, %97 ]
  %109 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %103, i32 26)
  %110 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %103, i32 21)
  %111 = xor i32 %109, %110
  %112 = tail call i32 @llvm.fshl.i32(i32 %103, i32 %103, i32 7)
  %113 = xor i32 %111, %112
  %114 = xor i32 %101, %102
  %115 = and i32 %114, %103
  %116 = xor i32 %115, %101
  %117 = load i32, ptr %108, align 4, !tbaa !1
  %118 = load i32, ptr %98, align 4, !tbaa !1
  %119 = add i32 %100, %113
  %120 = add i32 %119, %116
  %121 = add i32 %120, %117
  %122 = add i32 %121, %118
  %123 = add i32 %122, %104
  %124 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 30)
  %125 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 19)
  %126 = xor i32 %124, %125
  %127 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %107, i32 10)
  %128 = xor i32 %126, %127
  %129 = and i32 %106, %107
  %130 = xor i32 %106, %107
  %131 = and i32 %105, %130
  %132 = xor i32 %131, %129
  %133 = add i32 %132, %128
  %134 = add i32 %133, %122
  %135 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %123, i32 26)
  %136 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %123, i32 21)
  %137 = xor i32 %135, %136
  %138 = tail call i32 @llvm.fshl.i32(i32 %123, i32 %123, i32 7)
  %139 = xor i32 %137, %138
  %140 = xor i32 %102, %103
  %141 = and i32 %123, %140
  %142 = xor i32 %141, %102
  %143 = getelementptr inbounds nuw i8, ptr %108, i64 4
  %144 = load i32, ptr %143, align 4, !tbaa !1
  %145 = getelementptr inbounds nuw i8, ptr %98, i64 4
  %146 = load i32, ptr %145, align 4, !tbaa !1
  %147 = add i32 %144, %101
  %148 = add i32 %147, %146
  %149 = add i32 %148, %142
  %150 = add i32 %149, %139
  %151 = add i32 %150, %105
  %152 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 30)
  %153 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 19)
  %154 = xor i32 %152, %153
  %155 = tail call i32 @llvm.fshl.i32(i32 %134, i32 %134, i32 10)
  %156 = xor i32 %154, %155
  %157 = and i32 %134, %107
  %158 = xor i32 %134, %107
  %159 = and i32 %158, %106
  %160 = xor i32 %159, %157
  %161 = add i32 %156, %160
  %162 = add i32 %161, %150
  %163 = tail call i32 @llvm.fshl.i32(i32 %151, i32 %151, i32 26)
  %164 = tail call i32 @llvm.fshl.i32(i32 %151, i32 %151, i32 21)
  %165 = xor i32 %163, %164
  %166 = tail call i32 @llvm.fshl.i32(i32 %151, i32 %151, i32 7)
  %167 = xor i32 %165, %166
  %168 = xor i32 %123, %103
  %169 = and i32 %151, %168
  %170 = xor i32 %169, %103
  %171 = getelementptr inbounds nuw i8, ptr %108, i64 8
  %172 = load i32, ptr %171, align 4, !tbaa !1
  %173 = getelementptr inbounds nuw i8, ptr %98, i64 8
  %174 = load i32, ptr %173, align 4, !tbaa !1
  %175 = add i32 %172, %102
  %176 = add i32 %175, %174
  %177 = add i32 %176, %170
  %178 = add i32 %177, %167
  %179 = add i32 %178, %106
  %180 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 30)
  %181 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 19)
  %182 = xor i32 %180, %181
  %183 = tail call i32 @llvm.fshl.i32(i32 %162, i32 %162, i32 10)
  %184 = xor i32 %182, %183
  %185 = and i32 %162, %134
  %186 = xor i32 %162, %134
  %187 = and i32 %186, %107
  %188 = xor i32 %187, %185
  %189 = add i32 %184, %188
  %190 = add i32 %189, %178
  %191 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %179, i32 26)
  %192 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %179, i32 21)
  %193 = xor i32 %191, %192
  %194 = tail call i32 @llvm.fshl.i32(i32 %179, i32 %179, i32 7)
  %195 = xor i32 %193, %194
  %196 = xor i32 %151, %123
  %197 = and i32 %179, %196
  %198 = xor i32 %197, %123
  %199 = getelementptr inbounds nuw i8, ptr %108, i64 12
  %200 = load i32, ptr %199, align 4, !tbaa !1
  %201 = getelementptr inbounds nuw i8, ptr %98, i64 12
  %202 = load i32, ptr %201, align 4, !tbaa !1
  %203 = add i32 %200, %103
  %204 = add i32 %203, %202
  %205 = add i32 %204, %198
  %206 = add i32 %205, %195
  %207 = add i32 %206, %107
  %208 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 30)
  %209 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 19)
  %210 = xor i32 %208, %209
  %211 = tail call i32 @llvm.fshl.i32(i32 %190, i32 %190, i32 10)
  %212 = xor i32 %210, %211
  %213 = and i32 %190, %162
  %214 = xor i32 %190, %162
  %215 = and i32 %214, %134
  %216 = xor i32 %215, %213
  %217 = add i32 %212, %216
  %218 = add i32 %217, %206
  %219 = tail call i32 @llvm.fshl.i32(i32 %207, i32 %207, i32 26)
  %220 = tail call i32 @llvm.fshl.i32(i32 %207, i32 %207, i32 21)
  %221 = xor i32 %219, %220
  %222 = tail call i32 @llvm.fshl.i32(i32 %207, i32 %207, i32 7)
  %223 = xor i32 %221, %222
  %224 = xor i32 %179, %151
  %225 = and i32 %207, %224
  %226 = xor i32 %225, %151
  %227 = getelementptr inbounds nuw i8, ptr %108, i64 16
  %228 = load i32, ptr %227, align 4, !tbaa !1
  %229 = getelementptr inbounds nuw i8, ptr %98, i64 16
  %230 = load i32, ptr %229, align 4, !tbaa !1
  %231 = add i32 %228, %123
  %232 = add i32 %231, %230
  %233 = add i32 %232, %226
  %234 = add i32 %233, %223
  %235 = add i32 %234, %134
  %236 = tail call i32 @llvm.fshl.i32(i32 %218, i32 %218, i32 30)
  %237 = tail call i32 @llvm.fshl.i32(i32 %218, i32 %218, i32 19)
  %238 = xor i32 %236, %237
  %239 = tail call i32 @llvm.fshl.i32(i32 %218, i32 %218, i32 10)
  %240 = xor i32 %238, %239
  %241 = and i32 %218, %190
  %242 = xor i32 %218, %190
  %243 = and i32 %242, %162
  %244 = xor i32 %243, %241
  %245 = add i32 %240, %244
  %246 = add i32 %245, %234
  %247 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %235, i32 26)
  %248 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %235, i32 21)
  %249 = xor i32 %247, %248
  %250 = tail call i32 @llvm.fshl.i32(i32 %235, i32 %235, i32 7)
  %251 = xor i32 %249, %250
  %252 = xor i32 %207, %179
  %253 = and i32 %235, %252
  %254 = xor i32 %253, %179
  %255 = getelementptr inbounds nuw i8, ptr %108, i64 20
  %256 = load i32, ptr %255, align 4, !tbaa !1
  %257 = getelementptr inbounds nuw i8, ptr %98, i64 20
  %258 = load i32, ptr %257, align 4, !tbaa !1
  %259 = add i32 %258, %256
  %260 = add i32 %259, %151
  %261 = add i32 %260, %254
  %262 = add i32 %261, %251
  %263 = add i32 %262, %162
  %264 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %246, i32 30)
  %265 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %246, i32 19)
  %266 = xor i32 %264, %265
  %267 = tail call i32 @llvm.fshl.i32(i32 %246, i32 %246, i32 10)
  %268 = xor i32 %266, %267
  %269 = and i32 %246, %218
  %270 = xor i32 %246, %218
  %271 = and i32 %270, %190
  %272 = xor i32 %271, %269
  %273 = add i32 %268, %272
  %274 = add i32 %273, %262
  %275 = tail call i32 @llvm.fshl.i32(i32 %263, i32 %263, i32 26)
  %276 = tail call i32 @llvm.fshl.i32(i32 %263, i32 %263, i32 21)
  %277 = xor i32 %275, %276
  %278 = tail call i32 @llvm.fshl.i32(i32 %263, i32 %263, i32 7)
  %279 = xor i32 %277, %278
  %280 = xor i32 %235, %207
  %281 = and i32 %263, %280
  %282 = xor i32 %281, %207
  %283 = getelementptr inbounds nuw i8, ptr %108, i64 24
  %284 = load i32, ptr %283, align 4, !tbaa !1
  %285 = getelementptr inbounds nuw i8, ptr %98, i64 24
  %286 = load i32, ptr %285, align 4, !tbaa !1
  %287 = add i32 %286, %284
  %288 = add i32 %287, %179
  %289 = add i32 %288, %282
  %290 = add i32 %289, %279
  %291 = add i32 %290, %190
  %292 = tail call i32 @llvm.fshl.i32(i32 %274, i32 %274, i32 30)
  %293 = tail call i32 @llvm.fshl.i32(i32 %274, i32 %274, i32 19)
  %294 = xor i32 %292, %293
  %295 = tail call i32 @llvm.fshl.i32(i32 %274, i32 %274, i32 10)
  %296 = xor i32 %294, %295
  %297 = and i32 %274, %246
  %298 = xor i32 %274, %246
  %299 = and i32 %298, %218
  %300 = xor i32 %299, %297
  %301 = add i32 %296, %300
  %302 = add i32 %301, %290
  %303 = tail call i32 @llvm.fshl.i32(i32 %291, i32 %291, i32 26)
  %304 = tail call i32 @llvm.fshl.i32(i32 %291, i32 %291, i32 21)
  %305 = xor i32 %303, %304
  %306 = tail call i32 @llvm.fshl.i32(i32 %291, i32 %291, i32 7)
  %307 = xor i32 %305, %306
  %308 = xor i32 %263, %235
  %309 = and i32 %291, %308
  %310 = xor i32 %309, %235
  %311 = getelementptr inbounds nuw i8, ptr %108, i64 28
  %312 = load i32, ptr %311, align 4, !tbaa !1
  %313 = getelementptr inbounds nuw i8, ptr %98, i64 28
  %314 = load i32, ptr %313, align 4, !tbaa !1
  %315 = add i32 %314, %312
  %316 = add i32 %315, %207
  %317 = add i32 %316, %310
  %318 = add i32 %317, %307
  %319 = add i32 %318, %218
  %320 = tail call i32 @llvm.fshl.i32(i32 %302, i32 %302, i32 30)
  %321 = tail call i32 @llvm.fshl.i32(i32 %302, i32 %302, i32 19)
  %322 = xor i32 %320, %321
  %323 = tail call i32 @llvm.fshl.i32(i32 %302, i32 %302, i32 10)
  %324 = xor i32 %322, %323
  %325 = and i32 %302, %274
  %326 = xor i32 %302, %274
  %327 = and i32 %326, %246
  %328 = xor i32 %327, %325
  %329 = add i32 %324, %328
  %330 = add i32 %329, %318
  %331 = getelementptr inbounds nuw i8, ptr %108, i64 32
  %332 = getelementptr inbounds nuw i8, ptr %98, i64 32
  br i1 %99, label %97, label %65, !llvm.loop !20

333:                                              ; preds = %333, %65
  %334 = phi i32 [ %96, %65 ], [ %694, %333 ]
  %335 = phi i32 [ %95, %65 ], [ %655, %333 ]
  %336 = phi i32 [ %94, %65 ], [ %616, %333 ]
  %337 = phi i32 [ %93, %65 ], [ %577, %333 ]
  %338 = phi i32 [ %92, %65 ], [ %889, %333 ]
  %339 = phi i32 [ %91, %65 ], [ %538, %333 ]
  %340 = phi i32 [ %90, %65 ], [ %850, %333 ]
  %341 = phi i32 [ %89, %65 ], [ %499, %333 ]
  %342 = phi i32 [ %88, %65 ], [ %811, %333 ]
  %343 = phi i32 [ %87, %65 ], [ %460, %333 ]
  %344 = phi i32 [ %86, %65 ], [ %772, %333 ]
  %345 = phi i32 [ %85, %65 ], [ %967, %333 ]
  %346 = phi i32 [ %84, %65 ], [ %421, %333 ]
  %347 = phi i32 [ %83, %65 ], [ %733, %333 ]
  %348 = phi i32 [ %82, %65 ], [ %928, %333 ]
  %349 = phi i32 [ 16, %65 ], [ %984, %333 ]
  %350 = phi i32 [ %235, %65 ], [ %855, %333 ]
  %351 = phi i32 [ %263, %65 ], [ %894, %333 ]
  %352 = phi i32 [ %291, %65 ], [ %933, %333 ]
  %353 = phi i32 [ %319, %65 ], [ %972, %333 ]
  %354 = phi i32 [ %246, %65 ], [ %866, %333 ]
  %355 = phi i32 [ %274, %65 ], [ %905, %333 ]
  %356 = phi i32 [ %302, %65 ], [ %944, %333 ]
  %357 = phi i32 [ %330, %65 ], [ %983, %333 ]
  %358 = phi ptr [ %2, %65 ], [ %360, %333 ]
  %359 = phi i32 [ %66, %65 ], [ %382, %333 ]
  %360 = getelementptr i8, ptr %358, i64 64
  %361 = tail call i32 @llvm.fshl.i32(i32 %353, i32 %353, i32 26)
  %362 = tail call i32 @llvm.fshl.i32(i32 %353, i32 %353, i32 21)
  %363 = xor i32 %361, %362
  %364 = tail call i32 @llvm.fshl.i32(i32 %353, i32 %353, i32 7)
  %365 = xor i32 %363, %364
  %366 = xor i32 %351, %352
  %367 = and i32 %366, %353
  %368 = xor i32 %367, %351
  %369 = load i32, ptr %360, align 4, !tbaa !1
  %370 = tail call i32 @llvm.fshl.i32(i32 %348, i32 %348, i32 15)
  %371 = tail call i32 @llvm.fshl.i32(i32 %348, i32 %348, i32 13)
  %372 = xor i32 %370, %371
  %373 = lshr i32 %348, 10
  %374 = xor i32 %372, %373
  %375 = add i32 %374, %347
  %376 = tail call i32 @llvm.fshl.i32(i32 %346, i32 %346, i32 25)
  %377 = tail call i32 @llvm.fshl.i32(i32 %346, i32 %346, i32 14)
  %378 = xor i32 %376, %377
  %379 = lshr i32 %346, 3
  %380 = xor i32 %378, %379
  %381 = add i32 %375, %359
  %382 = add i32 %381, %380
  %383 = add i32 %350, %365
  %384 = add i32 %383, %368
  %385 = add i32 %384, %369
  %386 = add i32 %385, %382
  %387 = add i32 %386, %354
  %388 = tail call i32 @llvm.fshl.i32(i32 %357, i32 %357, i32 30)
  %389 = tail call i32 @llvm.fshl.i32(i32 %357, i32 %357, i32 19)
  %390 = xor i32 %388, %389
  %391 = tail call i32 @llvm.fshl.i32(i32 %357, i32 %357, i32 10)
  %392 = xor i32 %390, %391
  %393 = and i32 %356, %357
  %394 = xor i32 %356, %357
  %395 = and i32 %355, %394
  %396 = xor i32 %395, %393
  %397 = add i32 %396, %392
  %398 = add i32 %397, %386
  %399 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %387, i32 26)
  %400 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %387, i32 21)
  %401 = xor i32 %399, %400
  %402 = tail call i32 @llvm.fshl.i32(i32 %387, i32 %387, i32 7)
  %403 = xor i32 %401, %402
  %404 = xor i32 %352, %353
  %405 = and i32 %387, %404
  %406 = xor i32 %405, %352
  %407 = getelementptr i8, ptr %358, i64 68
  %408 = load i32, ptr %407, align 4, !tbaa !1
  %409 = tail call i32 @llvm.fshl.i32(i32 %345, i32 %345, i32 15)
  %410 = tail call i32 @llvm.fshl.i32(i32 %345, i32 %345, i32 13)
  %411 = xor i32 %409, %410
  %412 = lshr i32 %345, 10
  %413 = xor i32 %411, %412
  %414 = tail call i32 @llvm.fshl.i32(i32 %343, i32 %343, i32 25)
  %415 = tail call i32 @llvm.fshl.i32(i32 %343, i32 %343, i32 14)
  %416 = xor i32 %414, %415
  %417 = lshr i32 %343, 3
  %418 = xor i32 %416, %417
  %419 = add i32 %344, %346
  %420 = add i32 %419, %413
  %421 = add i32 %420, %418
  %422 = add i32 %408, %351
  %423 = add i32 %422, %406
  %424 = add i32 %423, %403
  %425 = add i32 %424, %421
  %426 = add i32 %425, %355
  %427 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 30)
  %428 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 19)
  %429 = xor i32 %427, %428
  %430 = tail call i32 @llvm.fshl.i32(i32 %398, i32 %398, i32 10)
  %431 = xor i32 %429, %430
  %432 = and i32 %398, %357
  %433 = xor i32 %398, %357
  %434 = and i32 %433, %356
  %435 = xor i32 %434, %432
  %436 = add i32 %431, %435
  %437 = add i32 %436, %425
  %438 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 26)
  %439 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 21)
  %440 = xor i32 %438, %439
  %441 = tail call i32 @llvm.fshl.i32(i32 %426, i32 %426, i32 7)
  %442 = xor i32 %440, %441
  %443 = xor i32 %387, %353
  %444 = and i32 %426, %443
  %445 = xor i32 %444, %353
  %446 = getelementptr i8, ptr %358, i64 72
  %447 = load i32, ptr %446, align 4, !tbaa !1
  %448 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 15)
  %449 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 13)
  %450 = xor i32 %448, %449
  %451 = lshr i32 %382, 10
  %452 = xor i32 %450, %451
  %453 = tail call i32 @llvm.fshl.i32(i32 %341, i32 %341, i32 25)
  %454 = tail call i32 @llvm.fshl.i32(i32 %341, i32 %341, i32 14)
  %455 = xor i32 %453, %454
  %456 = lshr i32 %341, 3
  %457 = xor i32 %455, %456
  %458 = add i32 %452, %343
  %459 = add i32 %458, %342
  %460 = add i32 %459, %457
  %461 = add i32 %447, %352
  %462 = add i32 %461, %460
  %463 = add i32 %462, %445
  %464 = add i32 %463, %442
  %465 = add i32 %464, %356
  %466 = tail call i32 @llvm.fshl.i32(i32 %437, i32 %437, i32 30)
  %467 = tail call i32 @llvm.fshl.i32(i32 %437, i32 %437, i32 19)
  %468 = xor i32 %466, %467
  %469 = tail call i32 @llvm.fshl.i32(i32 %437, i32 %437, i32 10)
  %470 = xor i32 %468, %469
  %471 = and i32 %437, %398
  %472 = xor i32 %437, %398
  %473 = and i32 %472, %357
  %474 = xor i32 %473, %471
  %475 = add i32 %470, %474
  %476 = add i32 %475, %464
  %477 = tail call i32 @llvm.fshl.i32(i32 %465, i32 %465, i32 26)
  %478 = tail call i32 @llvm.fshl.i32(i32 %465, i32 %465, i32 21)
  %479 = xor i32 %477, %478
  %480 = tail call i32 @llvm.fshl.i32(i32 %465, i32 %465, i32 7)
  %481 = xor i32 %479, %480
  %482 = xor i32 %426, %387
  %483 = and i32 %465, %482
  %484 = xor i32 %483, %387
  %485 = getelementptr i8, ptr %358, i64 76
  %486 = load i32, ptr %485, align 4, !tbaa !1
  %487 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 15)
  %488 = tail call i32 @llvm.fshl.i32(i32 %421, i32 %421, i32 13)
  %489 = xor i32 %487, %488
  %490 = lshr i32 %421, 10
  %491 = xor i32 %489, %490
  %492 = tail call i32 @llvm.fshl.i32(i32 %339, i32 %339, i32 25)
  %493 = tail call i32 @llvm.fshl.i32(i32 %339, i32 %339, i32 14)
  %494 = xor i32 %492, %493
  %495 = lshr i32 %339, 3
  %496 = xor i32 %494, %495
  %497 = add i32 %340, %341
  %498 = add i32 %497, %491
  %499 = add i32 %498, %496
  %500 = add i32 %486, %353
  %501 = add i32 %500, %499
  %502 = add i32 %501, %484
  %503 = add i32 %502, %481
  %504 = add i32 %503, %357
  %505 = tail call i32 @llvm.fshl.i32(i32 %476, i32 %476, i32 30)
  %506 = tail call i32 @llvm.fshl.i32(i32 %476, i32 %476, i32 19)
  %507 = xor i32 %505, %506
  %508 = tail call i32 @llvm.fshl.i32(i32 %476, i32 %476, i32 10)
  %509 = xor i32 %507, %508
  %510 = and i32 %476, %437
  %511 = xor i32 %476, %437
  %512 = and i32 %511, %398
  %513 = xor i32 %512, %510
  %514 = add i32 %509, %513
  %515 = add i32 %514, %503
  %516 = tail call i32 @llvm.fshl.i32(i32 %504, i32 %504, i32 26)
  %517 = tail call i32 @llvm.fshl.i32(i32 %504, i32 %504, i32 21)
  %518 = xor i32 %516, %517
  %519 = tail call i32 @llvm.fshl.i32(i32 %504, i32 %504, i32 7)
  %520 = xor i32 %518, %519
  %521 = xor i32 %465, %426
  %522 = and i32 %504, %521
  %523 = xor i32 %522, %426
  %524 = getelementptr i8, ptr %358, i64 80
  %525 = load i32, ptr %524, align 4, !tbaa !1
  %526 = tail call i32 @llvm.fshl.i32(i32 %460, i32 %460, i32 15)
  %527 = tail call i32 @llvm.fshl.i32(i32 %460, i32 %460, i32 13)
  %528 = xor i32 %526, %527
  %529 = lshr i32 %460, 10
  %530 = xor i32 %528, %529
  %531 = tail call i32 @llvm.fshl.i32(i32 %337, i32 %337, i32 25)
  %532 = tail call i32 @llvm.fshl.i32(i32 %337, i32 %337, i32 14)
  %533 = xor i32 %531, %532
  %534 = lshr i32 %337, 3
  %535 = xor i32 %533, %534
  %536 = add i32 %338, %339
  %537 = add i32 %536, %530
  %538 = add i32 %537, %535
  %539 = add i32 %525, %387
  %540 = add i32 %539, %538
  %541 = add i32 %540, %523
  %542 = add i32 %541, %520
  %543 = add i32 %542, %398
  %544 = tail call i32 @llvm.fshl.i32(i32 %515, i32 %515, i32 30)
  %545 = tail call i32 @llvm.fshl.i32(i32 %515, i32 %515, i32 19)
  %546 = xor i32 %544, %545
  %547 = tail call i32 @llvm.fshl.i32(i32 %515, i32 %515, i32 10)
  %548 = xor i32 %546, %547
  %549 = and i32 %515, %476
  %550 = xor i32 %515, %476
  %551 = and i32 %550, %437
  %552 = xor i32 %551, %549
  %553 = add i32 %548, %552
  %554 = add i32 %553, %542
  %555 = tail call i32 @llvm.fshl.i32(i32 %543, i32 %543, i32 26)
  %556 = tail call i32 @llvm.fshl.i32(i32 %543, i32 %543, i32 21)
  %557 = xor i32 %555, %556
  %558 = tail call i32 @llvm.fshl.i32(i32 %543, i32 %543, i32 7)
  %559 = xor i32 %557, %558
  %560 = xor i32 %504, %465
  %561 = and i32 %543, %560
  %562 = xor i32 %561, %465
  %563 = getelementptr i8, ptr %358, i64 84
  %564 = load i32, ptr %563, align 4, !tbaa !1
  %565 = tail call i32 @llvm.fshl.i32(i32 %499, i32 %499, i32 15)
  %566 = tail call i32 @llvm.fshl.i32(i32 %499, i32 %499, i32 13)
  %567 = xor i32 %565, %566
  %568 = lshr i32 %499, 10
  %569 = xor i32 %567, %568
  %570 = tail call i32 @llvm.fshl.i32(i32 %336, i32 %336, i32 25)
  %571 = tail call i32 @llvm.fshl.i32(i32 %336, i32 %336, i32 14)
  %572 = xor i32 %570, %571
  %573 = lshr i32 %336, 3
  %574 = xor i32 %572, %573
  %575 = add i32 %337, %348
  %576 = add i32 %575, %569
  %577 = add i32 %576, %574
  %578 = add i32 %564, %426
  %579 = add i32 %578, %577
  %580 = add i32 %579, %562
  %581 = add i32 %580, %559
  %582 = add i32 %581, %437
  %583 = tail call i32 @llvm.fshl.i32(i32 %554, i32 %554, i32 30)
  %584 = tail call i32 @llvm.fshl.i32(i32 %554, i32 %554, i32 19)
  %585 = xor i32 %583, %584
  %586 = tail call i32 @llvm.fshl.i32(i32 %554, i32 %554, i32 10)
  %587 = xor i32 %585, %586
  %588 = and i32 %554, %515
  %589 = xor i32 %554, %515
  %590 = and i32 %589, %476
  %591 = xor i32 %590, %588
  %592 = add i32 %587, %591
  %593 = add i32 %592, %581
  %594 = tail call i32 @llvm.fshl.i32(i32 %582, i32 %582, i32 26)
  %595 = tail call i32 @llvm.fshl.i32(i32 %582, i32 %582, i32 21)
  %596 = xor i32 %594, %595
  %597 = tail call i32 @llvm.fshl.i32(i32 %582, i32 %582, i32 7)
  %598 = xor i32 %596, %597
  %599 = xor i32 %543, %504
  %600 = and i32 %582, %599
  %601 = xor i32 %600, %504
  %602 = getelementptr i8, ptr %358, i64 88
  %603 = load i32, ptr %602, align 4, !tbaa !1
  %604 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 15)
  %605 = tail call i32 @llvm.fshl.i32(i32 %538, i32 %538, i32 13)
  %606 = xor i32 %604, %605
  %607 = lshr i32 %538, 10
  %608 = xor i32 %606, %607
  %609 = tail call i32 @llvm.fshl.i32(i32 %335, i32 %335, i32 25)
  %610 = tail call i32 @llvm.fshl.i32(i32 %335, i32 %335, i32 14)
  %611 = xor i32 %609, %610
  %612 = lshr i32 %335, 3
  %613 = xor i32 %611, %612
  %614 = add i32 %336, %345
  %615 = add i32 %614, %608
  %616 = add i32 %615, %613
  %617 = add i32 %465, %603
  %618 = add i32 %617, %616
  %619 = add i32 %618, %601
  %620 = add i32 %619, %598
  %621 = add i32 %620, %476
  %622 = tail call i32 @llvm.fshl.i32(i32 %593, i32 %593, i32 30)
  %623 = tail call i32 @llvm.fshl.i32(i32 %593, i32 %593, i32 19)
  %624 = xor i32 %622, %623
  %625 = tail call i32 @llvm.fshl.i32(i32 %593, i32 %593, i32 10)
  %626 = xor i32 %624, %625
  %627 = and i32 %593, %554
  %628 = xor i32 %593, %554
  %629 = and i32 %628, %515
  %630 = xor i32 %629, %627
  %631 = add i32 %626, %630
  %632 = add i32 %631, %620
  %633 = tail call i32 @llvm.fshl.i32(i32 %621, i32 %621, i32 26)
  %634 = tail call i32 @llvm.fshl.i32(i32 %621, i32 %621, i32 21)
  %635 = xor i32 %633, %634
  %636 = tail call i32 @llvm.fshl.i32(i32 %621, i32 %621, i32 7)
  %637 = xor i32 %635, %636
  %638 = xor i32 %582, %543
  %639 = and i32 %621, %638
  %640 = xor i32 %639, %543
  %641 = getelementptr i8, ptr %358, i64 92
  %642 = load i32, ptr %641, align 4, !tbaa !1
  %643 = tail call i32 @llvm.fshl.i32(i32 %577, i32 %577, i32 15)
  %644 = tail call i32 @llvm.fshl.i32(i32 %577, i32 %577, i32 13)
  %645 = xor i32 %643, %644
  %646 = lshr i32 %577, 10
  %647 = xor i32 %645, %646
  %648 = tail call i32 @llvm.fshl.i32(i32 %334, i32 %334, i32 25)
  %649 = tail call i32 @llvm.fshl.i32(i32 %334, i32 %334, i32 14)
  %650 = xor i32 %648, %649
  %651 = lshr i32 %334, 3
  %652 = xor i32 %650, %651
  %653 = add i32 %335, %382
  %654 = add i32 %653, %647
  %655 = add i32 %654, %652
  %656 = add i32 %655, %642
  %657 = add i32 %656, %504
  %658 = add i32 %657, %640
  %659 = add i32 %658, %637
  %660 = add i32 %659, %515
  %661 = tail call i32 @llvm.fshl.i32(i32 %632, i32 %632, i32 30)
  %662 = tail call i32 @llvm.fshl.i32(i32 %632, i32 %632, i32 19)
  %663 = xor i32 %661, %662
  %664 = tail call i32 @llvm.fshl.i32(i32 %632, i32 %632, i32 10)
  %665 = xor i32 %663, %664
  %666 = and i32 %632, %593
  %667 = xor i32 %632, %593
  %668 = and i32 %667, %554
  %669 = xor i32 %668, %666
  %670 = add i32 %665, %669
  %671 = add i32 %670, %659
  %672 = tail call i32 @llvm.fshl.i32(i32 %660, i32 %660, i32 26)
  %673 = tail call i32 @llvm.fshl.i32(i32 %660, i32 %660, i32 21)
  %674 = xor i32 %672, %673
  %675 = tail call i32 @llvm.fshl.i32(i32 %660, i32 %660, i32 7)
  %676 = xor i32 %674, %675
  %677 = xor i32 %621, %582
  %678 = and i32 %660, %677
  %679 = xor i32 %678, %582
  %680 = getelementptr i8, ptr %358, i64 96
  %681 = load i32, ptr %680, align 4, !tbaa !1
  %682 = tail call i32 @llvm.fshl.i32(i32 %616, i32 %616, i32 15)
  %683 = tail call i32 @llvm.fshl.i32(i32 %616, i32 %616, i32 13)
  %684 = xor i32 %682, %683
  %685 = lshr i32 %616, 10
  %686 = xor i32 %684, %685
  %687 = tail call i32 @llvm.fshl.i32(i32 %347, i32 %347, i32 25)
  %688 = tail call i32 @llvm.fshl.i32(i32 %347, i32 %347, i32 14)
  %689 = xor i32 %687, %688
  %690 = lshr i32 %347, 3
  %691 = xor i32 %689, %690
  %692 = add i32 %421, %691
  %693 = add i32 %692, %334
  %694 = add i32 %693, %686
  %695 = add i32 %694, %681
  %696 = add i32 %695, %543
  %697 = add i32 %696, %679
  %698 = add i32 %697, %676
  %699 = add i32 %698, %554
  %700 = tail call i32 @llvm.fshl.i32(i32 %671, i32 %671, i32 30)
  %701 = tail call i32 @llvm.fshl.i32(i32 %671, i32 %671, i32 19)
  %702 = xor i32 %700, %701
  %703 = tail call i32 @llvm.fshl.i32(i32 %671, i32 %671, i32 10)
  %704 = xor i32 %702, %703
  %705 = and i32 %671, %632
  %706 = xor i32 %671, %632
  %707 = and i32 %706, %593
  %708 = xor i32 %707, %705
  %709 = add i32 %704, %708
  %710 = add i32 %709, %698
  %711 = tail call i32 @llvm.fshl.i32(i32 %699, i32 %699, i32 26)
  %712 = tail call i32 @llvm.fshl.i32(i32 %699, i32 %699, i32 21)
  %713 = xor i32 %711, %712
  %714 = tail call i32 @llvm.fshl.i32(i32 %699, i32 %699, i32 7)
  %715 = xor i32 %713, %714
  %716 = xor i32 %660, %621
  %717 = and i32 %699, %716
  %718 = xor i32 %717, %621
  %719 = getelementptr i8, ptr %358, i64 100
  %720 = load i32, ptr %719, align 4, !tbaa !1
  %721 = tail call i32 @llvm.fshl.i32(i32 %655, i32 %655, i32 15)
  %722 = tail call i32 @llvm.fshl.i32(i32 %655, i32 %655, i32 13)
  %723 = xor i32 %721, %722
  %724 = lshr i32 %655, 10
  %725 = xor i32 %723, %724
  %726 = tail call i32 @llvm.fshl.i32(i32 %344, i32 %344, i32 25)
  %727 = tail call i32 @llvm.fshl.i32(i32 %344, i32 %344, i32 14)
  %728 = xor i32 %726, %727
  %729 = lshr i32 %344, 3
  %730 = xor i32 %728, %729
  %731 = add i32 %730, %347
  %732 = add i32 %731, %460
  %733 = add i32 %732, %725
  %734 = add i32 %733, %720
  %735 = add i32 %734, %582
  %736 = add i32 %735, %718
  %737 = add i32 %736, %715
  %738 = add i32 %737, %593
  %739 = tail call i32 @llvm.fshl.i32(i32 %710, i32 %710, i32 30)
  %740 = tail call i32 @llvm.fshl.i32(i32 %710, i32 %710, i32 19)
  %741 = xor i32 %739, %740
  %742 = tail call i32 @llvm.fshl.i32(i32 %710, i32 %710, i32 10)
  %743 = xor i32 %741, %742
  %744 = and i32 %710, %671
  %745 = xor i32 %710, %671
  %746 = and i32 %745, %632
  %747 = xor i32 %746, %744
  %748 = add i32 %743, %747
  %749 = add i32 %748, %737
  %750 = tail call i32 @llvm.fshl.i32(i32 %738, i32 %738, i32 26)
  %751 = tail call i32 @llvm.fshl.i32(i32 %738, i32 %738, i32 21)
  %752 = xor i32 %750, %751
  %753 = tail call i32 @llvm.fshl.i32(i32 %738, i32 %738, i32 7)
  %754 = xor i32 %752, %753
  %755 = xor i32 %699, %660
  %756 = and i32 %738, %755
  %757 = xor i32 %756, %660
  %758 = getelementptr i8, ptr %358, i64 104
  %759 = load i32, ptr %758, align 4, !tbaa !1
  %760 = tail call i32 @llvm.fshl.i32(i32 %694, i32 %694, i32 15)
  %761 = tail call i32 @llvm.fshl.i32(i32 %694, i32 %694, i32 13)
  %762 = xor i32 %760, %761
  %763 = lshr i32 %694, 10
  %764 = xor i32 %762, %763
  %765 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %342, i32 25)
  %766 = tail call i32 @llvm.fshl.i32(i32 %342, i32 %342, i32 14)
  %767 = xor i32 %765, %766
  %768 = lshr i32 %342, 3
  %769 = xor i32 %767, %768
  %770 = add i32 %769, %344
  %771 = add i32 %770, %499
  %772 = add i32 %771, %764
  %773 = add i32 %772, %759
  %774 = add i32 %773, %621
  %775 = add i32 %774, %757
  %776 = add i32 %775, %754
  %777 = add i32 %776, %632
  %778 = tail call i32 @llvm.fshl.i32(i32 %749, i32 %749, i32 30)
  %779 = tail call i32 @llvm.fshl.i32(i32 %749, i32 %749, i32 19)
  %780 = xor i32 %778, %779
  %781 = tail call i32 @llvm.fshl.i32(i32 %749, i32 %749, i32 10)
  %782 = xor i32 %780, %781
  %783 = and i32 %749, %710
  %784 = xor i32 %749, %710
  %785 = and i32 %784, %671
  %786 = xor i32 %785, %783
  %787 = add i32 %782, %786
  %788 = add i32 %787, %776
  %789 = tail call i32 @llvm.fshl.i32(i32 %777, i32 %777, i32 26)
  %790 = tail call i32 @llvm.fshl.i32(i32 %777, i32 %777, i32 21)
  %791 = xor i32 %789, %790
  %792 = tail call i32 @llvm.fshl.i32(i32 %777, i32 %777, i32 7)
  %793 = xor i32 %791, %792
  %794 = xor i32 %738, %699
  %795 = and i32 %777, %794
  %796 = xor i32 %795, %699
  %797 = getelementptr i8, ptr %358, i64 108
  %798 = load i32, ptr %797, align 4, !tbaa !1
  %799 = tail call i32 @llvm.fshl.i32(i32 %733, i32 %733, i32 15)
  %800 = tail call i32 @llvm.fshl.i32(i32 %733, i32 %733, i32 13)
  %801 = xor i32 %799, %800
  %802 = lshr i32 %733, 10
  %803 = xor i32 %801, %802
  %804 = tail call i32 @llvm.fshl.i32(i32 %340, i32 %340, i32 25)
  %805 = tail call i32 @llvm.fshl.i32(i32 %340, i32 %340, i32 14)
  %806 = xor i32 %804, %805
  %807 = lshr i32 %340, 3
  %808 = xor i32 %806, %807
  %809 = add i32 %808, %342
  %810 = add i32 %809, %538
  %811 = add i32 %810, %803
  %812 = add i32 %811, %798
  %813 = add i32 %812, %660
  %814 = add i32 %813, %796
  %815 = add i32 %814, %793
  %816 = add i32 %815, %671
  %817 = tail call i32 @llvm.fshl.i32(i32 %788, i32 %788, i32 30)
  %818 = tail call i32 @llvm.fshl.i32(i32 %788, i32 %788, i32 19)
  %819 = xor i32 %817, %818
  %820 = tail call i32 @llvm.fshl.i32(i32 %788, i32 %788, i32 10)
  %821 = xor i32 %819, %820
  %822 = and i32 %788, %749
  %823 = xor i32 %788, %749
  %824 = and i32 %823, %710
  %825 = xor i32 %824, %822
  %826 = add i32 %821, %825
  %827 = add i32 %826, %815
  %828 = tail call i32 @llvm.fshl.i32(i32 %816, i32 %816, i32 26)
  %829 = tail call i32 @llvm.fshl.i32(i32 %816, i32 %816, i32 21)
  %830 = xor i32 %828, %829
  %831 = tail call i32 @llvm.fshl.i32(i32 %816, i32 %816, i32 7)
  %832 = xor i32 %830, %831
  %833 = xor i32 %777, %738
  %834 = and i32 %816, %833
  %835 = xor i32 %834, %738
  %836 = getelementptr i8, ptr %358, i64 112
  %837 = load i32, ptr %836, align 4, !tbaa !1
  %838 = tail call i32 @llvm.fshl.i32(i32 %772, i32 %772, i32 15)
  %839 = tail call i32 @llvm.fshl.i32(i32 %772, i32 %772, i32 13)
  %840 = xor i32 %838, %839
  %841 = lshr i32 %772, 10
  %842 = xor i32 %840, %841
  %843 = tail call i32 @llvm.fshl.i32(i32 %338, i32 %338, i32 25)
  %844 = tail call i32 @llvm.fshl.i32(i32 %338, i32 %338, i32 14)
  %845 = xor i32 %843, %844
  %846 = lshr i32 %338, 3
  %847 = xor i32 %845, %846
  %848 = add i32 %847, %340
  %849 = add i32 %848, %577
  %850 = add i32 %849, %842
  %851 = add i32 %850, %837
  %852 = add i32 %851, %699
  %853 = add i32 %852, %835
  %854 = add i32 %853, %832
  %855 = add i32 %854, %710
  %856 = tail call i32 @llvm.fshl.i32(i32 %827, i32 %827, i32 30)
  %857 = tail call i32 @llvm.fshl.i32(i32 %827, i32 %827, i32 19)
  %858 = xor i32 %856, %857
  %859 = tail call i32 @llvm.fshl.i32(i32 %827, i32 %827, i32 10)
  %860 = xor i32 %858, %859
  %861 = and i32 %827, %788
  %862 = xor i32 %827, %788
  %863 = and i32 %862, %749
  %864 = xor i32 %863, %861
  %865 = add i32 %860, %864
  %866 = add i32 %865, %854
  %867 = tail call i32 @llvm.fshl.i32(i32 %855, i32 %855, i32 26)
  %868 = tail call i32 @llvm.fshl.i32(i32 %855, i32 %855, i32 21)
  %869 = xor i32 %867, %868
  %870 = tail call i32 @llvm.fshl.i32(i32 %855, i32 %855, i32 7)
  %871 = xor i32 %869, %870
  %872 = xor i32 %816, %777
  %873 = and i32 %855, %872
  %874 = xor i32 %873, %777
  %875 = getelementptr i8, ptr %358, i64 116
  %876 = load i32, ptr %875, align 4, !tbaa !1
  %877 = tail call i32 @llvm.fshl.i32(i32 %811, i32 %811, i32 15)
  %878 = tail call i32 @llvm.fshl.i32(i32 %811, i32 %811, i32 13)
  %879 = xor i32 %877, %878
  %880 = lshr i32 %811, 10
  %881 = xor i32 %879, %880
  %882 = tail call i32 @llvm.fshl.i32(i32 %348, i32 %348, i32 25)
  %883 = tail call i32 @llvm.fshl.i32(i32 %348, i32 %348, i32 14)
  %884 = xor i32 %882, %883
  %885 = lshr i32 %348, 3
  %886 = xor i32 %884, %885
  %887 = add i32 %338, %886
  %888 = add i32 %887, %616
  %889 = add i32 %888, %881
  %890 = add i32 %889, %876
  %891 = add i32 %890, %738
  %892 = add i32 %891, %874
  %893 = add i32 %892, %871
  %894 = add i32 %893, %749
  %895 = tail call i32 @llvm.fshl.i32(i32 %866, i32 %866, i32 30)
  %896 = tail call i32 @llvm.fshl.i32(i32 %866, i32 %866, i32 19)
  %897 = xor i32 %895, %896
  %898 = tail call i32 @llvm.fshl.i32(i32 %866, i32 %866, i32 10)
  %899 = xor i32 %897, %898
  %900 = and i32 %866, %827
  %901 = xor i32 %866, %827
  %902 = and i32 %901, %788
  %903 = xor i32 %902, %900
  %904 = add i32 %899, %903
  %905 = add i32 %904, %893
  %906 = tail call i32 @llvm.fshl.i32(i32 %894, i32 %894, i32 26)
  %907 = tail call i32 @llvm.fshl.i32(i32 %894, i32 %894, i32 21)
  %908 = xor i32 %906, %907
  %909 = tail call i32 @llvm.fshl.i32(i32 %894, i32 %894, i32 7)
  %910 = xor i32 %908, %909
  %911 = xor i32 %855, %816
  %912 = and i32 %894, %911
  %913 = xor i32 %912, %816
  %914 = getelementptr i8, ptr %358, i64 120
  %915 = load i32, ptr %914, align 4, !tbaa !1
  %916 = tail call i32 @llvm.fshl.i32(i32 %850, i32 %850, i32 15)
  %917 = tail call i32 @llvm.fshl.i32(i32 %850, i32 %850, i32 13)
  %918 = xor i32 %916, %917
  %919 = lshr i32 %850, 10
  %920 = xor i32 %918, %919
  %921 = tail call i32 @llvm.fshl.i32(i32 %345, i32 %345, i32 25)
  %922 = tail call i32 @llvm.fshl.i32(i32 %345, i32 %345, i32 14)
  %923 = xor i32 %921, %922
  %924 = lshr i32 %345, 3
  %925 = xor i32 %923, %924
  %926 = add i32 %925, %348
  %927 = add i32 %926, %655
  %928 = add i32 %927, %920
  %929 = add i32 %928, %915
  %930 = add i32 %929, %777
  %931 = add i32 %930, %913
  %932 = add i32 %931, %910
  %933 = add i32 %932, %788
  %934 = tail call i32 @llvm.fshl.i32(i32 %905, i32 %905, i32 30)
  %935 = tail call i32 @llvm.fshl.i32(i32 %905, i32 %905, i32 19)
  %936 = xor i32 %934, %935
  %937 = tail call i32 @llvm.fshl.i32(i32 %905, i32 %905, i32 10)
  %938 = xor i32 %936, %937
  %939 = and i32 %905, %866
  %940 = xor i32 %905, %866
  %941 = and i32 %940, %827
  %942 = xor i32 %941, %939
  %943 = add i32 %938, %942
  %944 = add i32 %943, %932
  %945 = tail call i32 @llvm.fshl.i32(i32 %933, i32 %933, i32 26)
  %946 = tail call i32 @llvm.fshl.i32(i32 %933, i32 %933, i32 21)
  %947 = xor i32 %945, %946
  %948 = tail call i32 @llvm.fshl.i32(i32 %933, i32 %933, i32 7)
  %949 = xor i32 %947, %948
  %950 = xor i32 %894, %855
  %951 = and i32 %933, %950
  %952 = xor i32 %951, %855
  %953 = getelementptr i8, ptr %358, i64 124
  %954 = load i32, ptr %953, align 4, !tbaa !1
  %955 = tail call i32 @llvm.fshl.i32(i32 %889, i32 %889, i32 15)
  %956 = tail call i32 @llvm.fshl.i32(i32 %889, i32 %889, i32 13)
  %957 = xor i32 %955, %956
  %958 = lshr i32 %889, 10
  %959 = xor i32 %957, %958
  %960 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 25)
  %961 = tail call i32 @llvm.fshl.i32(i32 %382, i32 %382, i32 14)
  %962 = xor i32 %960, %961
  %963 = lshr i32 %382, 3
  %964 = xor i32 %962, %963
  %965 = add i32 %964, %345
  %966 = add i32 %965, %694
  %967 = add i32 %966, %959
  %968 = add i32 %967, %954
  %969 = add i32 %968, %816
  %970 = add i32 %969, %952
  %971 = add i32 %970, %949
  %972 = add i32 %971, %827
  %973 = tail call i32 @llvm.fshl.i32(i32 %944, i32 %944, i32 30)
  %974 = tail call i32 @llvm.fshl.i32(i32 %944, i32 %944, i32 19)
  %975 = xor i32 %973, %974
  %976 = tail call i32 @llvm.fshl.i32(i32 %944, i32 %944, i32 10)
  %977 = xor i32 %975, %976
  %978 = and i32 %944, %905
  %979 = xor i32 %944, %905
  %980 = and i32 %979, %866
  %981 = xor i32 %980, %978
  %982 = add i32 %977, %981
  %983 = add i32 %982, %971
  %984 = add nuw nsw i32 %349, 16
  %985 = icmp samesign ult i32 %349, 48
  br i1 %985, label %333, label %986, !llvm.loop !21

986:                                              ; preds = %333
  %987 = add i32 %983, %50
  store i32 %987, ptr %0, align 4, !tbaa !1
  %988 = add i32 %944, %52
  store i32 %988, ptr %51, align 4, !tbaa !1
  %989 = add i32 %905, %54
  store i32 %989, ptr %53, align 4, !tbaa !1
  %990 = add i32 %866, %56
  store i32 %990, ptr %55, align 4, !tbaa !1
  %991 = add i32 %972, %58
  store i32 %991, ptr %57, align 4, !tbaa !1
  %992 = add i32 %933, %60
  store i32 %992, ptr %59, align 4, !tbaa !1
  %993 = add i32 %894, %62
  store i32 %993, ptr %61, align 4, !tbaa !1
  %994 = add i32 %855, %64
  store i32 %994, ptr %63, align 4, !tbaa !1
  call void @llvm.lifetime.end.p0(ptr nonnull %4) #17
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
  br i1 %7, label %75, label %8

8:                                                ; preds = %3
  %9 = and i64 %4, 1
  %10 = icmp eq i64 %4, 1
  br i1 %10, label %55, label %11

11:                                               ; preds = %8
  %12 = and i64 %4, 4611686018427387902
  br label %13

13:                                               ; preds = %13, %11
  %14 = phi ptr [ %1, %11 ], [ %50, %13 ]
  %15 = phi i64 [ 0, %11 ], [ %49, %13 ]
  %16 = phi i64 [ 0, %11 ], [ %51, %13 ]
  %17 = getelementptr inbounds nuw i32, ptr %2, i64 %15
  %18 = load i32, ptr %17, align 4, !tbaa !1
  %19 = lshr i32 %18, 24
  %20 = trunc nuw i32 %19 to i8
  store i8 %20, ptr %14, align 1, !tbaa !17
  %21 = load i32, ptr %17, align 4, !tbaa !1
  %22 = lshr i32 %21, 16
  %23 = trunc i32 %22 to i8
  %24 = getelementptr inbounds nuw i8, ptr %14, i64 1
  store i8 %23, ptr %24, align 1, !tbaa !17
  %25 = load i32, ptr %17, align 4, !tbaa !1
  %26 = lshr i32 %25, 8
  %27 = trunc i32 %26 to i8
  %28 = getelementptr inbounds nuw i8, ptr %14, i64 2
  store i8 %27, ptr %28, align 1, !tbaa !17
  %29 = load i32, ptr %17, align 4, !tbaa !1
  %30 = trunc i32 %29 to i8
  %31 = getelementptr inbounds nuw i8, ptr %14, i64 3
  store i8 %30, ptr %31, align 1, !tbaa !17
  %32 = getelementptr inbounds nuw i8, ptr %14, i64 4
  %33 = getelementptr inbounds nuw i32, ptr %2, i64 %15
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 4
  %35 = load i32, ptr %34, align 4, !tbaa !1
  %36 = lshr i32 %35, 24
  %37 = trunc nuw i32 %36 to i8
  store i8 %37, ptr %32, align 1, !tbaa !17
  %38 = load i32, ptr %34, align 4, !tbaa !1
  %39 = lshr i32 %38, 16
  %40 = trunc i32 %39 to i8
  %41 = getelementptr inbounds nuw i8, ptr %14, i64 5
  store i8 %40, ptr %41, align 1, !tbaa !17
  %42 = load i32, ptr %34, align 4, !tbaa !1
  %43 = lshr i32 %42, 8
  %44 = trunc i32 %43 to i8
  %45 = getelementptr inbounds nuw i8, ptr %14, i64 6
  store i8 %44, ptr %45, align 1, !tbaa !17
  %46 = load i32, ptr %34, align 4, !tbaa !1
  %47 = trunc i32 %46 to i8
  %48 = getelementptr inbounds nuw i8, ptr %14, i64 7
  store i8 %47, ptr %48, align 1, !tbaa !17
  %49 = add nuw nsw i64 %15, 2
  %50 = getelementptr inbounds nuw i8, ptr %14, i64 8
  %51 = add i64 %16, 2
  %52 = icmp eq i64 %51, %12
  br i1 %52, label %53, label %13, !llvm.loop !18

53:                                               ; preds = %13
  %54 = icmp eq i64 %9, 0
  br i1 %54, label %75, label %55

55:                                               ; preds = %53, %8
  %56 = phi ptr [ %1, %8 ], [ %50, %53 ]
  %57 = phi i64 [ 0, %8 ], [ %49, %53 ]
  %58 = icmp ne i64 %9, 0
  tail call void @llvm.assume(i1 %58)
  %59 = getelementptr inbounds nuw i32, ptr %2, i64 %57
  %60 = load i32, ptr %59, align 4, !tbaa !1
  %61 = lshr i32 %60, 24
  %62 = trunc nuw i32 %61 to i8
  store i8 %62, ptr %56, align 1, !tbaa !17
  %63 = load i32, ptr %59, align 4, !tbaa !1
  %64 = lshr i32 %63, 16
  %65 = trunc i32 %64 to i8
  %66 = getelementptr inbounds nuw i8, ptr %56, i64 1
  store i8 %65, ptr %66, align 1, !tbaa !17
  %67 = load i32, ptr %59, align 4, !tbaa !1
  %68 = lshr i32 %67, 8
  %69 = trunc i32 %68 to i8
  %70 = getelementptr inbounds nuw i8, ptr %56, i64 2
  store i8 %69, ptr %70, align 1, !tbaa !17
  %71 = load i32, ptr %59, align 4, !tbaa !1
  %72 = trunc i32 %71 to i8
  %73 = getelementptr inbounds nuw i8, ptr %56, i64 3
  store i8 %72, ptr %73, align 1, !tbaa !17
  %74 = getelementptr inbounds nuw i8, ptr %56, i64 4
  br label %75

75:                                               ; preds = %55, %53, %3
  %76 = phi ptr [ %1, %3 ], [ %50, %53 ], [ %74, %55 ]
  %77 = icmp eq i32 %6, 0
  br i1 %77, label %95, label %78

78:                                               ; preds = %75
  %79 = getelementptr inbounds nuw i32, ptr %2, i64 %4
  %80 = load i32, ptr %79, align 4, !tbaa !1
  switch i32 %6, label %81 [
    i32 3, label %82
    i32 2, label %88
    i32 1, label %92
  ]

81:                                               ; preds = %78
  unreachable

82:                                               ; preds = %78
  %83 = lshr i32 %80, 8
  %84 = trunc i32 %83 to i8
  %85 = and i64 %0, 3
  %86 = getelementptr i8, ptr %76, i64 %85
  %87 = getelementptr i8, ptr %86, i64 -1
  store i8 %84, ptr %87, align 1, !tbaa !17
  br label %88

88:                                               ; preds = %82, %78
  %89 = lshr i32 %80, 16
  %90 = trunc i32 %89 to i8
  %91 = getelementptr inbounds nuw i8, ptr %76, i64 1
  store i8 %90, ptr %91, align 1, !tbaa !17
  br label %92

92:                                               ; preds = %88, %78
  %93 = lshr i32 %80, 24
  %94 = trunc nuw i32 %93 to i8
  store i8 %94, ptr %76, align 1, !tbaa !17
  br label %95

95:                                               ; preds = %92, %75
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
  ret i32 %8
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @initialise_benchmark() local_unnamed_addr #9 {
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #10 {
  tail call fastcc void @benchmark_body(i32 noundef 1, i32 noundef %0)
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define internal fastcc void @benchmark_body(i32 noundef range(i32 1, 563) %0, i32 noundef %1) unnamed_addr #11 {
  %3 = alloca %struct.sha256_ctx, align 8
  %4 = icmp eq i32 %1, 0
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 104
  %7 = getelementptr inbounds nuw i8, ptr %3, i64 40
  br label %8

8:                                                ; preds = %11, %2
  %9 = phi i32 [ 0, %2 ], [ %12, %11 ]
  br i1 %4, label %11, label %14

10:                                               ; preds = %11
  ret void

11:                                               ; preds = %14, %8
  %12 = add nuw nsw i32 %9, 1
  %13 = icmp eq i32 %12, %0
  br i1 %13, label %10, label %8, !llvm.loop !22

14:                                               ; preds = %14, %8
  %15 = phi i32 [ %16, %14 ], [ 0, %8 ]
  tail call void @llvm.memset.p0.i64(ptr noundef nonnull align 16 dereferenceable(32) @buffer, i8 0, i64 32, i1 false)
  call void @llvm.lifetime.start.p0(ptr nonnull %3) #17
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(32) %3, ptr noundef nonnull align 16 dereferenceable(32) @sha256_init.H0, i64 32, i1 false)
  store i64 0, ptr %5, align 8, !tbaa !12
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 8 dereferenceable(56) %7, ptr noundef nonnull align 16 dereferenceable(56) @msg, i64 56, i1 false)
  store i32 56, ptr %6, align 8, !tbaa !15
  call void @sha256_digest(ptr noundef nonnull %3, i64 noundef 32, ptr noundef nonnull @buffer)
  call void @llvm.lifetime.end.p0(ptr nonnull %3) #17
  %16 = add nuw i32 %15, 1
  %17 = icmp eq i32 %16, %1
  br i1 %17, label %11, label %14, !llvm.loop !23
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local noundef i32 @benchmark() local_unnamed_addr #12 {
  tail call fastcc void @benchmark_body(i32 noundef 562, i32 noundef 1)
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @initialise_board() local_unnamed_addr #9 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @start_trigger() local_unnamed_addr #9 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @stop_trigger() local_unnamed_addr #9 {
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
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @srand_beebs(i32 noundef %0) local_unnamed_addr #14 {
  %2 = zext i32 %0 to i64
  store i64 %2, ptr @seed, align 8, !tbaa !24
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @init_heap_beebs(ptr noundef %0, i64 noundef %1) local_unnamed_addr #15 {
  %3 = and i64 %1, 7
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %5, %2
  br label %5

6:                                                ; preds = %2
  store ptr %0, ptr @heap_ptr, align 8, !tbaa !25
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 %1
  store ptr %7, ptr @heap_end, align 8, !tbaa !25
  store i64 0, ptr @heap_requested, align 8, !tbaa !24
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @check_heap_beebs(ptr noundef readnone captures(address) %0) local_unnamed_addr #8 {
  %2 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 %2
  %4 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %5 = icmp ule ptr %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @malloc_beebs(i64 noundef %0) local_unnamed_addr #13 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %18, label %3

3:                                                ; preds = %1
  %4 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 %0
  %6 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %7 = add i64 %6, %0
  %8 = ptrtoint ptr %5 to i64
  %9 = and i64 %8, 7
  %10 = icmp eq i64 %9, 0
  %11 = sub nuw nsw i64 8, %9
  %12 = select i1 %10, i64 0, i64 %11
  %13 = add i64 %7, %12
  %14 = getelementptr inbounds nuw i8, ptr %5, i64 %12
  store i64 %13, ptr @heap_requested, align 8, !tbaa !24
  %15 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %16 = icmp ugt ptr %14, %15
  br i1 %16, label %18, label %17

17:                                               ; preds = %3
  store ptr %14, ptr @heap_ptr, align 8, !tbaa !25
  br label %18

18:                                               ; preds = %17, %3, %1
  %19 = phi ptr [ null, %1 ], [ %4, %17 ], [ null, %3 ]
  ret ptr %19
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) local_unnamed_addr #16 {
  %3 = mul i64 %1, %0
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %22, label %5

5:                                                ; preds = %2
  %6 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 %3
  %8 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %9 = add i64 %8, %3
  %10 = ptrtoint ptr %7 to i64
  %11 = and i64 %10, 7
  %12 = icmp eq i64 %11, 0
  %13 = sub nuw nsw i64 8, %11
  %14 = select i1 %12, i64 0, i64 %13
  %15 = add i64 %9, %14
  %16 = getelementptr inbounds nuw i8, ptr %7, i64 %14
  store i64 %15, ptr @heap_requested, align 8, !tbaa !24
  %17 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %18 = icmp ugt ptr %16, %17
  br i1 %18, label %22, label %19

19:                                               ; preds = %5
  store ptr %16, ptr @heap_ptr, align 8, !tbaa !25
  %20 = icmp eq ptr %6, null
  br i1 %20, label %22, label %21

21:                                               ; preds = %19
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %6, i8 0, i64 %3, i1 false)
  br label %22

22:                                               ; preds = %21, %19, %5, %2
  %23 = phi ptr [ null, %19 ], [ %6, %21 ], [ null, %2 ], [ null, %5 ]
  ret ptr %23
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @realloc_beebs(ptr noundef readonly captures(address_is_null) %0, i64 noundef %1) local_unnamed_addr #10 {
  %3 = ptrtoint ptr %0 to i64
  %4 = icmp eq ptr %0, null
  %5 = icmp eq i64 %1, 0
  %6 = or i1 %4, %5
  br i1 %6, label %96, label %7

7:                                                ; preds = %2
  %8 = load ptr, ptr @heap_ptr, align 8, !tbaa !25
  %9 = ptrtoint ptr %8 to i64
  %10 = getelementptr inbounds nuw i8, ptr %8, i64 %1
  %11 = load i64, ptr @heap_requested, align 8, !tbaa !24
  %12 = add i64 %11, %1
  %13 = ptrtoint ptr %10 to i64
  %14 = and i64 %13, 7
  %15 = icmp eq i64 %14, 0
  %16 = sub nuw nsw i64 8, %14
  %17 = select i1 %15, i64 0, i64 %16
  %18 = add i64 %12, %17
  %19 = getelementptr inbounds nuw i8, ptr %10, i64 %17
  store i64 %18, ptr @heap_requested, align 8, !tbaa !24
  %20 = load ptr, ptr @heap_end, align 8, !tbaa !25
  %21 = icmp ugt ptr %19, %20
  br i1 %21, label %96, label %22

22:                                               ; preds = %7
  store ptr %19, ptr @heap_ptr, align 8, !tbaa !25
  %23 = icmp eq ptr %8, null
  br i1 %23, label %96, label %24

24:                                               ; preds = %22
  %25 = icmp ult i64 %1, 4
  %26 = sub i64 %9, %3
  %27 = icmp ult i64 %26, 32
  %28 = or i1 %25, %27
  br i1 %28, label %60, label %29

29:                                               ; preds = %24
  %30 = icmp ult i64 %1, 32
  br i1 %30, label %48, label %31

31:                                               ; preds = %29
  %32 = and i64 %1, 28
  %33 = and i64 %1, -32
  br label %34

34:                                               ; preds = %34, %31
  %35 = phi i64 [ 0, %31 ], [ %42, %34 ]
  %36 = getelementptr inbounds nuw i8, ptr %0, i64 %35
  %37 = getelementptr inbounds nuw i8, ptr %36, i64 16
  %38 = load <16 x i8>, ptr %36, align 1, !tbaa !17
  %39 = load <16 x i8>, ptr %37, align 1, !tbaa !17
  %40 = getelementptr inbounds nuw i8, ptr %8, i64 %35
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 16
  store <16 x i8> %38, ptr %40, align 1, !tbaa !17
  store <16 x i8> %39, ptr %41, align 1, !tbaa !17
  %42 = add nuw i64 %35, 32
  %43 = icmp eq i64 %42, %33
  br i1 %43, label %44, label %34, !llvm.loop !27

44:                                               ; preds = %34
  %45 = icmp eq i64 %1, %33
  br i1 %45, label %96, label %46

46:                                               ; preds = %44
  %47 = icmp eq i64 %32, 0
  br i1 %47, label %60, label %48, !prof !30

48:                                               ; preds = %46, %29
  %49 = phi i64 [ %33, %46 ], [ 0, %29 ]
  %50 = and i64 %1, -4
  br label %51

51:                                               ; preds = %51, %48
  %52 = phi i64 [ %49, %48 ], [ %56, %51 ]
  %53 = getelementptr inbounds nuw i8, ptr %0, i64 %52
  %54 = load <4 x i8>, ptr %53, align 1, !tbaa !17
  %55 = getelementptr inbounds nuw i8, ptr %8, i64 %52
  store <4 x i8> %54, ptr %55, align 1, !tbaa !17
  %56 = add nuw i64 %52, 4
  %57 = icmp eq i64 %56, %50
  br i1 %57, label %58, label %51, !llvm.loop !31

58:                                               ; preds = %51
  %59 = icmp eq i64 %1, %50
  br i1 %59, label %96, label %60

60:                                               ; preds = %58, %46, %24
  %61 = phi i64 [ 0, %24 ], [ %33, %46 ], [ %50, %58 ]
  %62 = and i64 %1, 3
  %63 = icmp eq i64 %62, 0
  br i1 %63, label %73, label %64

64:                                               ; preds = %64, %60
  %65 = phi i64 [ %70, %64 ], [ %61, %60 ]
  %66 = phi i64 [ %71, %64 ], [ 0, %60 ]
  %67 = getelementptr inbounds nuw i8, ptr %0, i64 %65
  %68 = load i8, ptr %67, align 1, !tbaa !17
  %69 = getelementptr inbounds nuw i8, ptr %8, i64 %65
  store i8 %68, ptr %69, align 1, !tbaa !17
  %70 = add nuw i64 %65, 1
  %71 = add i64 %66, 1
  %72 = icmp eq i64 %71, %62
  br i1 %72, label %73, label %64, !llvm.loop !32

73:                                               ; preds = %64, %60
  %74 = phi i64 [ %61, %60 ], [ %70, %64 ]
  %75 = sub i64 %61, %1
  %76 = icmp ugt i64 %75, -4
  br i1 %76, label %96, label %77

77:                                               ; preds = %77, %73
  %78 = phi i64 [ %94, %77 ], [ %74, %73 ]
  %79 = getelementptr inbounds nuw i8, ptr %0, i64 %78
  %80 = load i8, ptr %79, align 1, !tbaa !17
  %81 = getelementptr inbounds nuw i8, ptr %8, i64 %78
  store i8 %80, ptr %81, align 1, !tbaa !17
  %82 = add nuw i64 %78, 1
  %83 = getelementptr inbounds nuw i8, ptr %0, i64 %82
  %84 = load i8, ptr %83, align 1, !tbaa !17
  %85 = getelementptr inbounds nuw i8, ptr %8, i64 %82
  store i8 %84, ptr %85, align 1, !tbaa !17
  %86 = add nuw i64 %78, 2
  %87 = getelementptr inbounds nuw i8, ptr %0, i64 %86
  %88 = load i8, ptr %87, align 1, !tbaa !17
  %89 = getelementptr inbounds nuw i8, ptr %8, i64 %86
  store i8 %88, ptr %89, align 1, !tbaa !17
  %90 = add nuw i64 %78, 3
  %91 = getelementptr inbounds nuw i8, ptr %0, i64 %90
  %92 = load i8, ptr %91, align 1, !tbaa !17
  %93 = getelementptr inbounds nuw i8, ptr %8, i64 %90
  store i8 %92, ptr %93, align 1, !tbaa !17
  %94 = add nuw i64 %78, 4
  %95 = icmp eq i64 %94, %1
  br i1 %95, label %96, label %77, !llvm.loop !34

96:                                               ; preds = %77, %73, %58, %44, %22, %7, %2
  %97 = phi ptr [ null, %2 ], [ null, %7 ], [ null, %22 ], [ %8, %44 ], [ %8, %58 ], [ %8, %77 ], [ %8, %73 ]
  ret ptr %97
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @free_beebs(ptr noundef readnone captures(none) %0) local_unnamed_addr #9 {
  ret void
}

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
