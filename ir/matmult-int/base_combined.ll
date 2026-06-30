; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@llvm.compiler.used = appending global [1 x ptr] [ptr @main], section "llvm.metadata"
@Seed = dso_local local_unnamed_addr global i32 0, align 4
@ArrayA_ref = dso_local local_unnamed_addr global [20 x [20 x i64]] zeroinitializer, align 16
@ArrayB_ref = dso_local local_unnamed_addr global [20 x [20 x i64]] zeroinitializer, align 16
@__const.verify_benchmark.exp = private unnamed_addr constant [20 x [20 x i64]] [[20 x i64] [i64 291018000, i64 315000075, i64 279049970, i64 205074215, i64 382719905, i64 302595865, i64 348060915, i64 308986330, i64 343160760, i64 307099935, i64 292564810, i64 240954510, i64 232755815, i64 246511665, i64 328466830, i64 263664375, i64 324016395, i64 334656070, i64 285978755, i64 345370360], [20 x i64] [i64 252241835, i64 333432715, i64 299220275, i64 247745815, i64 422508990, i64 316728505, i64 359662270, i64 277775280, i64 323336795, i64 320656600, i64 249903690, i64 251499360, i64 242195700, i64 263484280, i64 348207635, i64 289485100, i64 328607555, i64 300799835, i64 269351410, i64 305703460], [20 x i64] [i64 304901010, i64 316252815, i64 263230275, i64 208939015, i64 421993740, i64 335002930, i64 348571170, i64 280992155, i64 289749970, i64 259701175, i64 295249990, i64 310900035, i64 250896625, i64 250154105, i64 315096035, i64 236364800, i64 312879355, i64 312580685, i64 275998435, i64 344137885], [20 x i64] [i64 286700525, i64 325985600, i64 253054970, i64 224361490, i64 353502130, i64 306544290, i64 323492140, i64 259123905, i64 307731610, i64 282414410, i64 281127810, i64 246936935, i64 207890815, i64 233789540, i64 339836730, i64 277296350, i64 319925620, i64 307470895, i64 290537580, i64 292297535], [20 x i64] [i64 272571255, i64 377663320, i64 304545985, i64 263001340, i64 375034885, i64 325423710, i64 410620380, i64 313191730, i64 356989815, i64 308508355, i64 218003850, i64 272487135, i64 266000220, i64 264734710, i64 367539620, i64 304146675, i64 355295500, i64 276019740, i64 251415695, i64 301225235], [20 x i64] [i64 272547900, i64 321522300, i64 288294345, i64 247748015, i64 389912855, i64 331874890, i64 370798315, i64 315467255, i64 367554485, i64 311947660, i64 258809685, i64 270536510, i64 256730515, i64 287143040, i64 363087030, i64 285672775, i64 353670120, i64 304219695, i64 274897255, i64 324684660], [20 x i64] [i64 233123995, i64 227142480, i64 212655155, i64 198592290, i64 345335250, i64 302661845, i64 253374925, i64 233243305, i64 233750030, i64 224590040, i64 200404820, i64 250791135, i64 234405760, i64 211723645, i64 280630165, i64 185245875, i64 296423665, i64 276278575, i64 252368265, i64 278726535], [20 x i64] [i64 277690535, i64 339615440, i64 320921550, i64 307114315, i64 400187215, i64 334374655, i64 376286920, i64 295993530, i64 362988020, i64 356272700, i64 293965465, i64 261574710, i64 259690975, i64 263037705, i64 416748985, i64 274683275, i64 385571030, i64 402782385, i64 323927010, i64 362778710], [20 x i64] [i64 267168970, i64 323401680, i64 279474330, i64 201934365, i64 362624300, i64 330736145, i64 371793675, i64 299650280, i64 333646005, i64 264791490, i64 215918320, i64 277512760, i64 264068435, i64 234555295, i64 321772515, i64 217507025, i64 310372440, i64 317544750, i64 245525965, i64 343183435], [20 x i64] [i64 281293570, i64 326519505, i64 233494705, i64 238516065, i64 297038200, i64 266273420, i64 349521550, i64 259343530, i64 306032255, i64 266397915, i64 210274920, i64 263743085, i64 231689610, i64 251949545, i64 293562740, i64 226822900, i64 309225440, i64 286212000, i64 206108715, i64 236678985], [20 x i64] [i64 288404350, i64 310319375, i64 282695670, i64 244150740, i64 426489380, i64 387525790, i64 342018190, i64 326086505, i64 352250260, i64 319997735, i64 300645835, i64 284822660, i64 271837440, i64 274000415, i64 361826730, i64 252399600, i64 348582320, i64 375813820, i64 316588255, i64 322499110], [20 x i64] [i64 273368780, i64 329706295, i64 288668335, i64 234501665, i64 381962610, i64 343186285, i64 337520205, i64 259637405, i64 295755465, i64 284778105, i64 205310525, i64 249598310, i64 256662470, i64 251533535, i64 336159770, i64 249342150, i64 333559450, i64 329296590, i64 278254845, i64 300673860], [20 x i64] [i64 318589575, i64 315522800, i64 260632295, i64 250009765, i64 337127730, i64 312810490, i64 346698590, i64 260810030, i64 388289910, i64 337081285, i64 283635410, i64 208148610, i64 234123865, i64 259653165, i64 370115255, i64 243311450, i64 377808245, i64 358786770, i64 286839730, i64 321912835], [20 x i64] [i64 229541925, i64 253967450, i64 223002545, i64 202302515, i64 303446955, i64 268472740, i64 285580065, i64 211013405, i64 287677960, i64 279773910, i64 227377310, i64 197461135, i64 222469715, i64 179536615, i64 306957380, i64 178407075, i64 281051570, i64 279718120, i64 234868230, i64 288991535], [20 x i64] [i64 290692955, i64 317729070, i64 297868235, i64 213450065, i64 469270935, i64 375344910, i64 326987580, i64 334565680, i64 325300040, i64 290325655, i64 254703825, i64 284914960, i64 245773820, i64 276641510, i64 323510795, i64 271034400, i64 337424250, i64 360011440, i64 281515520, i64 331261535], [20 x i64] [i64 287075125, i64 313194850, i64 269889345, i64 208109115, i64 420653930, i64 331900290, i64 355440665, i64 318065155, i64 343785360, i64 302163035, i64 308959360, i64 312666110, i64 268997740, i64 288557415, i64 370158305, i64 205012650, i64 318198795, i64 384484520, i64 316450105, i64 378714460], [20 x i64] [i64 278680580, i64 356815220, i64 307597060, i64 216073365, i64 390879235, i64 358775185, i64 358895230, i64 306434180, i64 315569040, i64 272688130, i64 249424325, i64 274584610, i64 273530970, i64 265450585, i64 325127920, i64 312802050, i64 317134900, i64 298518590, i64 269975470, i64 332586535], [20 x i64] [i64 245629780, i64 267021570, i64 234689035, i64 208808065, i64 366356035, i64 267059560, i64 349348005, i64 270158755, i64 348048340, i64 291550930, i64 272717800, i64 259714410, i64 236033845, i64 280627610, i64 335089770, i64 176610475, i64 259339950, i64 322752840, i64 236218295, i64 329687310], [20 x i64] [i64 226517370, i64 272306005, i64 271484080, i64 216145515, i64 400972075, i64 288475645, i64 332969550, i64 338410905, i64 329052205, i64 330392265, i64 306488095, i64 271979085, i64 232795960, i64 257593945, i64 339558165, i64 202700275, i64 320622065, i64 386350450, i64 315344865, i64 329233410], [20 x i64] [i64 224852610, i64 231292540, i64 236945875, i64 243273740, i64 336327040, i64 305144680, i64 248261920, i64 191671605, i64 241699245, i64 263085200, i64 198883715, i64 175742885, i64 202517850, i64 172427630, i64 296304160, i64 209188850, i64 326546955, i64 252990460, i64 238844535, i64 289753485]], align 16
@ResultArray = dso_local global [20 x [20 x i64]] zeroinitializer, align 16
@ArrayA = dso_local local_unnamed_addr global [20 x [20 x i64]] zeroinitializer, align 16
@ArrayB = dso_local local_unnamed_addr global [20 x [20 x i64]] zeroinitializer, align 16
@seed = internal unnamed_addr global i64 0, align 8
@heap_ptr = internal unnamed_addr global ptr null, align 8
@heap_end = internal unnamed_addr global ptr null, align 8
@heap_requested = internal unnamed_addr global i64 0, align 8

; Function Attrs: nounwind sspstrong uwtable
define dso_local range(i32 0, 2) i32 @main(i32 %0, ptr readnone captures(none) %1) #0 {
  %3 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(ptr nonnull %3)
  tail call void @initialise_board() #16
  tail call void @initialise_benchmark() #16
  tail call void @warm_caches(i32 noundef 1) #16
  tail call void @start_trigger() #16
  br label %9

4:                                                ; preds = %9
  tail call void @stop_trigger() #16
  %5 = load volatile i32, ptr %3, align 4, !tbaa !1
  %6 = tail call i32 @verify_benchmark(i32 noundef %5) #16
  %7 = icmp eq i32 %6, 0
  %8 = zext i1 %7 to i32
  call void @llvm.lifetime.end.p0(ptr nonnull %3)
  ret i32 %8

9:                                                ; preds = %9, %2
  %10 = phi i32 [ 0, %2 ], [ %13, %9 ]
  %11 = tail call i32 @benchmark() #16
  store volatile i32 %11, ptr %3, align 4, !tbaa !1
  %12 = load volatile i32, ptr %3, align 4, !tbaa !1
  tail call void asm sideeffect "", "r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 %12) #16, !srcloc !9
  %13 = add nuw nsw i32 %10, 1
  %14 = icmp eq i32 %13, 10000
  br i1 %14, label %4, label %9, !llvm.loop !10
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(ptr captures(none)) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(ptr captures(none)) #1

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local range(i32 0, 2) i32 @values_match(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i64 %0, %1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #3 {
  tail call fastcc void @benchmark_body(i32 noundef 1, i32 noundef %0)
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define internal fastcc void @benchmark_body(i32 noundef range(i32 1, 40) %0, i32 noundef %1) unnamed_addr #4 {
  %3 = icmp eq i32 %1, 0
  br label %4

4:                                                ; preds = %7, %2
  %5 = phi i32 [ 0, %2 ], [ %8, %7 ]
  br i1 %3, label %7, label %10

6:                                                ; preds = %7
  ret void

7:                                                ; preds = %142, %4
  %8 = add nuw nsw i32 %5, 1
  %9 = icmp eq i32 %8, %0
  br i1 %9, label %6, label %4, !llvm.loop !12

10:                                               ; preds = %142, %4
  %11 = phi i32 [ %143, %142 ], [ 0, %4 ]
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(3200) @ArrayA, ptr noundef nonnull align 16 dereferenceable(3200) @ArrayA_ref, i64 3200, i1 false)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(3200) @ArrayB, ptr noundef nonnull align 16 dereferenceable(3200) @ArrayB_ref, i64 3200, i1 false)
  br label %12

12:                                               ; preds = %139, %10
  %13 = phi i64 [ 0, %10 ], [ %140, %139 ]
  %14 = getelementptr inbounds nuw [20 x i64], ptr @ResultArray, i64 %13
  %15 = getelementptr inbounds nuw [20 x i64], ptr @ArrayA, i64 %13
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %17 = load i64, ptr %16, align 16, !tbaa !13
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 40
  %19 = load i64, ptr %18, align 8, !tbaa !13
  %20 = getelementptr inbounds nuw i8, ptr %15, i64 48
  %21 = load i64, ptr %20, align 16, !tbaa !13
  %22 = getelementptr inbounds nuw i8, ptr %15, i64 56
  %23 = load i64, ptr %22, align 8, !tbaa !13
  %24 = getelementptr inbounds nuw i8, ptr %15, i64 64
  %25 = load i64, ptr %24, align 16, !tbaa !13
  %26 = getelementptr inbounds nuw i8, ptr %15, i64 72
  %27 = load i64, ptr %26, align 8, !tbaa !13
  %28 = getelementptr inbounds nuw i8, ptr %15, i64 80
  %29 = load i64, ptr %28, align 16, !tbaa !13
  %30 = getelementptr inbounds nuw i8, ptr %15, i64 88
  %31 = load i64, ptr %30, align 8, !tbaa !13
  %32 = getelementptr inbounds nuw i8, ptr %15, i64 96
  %33 = load i64, ptr %32, align 16, !tbaa !13
  %34 = getelementptr inbounds nuw i8, ptr %15, i64 104
  %35 = load i64, ptr %34, align 8, !tbaa !13
  %36 = getelementptr inbounds nuw i8, ptr %15, i64 112
  %37 = load i64, ptr %36, align 16, !tbaa !13
  %38 = getelementptr inbounds nuw i8, ptr %15, i64 120
  %39 = load i64, ptr %38, align 8, !tbaa !13
  %40 = getelementptr inbounds nuw i8, ptr %15, i64 128
  %41 = load i64, ptr %40, align 16, !tbaa !13
  %42 = getelementptr inbounds nuw i8, ptr %15, i64 136
  %43 = load i64, ptr %42, align 8, !tbaa !13
  %44 = getelementptr inbounds nuw i8, ptr %15, i64 144
  %45 = load i64, ptr %44, align 16, !tbaa !13
  %46 = load i64, ptr %15, align 16, !tbaa !13
  %47 = getelementptr inbounds nuw i8, ptr %15, i64 8
  %48 = load i64, ptr %47, align 8, !tbaa !13
  %49 = getelementptr inbounds nuw i8, ptr %15, i64 16
  %50 = load i64, ptr %49, align 16, !tbaa !13
  %51 = getelementptr inbounds nuw i8, ptr %15, i64 24
  %52 = load i64, ptr %51, align 8, !tbaa !13
  %53 = getelementptr inbounds nuw i8, ptr %15, i64 152
  %54 = load i64, ptr %53, align 8, !tbaa !13
  br label %55

55:                                               ; preds = %55, %12
  %56 = phi i64 [ 0, %12 ], [ %137, %55 ]
  %57 = getelementptr inbounds nuw i64, ptr %14, i64 %56
  %58 = getelementptr inbounds nuw i64, ptr @ArrayB, i64 %56
  %59 = load i64, ptr %58, align 8, !tbaa !13
  %60 = mul nsw i64 %59, %46
  %61 = getelementptr inbounds nuw i8, ptr %58, i64 160
  %62 = load i64, ptr %61, align 8, !tbaa !13
  %63 = mul nsw i64 %62, %48
  %64 = add nsw i64 %63, %60
  %65 = getelementptr inbounds nuw i8, ptr %58, i64 320
  %66 = load i64, ptr %65, align 8, !tbaa !13
  %67 = mul nsw i64 %66, %50
  %68 = add nsw i64 %67, %64
  %69 = getelementptr inbounds nuw i8, ptr %58, i64 480
  %70 = load i64, ptr %69, align 8, !tbaa !13
  %71 = mul nsw i64 %70, %52
  %72 = add nsw i64 %71, %68
  %73 = getelementptr inbounds nuw i8, ptr %58, i64 640
  %74 = load i64, ptr %73, align 8, !tbaa !13
  %75 = mul nsw i64 %74, %17
  %76 = add nsw i64 %75, %72
  %77 = getelementptr inbounds nuw i8, ptr %58, i64 800
  %78 = load i64, ptr %77, align 8, !tbaa !13
  %79 = mul nsw i64 %78, %19
  %80 = add nsw i64 %79, %76
  %81 = getelementptr inbounds nuw i8, ptr %58, i64 960
  %82 = load i64, ptr %81, align 8, !tbaa !13
  %83 = mul nsw i64 %82, %21
  %84 = add nsw i64 %83, %80
  %85 = getelementptr inbounds nuw i8, ptr %58, i64 1120
  %86 = load i64, ptr %85, align 8, !tbaa !13
  %87 = mul nsw i64 %86, %23
  %88 = add nsw i64 %87, %84
  %89 = getelementptr inbounds nuw i8, ptr %58, i64 1280
  %90 = load i64, ptr %89, align 8, !tbaa !13
  %91 = mul nsw i64 %90, %25
  %92 = add nsw i64 %91, %88
  %93 = getelementptr inbounds nuw i8, ptr %58, i64 1440
  %94 = load i64, ptr %93, align 8, !tbaa !13
  %95 = mul nsw i64 %94, %27
  %96 = add nsw i64 %95, %92
  %97 = getelementptr inbounds nuw i8, ptr %58, i64 1600
  %98 = load i64, ptr %97, align 8, !tbaa !13
  %99 = mul nsw i64 %98, %29
  %100 = add nsw i64 %99, %96
  %101 = getelementptr inbounds nuw i8, ptr %58, i64 1760
  %102 = load i64, ptr %101, align 8, !tbaa !13
  %103 = mul nsw i64 %102, %31
  %104 = add nsw i64 %103, %100
  %105 = getelementptr inbounds nuw i8, ptr %58, i64 1920
  %106 = load i64, ptr %105, align 8, !tbaa !13
  %107 = mul nsw i64 %106, %33
  %108 = add nsw i64 %107, %104
  %109 = getelementptr inbounds nuw i8, ptr %58, i64 2080
  %110 = load i64, ptr %109, align 8, !tbaa !13
  %111 = mul nsw i64 %110, %35
  %112 = add nsw i64 %111, %108
  %113 = getelementptr inbounds nuw i8, ptr %58, i64 2240
  %114 = load i64, ptr %113, align 8, !tbaa !13
  %115 = mul nsw i64 %114, %37
  %116 = add nsw i64 %115, %112
  %117 = getelementptr inbounds nuw i8, ptr %58, i64 2400
  %118 = load i64, ptr %117, align 8, !tbaa !13
  %119 = mul nsw i64 %118, %39
  %120 = add nsw i64 %119, %116
  %121 = getelementptr inbounds nuw i8, ptr %58, i64 2560
  %122 = load i64, ptr %121, align 8, !tbaa !13
  %123 = mul nsw i64 %122, %41
  %124 = add nsw i64 %123, %120
  %125 = getelementptr inbounds nuw i8, ptr %58, i64 2720
  %126 = load i64, ptr %125, align 8, !tbaa !13
  %127 = mul nsw i64 %126, %43
  %128 = add nsw i64 %127, %124
  %129 = getelementptr inbounds nuw i8, ptr %58, i64 2880
  %130 = load i64, ptr %129, align 8, !tbaa !13
  %131 = mul nsw i64 %130, %45
  %132 = add nsw i64 %131, %128
  %133 = getelementptr inbounds nuw i8, ptr %58, i64 3040
  %134 = load i64, ptr %133, align 8, !tbaa !13
  %135 = mul nsw i64 %134, %54
  %136 = add nsw i64 %135, %132
  store i64 %136, ptr %57, align 8, !tbaa !13
  %137 = add nuw nsw i64 %56, 1
  %138 = icmp eq i64 %137, 20
  br i1 %138, label %139, label %55, !llvm.loop !15

139:                                              ; preds = %55
  %140 = add nuw nsw i64 %13, 1
  %141 = icmp eq i64 %140, 20
  br i1 %141, label %142, label %12, !llvm.loop !16

142:                                              ; preds = %139
  %143 = add nuw i32 %11, 1
  %144 = icmp eq i32 %143, %1
  br i1 %144, label %7, label %10, !llvm.loop !17
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #5

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local noundef i32 @benchmark() local_unnamed_addr #6 {
  tail call fastcc void @benchmark_body(i32 noundef 39, i32 noundef 1)
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @InitSeed() local_unnamed_addr #7 {
  store i32 0, ptr @Seed, align 4, !tbaa !1
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @Test(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #8 {
  br label %4

4:                                                ; preds = %33, %3
  %5 = phi i64 [ 0, %3 ], [ %34, %33 ]
  %6 = getelementptr inbounds nuw [20 x i64], ptr %2, i64 %5
  %7 = getelementptr inbounds nuw [20 x i64], ptr %0, i64 %5
  br label %8

8:                                                ; preds = %30, %4
  %9 = phi i64 [ 0, %4 ], [ %31, %30 ]
  %10 = getelementptr inbounds nuw i64, ptr %6, i64 %9
  store i64 0, ptr %10, align 8, !tbaa !13
  %11 = getelementptr inbounds nuw i64, ptr %1, i64 %9
  br label %12

12:                                               ; preds = %12, %8
  %13 = phi i64 [ 0, %8 ], [ %28, %12 ]
  %14 = phi i64 [ 0, %8 ], [ %27, %12 ]
  %15 = getelementptr inbounds nuw i64, ptr %7, i64 %13
  %16 = load i64, ptr %15, align 8, !tbaa !13
  %17 = getelementptr inbounds nuw [20 x i64], ptr %11, i64 %13
  %18 = load i64, ptr %17, align 8, !tbaa !13
  %19 = mul nsw i64 %18, %16
  %20 = add nsw i64 %19, %14
  store i64 %20, ptr %10, align 8, !tbaa !13
  %21 = or disjoint i64 %13, 1
  %22 = getelementptr inbounds nuw i64, ptr %7, i64 %21
  %23 = load i64, ptr %22, align 8, !tbaa !13
  %24 = getelementptr inbounds nuw [20 x i64], ptr %11, i64 %21
  %25 = load i64, ptr %24, align 8, !tbaa !13
  %26 = mul nsw i64 %25, %23
  %27 = add nsw i64 %26, %20
  store i64 %27, ptr %10, align 8, !tbaa !13
  %28 = add nuw nsw i64 %13, 2
  %29 = icmp eq i64 %28, 20
  br i1 %29, label %30, label %12, !llvm.loop !18

30:                                               ; preds = %12
  %31 = add nuw nsw i64 %9, 1
  %32 = icmp eq i64 %31, 20
  br i1 %32, label %33, label %8, !llvm.loop !15

33:                                               ; preds = %30
  %34 = add nuw nsw i64 %5, 1
  %35 = icmp eq i64 %34, 20
  br i1 %35, label %36, label %4, !llvm.loop !16

36:                                               ; preds = %33
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @Multiply(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #8 {
  br label %4

4:                                                ; preds = %33, %3
  %5 = phi i64 [ 0, %3 ], [ %34, %33 ]
  %6 = getelementptr inbounds nuw [20 x i64], ptr %2, i64 %5
  %7 = getelementptr inbounds nuw [20 x i64], ptr %0, i64 %5
  br label %8

8:                                                ; preds = %30, %4
  %9 = phi i64 [ 0, %4 ], [ %31, %30 ]
  %10 = getelementptr inbounds nuw i64, ptr %6, i64 %9
  store i64 0, ptr %10, align 8, !tbaa !13
  %11 = getelementptr inbounds nuw i64, ptr %1, i64 %9
  br label %12

12:                                               ; preds = %12, %8
  %13 = phi i64 [ 0, %8 ], [ %28, %12 ]
  %14 = phi i64 [ 0, %8 ], [ %27, %12 ]
  %15 = getelementptr inbounds nuw i64, ptr %7, i64 %13
  %16 = load i64, ptr %15, align 8, !tbaa !13
  %17 = getelementptr inbounds nuw [20 x i64], ptr %11, i64 %13
  %18 = load i64, ptr %17, align 8, !tbaa !13
  %19 = mul nsw i64 %18, %16
  %20 = add nsw i64 %14, %19
  store i64 %20, ptr %10, align 8, !tbaa !13
  %21 = or disjoint i64 %13, 1
  %22 = getelementptr inbounds nuw i64, ptr %7, i64 %21
  %23 = load i64, ptr %22, align 8, !tbaa !13
  %24 = getelementptr inbounds nuw [20 x i64], ptr %11, i64 %21
  %25 = load i64, ptr %24, align 8, !tbaa !13
  %26 = mul nsw i64 %25, %23
  %27 = add nsw i64 %20, %26
  store i64 %27, ptr %10, align 8, !tbaa !13
  %28 = add nuw nsw i64 %13, 2
  %29 = icmp eq i64 %28, 20
  br i1 %29, label %30, label %12, !llvm.loop !18

30:                                               ; preds = %12
  %31 = add nuw nsw i64 %9, 1
  %32 = icmp eq i64 %31, 20
  br i1 %32, label %33, label %8, !llvm.loop !15

33:                                               ; preds = %30
  %34 = add nuw nsw i64 %5, 1
  %35 = icmp eq i64 %34, 20
  br i1 %35, label %36, label %4, !llvm.loop !16

36:                                               ; preds = %33
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 -8094, 8095) i32 @RandomInteger() local_unnamed_addr #9 {
  %1 = load i32, ptr @Seed, align 4, !tbaa !1
  %2 = mul nsw i32 %1, 133
  %3 = add nsw i32 %2, 81
  %4 = srem i32 %3, 8095
  store i32 %4, ptr @Seed, align 4, !tbaa !1
  ret i32 %4
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @initialise_benchmark() local_unnamed_addr #10 {
  br label %1

1:                                                ; preds = %21, %0
  %2 = phi i64 [ 0, %0 ], [ %22, %21 ]
  %3 = phi i32 [ 0, %0 ], [ %15, %21 ]
  %4 = getelementptr inbounds nuw [20 x i64], ptr @ArrayA_ref, i64 %2
  br label %5

5:                                                ; preds = %5, %1
  %6 = phi i64 [ 0, %1 ], [ %19, %5 ]
  %7 = phi i32 [ %3, %1 ], [ %15, %5 ]
  %8 = mul nuw nsw i32 %7, 133
  %9 = add nuw nsw i32 %8, 81
  %10 = urem i32 %9, 8095
  %11 = zext nneg i32 %10 to i64
  %12 = getelementptr inbounds nuw i64, ptr %4, i64 %6
  store i64 %11, ptr %12, align 16, !tbaa !13
  %13 = mul nuw nsw i32 %10, 133
  %14 = add nuw nsw i32 %13, 81
  %15 = urem i32 %14, 8095
  %16 = zext nneg i32 %15 to i64
  %17 = getelementptr inbounds nuw i64, ptr %4, i64 %6
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 8
  store i64 %16, ptr %18, align 8, !tbaa !13
  %19 = add nuw nsw i64 %6, 2
  %20 = icmp eq i64 %19, 20
  br i1 %20, label %21, label %5, !llvm.loop !19

21:                                               ; preds = %5
  %22 = add nuw nsw i64 %2, 1
  %23 = icmp eq i64 %22, 20
  br i1 %23, label %24, label %1, !llvm.loop !20

24:                                               ; preds = %44, %21
  %25 = phi i64 [ %45, %44 ], [ 0, %21 ]
  %26 = phi i32 [ %38, %44 ], [ %15, %21 ]
  %27 = getelementptr inbounds nuw [20 x i64], ptr @ArrayB_ref, i64 %25
  br label %28

28:                                               ; preds = %28, %24
  %29 = phi i64 [ 0, %24 ], [ %42, %28 ]
  %30 = phi i32 [ %26, %24 ], [ %38, %28 ]
  %31 = mul nuw nsw i32 %30, 133
  %32 = add nuw nsw i32 %31, 81
  %33 = urem i32 %32, 8095
  %34 = zext nneg i32 %33 to i64
  %35 = getelementptr inbounds nuw i64, ptr %27, i64 %29
  store i64 %34, ptr %35, align 16, !tbaa !13
  %36 = mul nuw nsw i32 %33, 133
  %37 = add nuw nsw i32 %36, 81
  %38 = urem i32 %37, 8095
  %39 = zext nneg i32 %38 to i64
  %40 = getelementptr inbounds nuw i64, ptr %27, i64 %29
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 8
  store i64 %39, ptr %41, align 8, !tbaa !13
  %42 = add nuw nsw i64 %29, 2
  %43 = icmp eq i64 %42, 20
  br i1 %43, label %44, label %28, !llvm.loop !21

44:                                               ; preds = %28
  %45 = add nuw nsw i64 %25, 1
  %46 = icmp eq i64 %45, 20
  br i1 %46, label %47, label %24, !llvm.loop !22

47:                                               ; preds = %44
  store i32 %38, ptr @Seed, align 4, !tbaa !1
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #11 {
  %2 = tail call i32 @bcmp(ptr noundef nonnull dereferenceable(3200) @ResultArray, ptr noundef nonnull dereferenceable(3200) @__const.verify_benchmark.exp, i64 3200)
  %3 = icmp eq i32 %2, 0
  %4 = zext i1 %3 to i32
  ret i32 %4
}

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare i32 @bcmp(ptr captures(none), ptr captures(none), i64) local_unnamed_addr #12

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @initialise_board() local_unnamed_addr #2 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @start_trigger() local_unnamed_addr #2 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @stop_trigger() local_unnamed_addr #2 {
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 32768) i32 @rand_beebs() local_unnamed_addr #9 {
  %1 = load i64, ptr @seed, align 8, !tbaa !13
  %2 = mul nuw nsw i64 %1, 1103515245
  %3 = add nuw nsw i64 %2, 12345
  %4 = and i64 %3, 2147483647
  store i64 %4, ptr @seed, align 8, !tbaa !13
  %5 = lshr i64 %4, 16
  %6 = trunc nuw nsw i64 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @srand_beebs(i32 noundef %0) local_unnamed_addr #7 {
  %2 = zext i32 %0 to i64
  store i64 %2, ptr @seed, align 8, !tbaa !13
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @init_heap_beebs(ptr noundef %0, i64 noundef %1) local_unnamed_addr #10 {
  %3 = and i64 %1, 7
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %6, label %5

5:                                                ; preds = %5, %2
  br label %5

6:                                                ; preds = %2
  store ptr %0, ptr @heap_ptr, align 8, !tbaa !23
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 %1
  store ptr %7, ptr @heap_end, align 8, !tbaa !23
  store i64 0, ptr @heap_requested, align 8, !tbaa !13
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @check_heap_beebs(ptr noundef readnone captures(address) %0) local_unnamed_addr #13 {
  %2 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 %2
  %4 = load ptr, ptr @heap_end, align 8, !tbaa !23
  %5 = icmp ule ptr %3, %4
  %6 = zext i1 %5 to i32
  ret i32 %6
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @malloc_beebs(i64 noundef %0) local_unnamed_addr #9 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %18, label %3

3:                                                ; preds = %1
  %4 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 %0
  %6 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %7 = add i64 %6, %0
  %8 = ptrtoint ptr %5 to i64
  %9 = and i64 %8, 7
  %10 = icmp eq i64 %9, 0
  %11 = sub nuw nsw i64 8, %9
  %12 = select i1 %10, i64 0, i64 %11
  %13 = add i64 %7, %12
  %14 = getelementptr inbounds nuw i8, ptr %5, i64 %12
  store i64 %13, ptr @heap_requested, align 8, !tbaa !13
  %15 = load ptr, ptr @heap_end, align 8, !tbaa !23
  %16 = icmp ugt ptr %14, %15
  br i1 %16, label %18, label %17

17:                                               ; preds = %3
  store ptr %14, ptr @heap_ptr, align 8, !tbaa !23
  br label %18

18:                                               ; preds = %17, %3, %1
  %19 = phi ptr [ null, %1 ], [ %4, %17 ], [ null, %3 ]
  ret ptr %19
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) local_unnamed_addr #14 {
  %3 = mul i64 %1, %0
  %4 = icmp eq i64 %3, 0
  br i1 %4, label %22, label %5

5:                                                ; preds = %2
  %6 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 %3
  %8 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %9 = add i64 %8, %3
  %10 = ptrtoint ptr %7 to i64
  %11 = and i64 %10, 7
  %12 = icmp eq i64 %11, 0
  %13 = sub nuw nsw i64 8, %11
  %14 = select i1 %12, i64 0, i64 %13
  %15 = add i64 %9, %14
  %16 = getelementptr inbounds nuw i8, ptr %7, i64 %14
  store i64 %15, ptr @heap_requested, align 8, !tbaa !13
  %17 = load ptr, ptr @heap_end, align 8, !tbaa !23
  %18 = icmp ugt ptr %16, %17
  br i1 %18, label %22, label %19

19:                                               ; preds = %5
  store ptr %16, ptr @heap_ptr, align 8, !tbaa !23
  %20 = icmp eq ptr %6, null
  br i1 %20, label %22, label %21

21:                                               ; preds = %19
  tail call void @llvm.memset.p0.i64(ptr nonnull align 1 %6, i8 0, i64 %3, i1 false)
  br label %22

22:                                               ; preds = %21, %19, %5, %2
  %23 = phi ptr [ null, %19 ], [ %6, %21 ], [ null, %2 ], [ null, %5 ]
  ret ptr %23
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #15

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @realloc_beebs(ptr noundef readonly captures(address_is_null) %0, i64 noundef %1) local_unnamed_addr #3 {
  %3 = ptrtoint ptr %0 to i64
  %4 = icmp eq ptr %0, null
  %5 = icmp eq i64 %1, 0
  %6 = or i1 %4, %5
  br i1 %6, label %96, label %7

7:                                                ; preds = %2
  %8 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %9 = ptrtoint ptr %8 to i64
  %10 = getelementptr inbounds nuw i8, ptr %8, i64 %1
  %11 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %12 = add i64 %11, %1
  %13 = ptrtoint ptr %10 to i64
  %14 = and i64 %13, 7
  %15 = icmp eq i64 %14, 0
  %16 = sub nuw nsw i64 8, %14
  %17 = select i1 %15, i64 0, i64 %16
  %18 = add i64 %12, %17
  %19 = getelementptr inbounds nuw i8, ptr %10, i64 %17
  store i64 %18, ptr @heap_requested, align 8, !tbaa !13
  %20 = load ptr, ptr @heap_end, align 8, !tbaa !23
  %21 = icmp ugt ptr %19, %20
  br i1 %21, label %96, label %22

22:                                               ; preds = %7
  store ptr %19, ptr @heap_ptr, align 8, !tbaa !23
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
  %38 = load <16 x i8>, ptr %36, align 1, !tbaa !25
  %39 = load <16 x i8>, ptr %37, align 1, !tbaa !25
  %40 = getelementptr inbounds nuw i8, ptr %8, i64 %35
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 16
  store <16 x i8> %38, ptr %40, align 1, !tbaa !25
  store <16 x i8> %39, ptr %41, align 1, !tbaa !25
  %42 = add nuw i64 %35, 32
  %43 = icmp eq i64 %42, %33
  br i1 %43, label %44, label %34, !llvm.loop !26

44:                                               ; preds = %34
  %45 = icmp eq i64 %1, %33
  br i1 %45, label %96, label %46

46:                                               ; preds = %44
  %47 = icmp eq i64 %32, 0
  br i1 %47, label %60, label %48, !prof !29

48:                                               ; preds = %46, %29
  %49 = phi i64 [ %33, %46 ], [ 0, %29 ]
  %50 = and i64 %1, -4
  br label %51

51:                                               ; preds = %51, %48
  %52 = phi i64 [ %49, %48 ], [ %56, %51 ]
  %53 = getelementptr inbounds nuw i8, ptr %0, i64 %52
  %54 = load <4 x i8>, ptr %53, align 1, !tbaa !25
  %55 = getelementptr inbounds nuw i8, ptr %8, i64 %52
  store <4 x i8> %54, ptr %55, align 1, !tbaa !25
  %56 = add nuw i64 %52, 4
  %57 = icmp eq i64 %56, %50
  br i1 %57, label %58, label %51, !llvm.loop !30

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
  %68 = load i8, ptr %67, align 1, !tbaa !25
  %69 = getelementptr inbounds nuw i8, ptr %8, i64 %65
  store i8 %68, ptr %69, align 1, !tbaa !25
  %70 = add nuw i64 %65, 1
  %71 = add i64 %66, 1
  %72 = icmp eq i64 %71, %62
  br i1 %72, label %73, label %64, !llvm.loop !31

73:                                               ; preds = %64, %60
  %74 = phi i64 [ %61, %60 ], [ %70, %64 ]
  %75 = sub i64 %61, %1
  %76 = icmp ugt i64 %75, -4
  br i1 %76, label %96, label %77

77:                                               ; preds = %77, %73
  %78 = phi i64 [ %94, %77 ], [ %74, %73 ]
  %79 = getelementptr inbounds nuw i8, ptr %0, i64 %78
  %80 = load i8, ptr %79, align 1, !tbaa !25
  %81 = getelementptr inbounds nuw i8, ptr %8, i64 %78
  store i8 %80, ptr %81, align 1, !tbaa !25
  %82 = add nuw i64 %78, 1
  %83 = getelementptr inbounds nuw i8, ptr %0, i64 %82
  %84 = load i8, ptr %83, align 1, !tbaa !25
  %85 = getelementptr inbounds nuw i8, ptr %8, i64 %82
  store i8 %84, ptr %85, align 1, !tbaa !25
  %86 = add nuw i64 %78, 2
  %87 = getelementptr inbounds nuw i8, ptr %0, i64 %86
  %88 = load i8, ptr %87, align 1, !tbaa !25
  %89 = getelementptr inbounds nuw i8, ptr %8, i64 %86
  store i8 %88, ptr %89, align 1, !tbaa !25
  %90 = add nuw i64 %78, 3
  %91 = getelementptr inbounds nuw i8, ptr %0, i64 %90
  %92 = load i8, ptr %91, align 1, !tbaa !25
  %93 = getelementptr inbounds nuw i8, ptr %8, i64 %90
  store i8 %92, ptr %93, align 1, !tbaa !25
  %94 = add nuw i64 %78, 4
  %95 = icmp eq i64 %94, %1
  br i1 %95, label %96, label %77, !llvm.loop !33

96:                                               ; preds = %77, %73, %58, %44, %22, %7, %2
  %97 = phi ptr [ null, %2 ], [ null, %7 ], [ null, %22 ], [ %8, %44 ], [ %8, %58 ], [ %8, %77 ], [ %8, %73 ]
  ret ptr %97
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @free_beebs(ptr noundef readnone captures(none) %0) local_unnamed_addr #2 {
  ret void
}

attributes #0 = { nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree norecurse nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nofree nounwind willreturn memory(argmem: read) }
attributes #13 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: write, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #16 = { nounwind }

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
!12 = distinct !{!12, !11}
!13 = !{!14, !14, i64 0}
!14 = !{!"long", !3, i64 0}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
!19 = distinct !{!19, !11}
!20 = distinct !{!20, !11}
!21 = distinct !{!21, !11}
!22 = distinct !{!22, !11}
!23 = !{!24, !24, i64 0}
!24 = !{!"any pointer", !3, i64 0}
!25 = !{!3, !3, i64 0}
!26 = distinct !{!26, !11, !27, !28}
!27 = !{!"llvm.loop.isvectorized", i32 1}
!28 = !{!"llvm.loop.unroll.runtime.disable"}
!29 = !{!"branch_weights", i32 4, i32 28}
!30 = distinct !{!30, !11, !27, !28}
!31 = distinct !{!31, !32}
!32 = !{!"llvm.loop.unroll.disable"}
!33 = distinct !{!33, !11, !27}
