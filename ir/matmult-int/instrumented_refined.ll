; ModuleID = 'ir/matmult-int/base_combined.ll'
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
  tail call void @initialise_board() #16
  tail call void @initialise_benchmark() #16
  tail call void @warm_caches(i32 noundef 1) #16
  tail call void @start_trigger() #16
  %4 = load i64, ptr @DynControlFlowCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynControlFlowCount, align 8
  br label %27

6:                                                ; preds = %27
  tail call void @stop_trigger() #16
  %7 = load volatile i32, ptr %3, align 4, !tbaa !1
  %8 = tail call i32 @verify_benchmark(i32 noundef %7) #16
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
  %29 = tail call i32 @benchmark() #16
  store volatile i32 %29, ptr %3, align 4, !tbaa !1
  %30 = load volatile i32, ptr %3, align 4, !tbaa !1
  tail call void asm sideeffect "", "r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 %30) #16, !srcloc !9
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local range(i32 0, 2) i32 @values_match(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = icmp eq i64 %0, %1
  %4 = zext i1 %3 to i32
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  %7 = load i64, ptr @DynALUCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynALUCount, align 8
  %9 = load i64, ptr @DynCastCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynCastCount, align 8
  ret i32 %4
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @warm_caches(i32 noundef %0) local_unnamed_addr #3 {
  tail call fastcc void @benchmark_body(i32 noundef 1, i32 noundef %0)
  %2 = load i64, ptr @DynControlFlowCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define internal fastcc void @benchmark_body(i32 noundef range(i32 1, 40) %0, i32 noundef %1) unnamed_addr #4 {
  %3 = icmp eq i32 %1, 0
  %4 = load i64, ptr @DynControlFlowCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynControlFlowCount, align 8
  %6 = load i64, ptr @DynALUCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynALUCount, align 8
  br label %8

8:                                                ; preds = %15, %2
  %9 = phi i32 [ 0, %2 ], [ %16, %15 ]
  %10 = load i64, ptr @DynControlFlowCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynControlFlowCount, align 8
  br i1 %3, label %15, label %22

12:                                               ; preds = %15
  %13 = load i64, ptr @DynControlFlowCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynControlFlowCount, align 8
  ret void

15:                                               ; preds = %176, %8
  %16 = add nuw nsw i32 %9, 1
  %17 = icmp eq i32 %16, %0
  %18 = load i64, ptr @DynControlFlowCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynControlFlowCount, align 8
  %20 = load i64, ptr @DynALUCount, align 8
  %21 = add i64 %20, 2
  store i64 %21, ptr @DynALUCount, align 8
  br i1 %17, label %12, label %8, !llvm.loop !12

22:                                               ; preds = %176, %8
  %23 = phi i32 [ %177, %176 ], [ 0, %8 ]
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(3200) @ArrayA, ptr noundef nonnull align 16 dereferenceable(3200) @ArrayA_ref, i64 3200, i1 false)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(3200) @ArrayB, ptr noundef nonnull align 16 dereferenceable(3200) @ArrayB_ref, i64 3200, i1 false)
  %24 = load i64, ptr @DynControlFlowCount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @DynControlFlowCount, align 8
  br label %26

26:                                               ; preds = %169, %22
  %27 = phi i64 [ 0, %22 ], [ %170, %169 ]
  %28 = getelementptr inbounds nuw [20 x i64], ptr @ResultArray, i64 %27
  %29 = getelementptr inbounds nuw [20 x i64], ptr @ArrayA, i64 %27
  %30 = getelementptr inbounds nuw i8, ptr %29, i64 32
  %31 = load i64, ptr %30, align 16, !tbaa !13
  %32 = getelementptr inbounds nuw i8, ptr %29, i64 40
  %33 = load i64, ptr %32, align 8, !tbaa !13
  %34 = getelementptr inbounds nuw i8, ptr %29, i64 48
  %35 = load i64, ptr %34, align 16, !tbaa !13
  %36 = getelementptr inbounds nuw i8, ptr %29, i64 56
  %37 = load i64, ptr %36, align 8, !tbaa !13
  %38 = getelementptr inbounds nuw i8, ptr %29, i64 64
  %39 = load i64, ptr %38, align 16, !tbaa !13
  %40 = getelementptr inbounds nuw i8, ptr %29, i64 72
  %41 = load i64, ptr %40, align 8, !tbaa !13
  %42 = getelementptr inbounds nuw i8, ptr %29, i64 80
  %43 = load i64, ptr %42, align 16, !tbaa !13
  %44 = getelementptr inbounds nuw i8, ptr %29, i64 88
  %45 = load i64, ptr %44, align 8, !tbaa !13
  %46 = getelementptr inbounds nuw i8, ptr %29, i64 96
  %47 = load i64, ptr %46, align 16, !tbaa !13
  %48 = getelementptr inbounds nuw i8, ptr %29, i64 104
  %49 = load i64, ptr %48, align 8, !tbaa !13
  %50 = getelementptr inbounds nuw i8, ptr %29, i64 112
  %51 = load i64, ptr %50, align 16, !tbaa !13
  %52 = getelementptr inbounds nuw i8, ptr %29, i64 120
  %53 = load i64, ptr %52, align 8, !tbaa !13
  %54 = getelementptr inbounds nuw i8, ptr %29, i64 128
  %55 = load i64, ptr %54, align 16, !tbaa !13
  %56 = getelementptr inbounds nuw i8, ptr %29, i64 136
  %57 = load i64, ptr %56, align 8, !tbaa !13
  %58 = getelementptr inbounds nuw i8, ptr %29, i64 144
  %59 = load i64, ptr %58, align 16, !tbaa !13
  %60 = load i64, ptr %29, align 16, !tbaa !13
  %61 = getelementptr inbounds nuw i8, ptr %29, i64 8
  %62 = load i64, ptr %61, align 8, !tbaa !13
  %63 = getelementptr inbounds nuw i8, ptr %29, i64 16
  %64 = load i64, ptr %63, align 16, !tbaa !13
  %65 = getelementptr inbounds nuw i8, ptr %29, i64 24
  %66 = load i64, ptr %65, align 8, !tbaa !13
  %67 = getelementptr inbounds nuw i8, ptr %29, i64 152
  %68 = load i64, ptr %67, align 8, !tbaa !13
  %69 = load i64, ptr @DynMemReadCount, align 8
  %70 = add i64 %69, 20
  store i64 %70, ptr @DynMemReadCount, align 8
  %71 = load i64, ptr @DynAddressMathCount, align 8
  %72 = add i64 %71, 21
  store i64 %72, ptr @DynAddressMathCount, align 8
  %73 = load i64, ptr @DynControlFlowCount, align 8
  %74 = add i64 %73, 1
  store i64 %74, ptr @DynControlFlowCount, align 8
  br label %75

75:                                               ; preds = %75, %26
  %76 = phi i64 [ 0, %26 ], [ %157, %75 ]
  %77 = getelementptr inbounds nuw i64, ptr %28, i64 %76
  %78 = getelementptr inbounds nuw i64, ptr @ArrayB, i64 %76
  %79 = load i64, ptr %78, align 8, !tbaa !13
  %80 = mul nsw i64 %79, %60
  %81 = getelementptr inbounds nuw i8, ptr %78, i64 160
  %82 = load i64, ptr %81, align 8, !tbaa !13
  %83 = mul nsw i64 %82, %62
  %84 = add nsw i64 %83, %80
  %85 = getelementptr inbounds nuw i8, ptr %78, i64 320
  %86 = load i64, ptr %85, align 8, !tbaa !13
  %87 = mul nsw i64 %86, %64
  %88 = add nsw i64 %87, %84
  %89 = getelementptr inbounds nuw i8, ptr %78, i64 480
  %90 = load i64, ptr %89, align 8, !tbaa !13
  %91 = mul nsw i64 %90, %66
  %92 = add nsw i64 %91, %88
  %93 = getelementptr inbounds nuw i8, ptr %78, i64 640
  %94 = load i64, ptr %93, align 8, !tbaa !13
  %95 = mul nsw i64 %94, %31
  %96 = add nsw i64 %95, %92
  %97 = getelementptr inbounds nuw i8, ptr %78, i64 800
  %98 = load i64, ptr %97, align 8, !tbaa !13
  %99 = mul nsw i64 %98, %33
  %100 = add nsw i64 %99, %96
  %101 = getelementptr inbounds nuw i8, ptr %78, i64 960
  %102 = load i64, ptr %101, align 8, !tbaa !13
  %103 = mul nsw i64 %102, %35
  %104 = add nsw i64 %103, %100
  %105 = getelementptr inbounds nuw i8, ptr %78, i64 1120
  %106 = load i64, ptr %105, align 8, !tbaa !13
  %107 = mul nsw i64 %106, %37
  %108 = add nsw i64 %107, %104
  %109 = getelementptr inbounds nuw i8, ptr %78, i64 1280
  %110 = load i64, ptr %109, align 8, !tbaa !13
  %111 = mul nsw i64 %110, %39
  %112 = add nsw i64 %111, %108
  %113 = getelementptr inbounds nuw i8, ptr %78, i64 1440
  %114 = load i64, ptr %113, align 8, !tbaa !13
  %115 = mul nsw i64 %114, %41
  %116 = add nsw i64 %115, %112
  %117 = getelementptr inbounds nuw i8, ptr %78, i64 1600
  %118 = load i64, ptr %117, align 8, !tbaa !13
  %119 = mul nsw i64 %118, %43
  %120 = add nsw i64 %119, %116
  %121 = getelementptr inbounds nuw i8, ptr %78, i64 1760
  %122 = load i64, ptr %121, align 8, !tbaa !13
  %123 = mul nsw i64 %122, %45
  %124 = add nsw i64 %123, %120
  %125 = getelementptr inbounds nuw i8, ptr %78, i64 1920
  %126 = load i64, ptr %125, align 8, !tbaa !13
  %127 = mul nsw i64 %126, %47
  %128 = add nsw i64 %127, %124
  %129 = getelementptr inbounds nuw i8, ptr %78, i64 2080
  %130 = load i64, ptr %129, align 8, !tbaa !13
  %131 = mul nsw i64 %130, %49
  %132 = add nsw i64 %131, %128
  %133 = getelementptr inbounds nuw i8, ptr %78, i64 2240
  %134 = load i64, ptr %133, align 8, !tbaa !13
  %135 = mul nsw i64 %134, %51
  %136 = add nsw i64 %135, %132
  %137 = getelementptr inbounds nuw i8, ptr %78, i64 2400
  %138 = load i64, ptr %137, align 8, !tbaa !13
  %139 = mul nsw i64 %138, %53
  %140 = add nsw i64 %139, %136
  %141 = getelementptr inbounds nuw i8, ptr %78, i64 2560
  %142 = load i64, ptr %141, align 8, !tbaa !13
  %143 = mul nsw i64 %142, %55
  %144 = add nsw i64 %143, %140
  %145 = getelementptr inbounds nuw i8, ptr %78, i64 2720
  %146 = load i64, ptr %145, align 8, !tbaa !13
  %147 = mul nsw i64 %146, %57
  %148 = add nsw i64 %147, %144
  %149 = getelementptr inbounds nuw i8, ptr %78, i64 2880
  %150 = load i64, ptr %149, align 8, !tbaa !13
  %151 = mul nsw i64 %150, %59
  %152 = add nsw i64 %151, %148
  %153 = getelementptr inbounds nuw i8, ptr %78, i64 3040
  %154 = load i64, ptr %153, align 8, !tbaa !13
  %155 = mul nsw i64 %154, %68
  %156 = add nsw i64 %155, %152
  store i64 %156, ptr %77, align 8, !tbaa !13
  %157 = add nuw nsw i64 %76, 1
  %158 = icmp eq i64 %157, 20
  %159 = load i64, ptr @DynMemReadCount, align 8
  %160 = add i64 %159, 20
  store i64 %160, ptr @DynMemReadCount, align 8
  %161 = load i64, ptr @DynMemWriteCount, align 8
  %162 = add i64 %161, 1
  store i64 %162, ptr @DynMemWriteCount, align 8
  %163 = load i64, ptr @DynAddressMathCount, align 8
  %164 = add i64 %163, 21
  store i64 %164, ptr @DynAddressMathCount, align 8
  %165 = load i64, ptr @DynControlFlowCount, align 8
  %166 = add i64 %165, 1
  store i64 %166, ptr @DynControlFlowCount, align 8
  %167 = load i64, ptr @DynALUCount, align 8
  %168 = add i64 %167, 41
  store i64 %168, ptr @DynALUCount, align 8
  br i1 %158, label %169, label %75, !llvm.loop !15

169:                                              ; preds = %75
  %170 = add nuw nsw i64 %27, 1
  %171 = icmp eq i64 %170, 20
  %172 = load i64, ptr @DynControlFlowCount, align 8
  %173 = add i64 %172, 1
  store i64 %173, ptr @DynControlFlowCount, align 8
  %174 = load i64, ptr @DynALUCount, align 8
  %175 = add i64 %174, 2
  store i64 %175, ptr @DynALUCount, align 8
  br i1 %171, label %176, label %26, !llvm.loop !16

176:                                              ; preds = %169
  %177 = add nuw i32 %23, 1
  %178 = icmp eq i32 %177, %1
  %179 = load i64, ptr @DynControlFlowCount, align 8
  %180 = add i64 %179, 1
  store i64 %180, ptr @DynControlFlowCount, align 8
  %181 = load i64, ptr @DynALUCount, align 8
  %182 = add i64 %181, 2
  store i64 %182, ptr @DynALUCount, align 8
  br i1 %178, label %15, label %22, !llvm.loop !17
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #5

; Function Attrs: nofree noinline norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local noundef i32 @benchmark() local_unnamed_addr #6 {
  tail call fastcc void @benchmark_body(i32 noundef 39, i32 noundef 1)
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @InitSeed() local_unnamed_addr #7 {
  store i32 0, ptr @Seed, align 4, !tbaa !1
  %1 = load i64, ptr @DynMemWriteCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynMemWriteCount, align 8
  %3 = load i64, ptr @DynControlFlowCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @Test(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #8 {
  %4 = load i64, ptr @DynControlFlowCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynControlFlowCount, align 8
  br label %6

6:                                                ; preds = %59, %3
  %7 = phi i64 [ 0, %3 ], [ %60, %59 ]
  %8 = getelementptr inbounds nuw [20 x i64], ptr %2, i64 %7
  %9 = getelementptr inbounds nuw [20 x i64], ptr %0, i64 %7
  %10 = load i64, ptr @DynAddressMathCount, align 8
  %11 = add i64 %10, 2
  store i64 %11, ptr @DynAddressMathCount, align 8
  %12 = load i64, ptr @DynControlFlowCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynControlFlowCount, align 8
  br label %14

14:                                               ; preds = %52, %6
  %15 = phi i64 [ 0, %6 ], [ %53, %52 ]
  %16 = getelementptr inbounds nuw i64, ptr %8, i64 %15
  store i64 0, ptr %16, align 8, !tbaa !13
  %17 = getelementptr inbounds nuw i64, ptr %1, i64 %15
  %18 = load i64, ptr @DynMemWriteCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynMemWriteCount, align 8
  %20 = load i64, ptr @DynAddressMathCount, align 8
  %21 = add i64 %20, 2
  store i64 %21, ptr @DynAddressMathCount, align 8
  %22 = load i64, ptr @DynControlFlowCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynControlFlowCount, align 8
  br label %24

24:                                               ; preds = %24, %14
  %25 = phi i64 [ 0, %14 ], [ %40, %24 ]
  %26 = phi i64 [ 0, %14 ], [ %39, %24 ]
  %27 = getelementptr inbounds nuw i64, ptr %9, i64 %25
  %28 = load i64, ptr %27, align 8, !tbaa !13
  %29 = getelementptr inbounds nuw [20 x i64], ptr %17, i64 %25
  %30 = load i64, ptr %29, align 8, !tbaa !13
  %31 = mul nsw i64 %30, %28
  %32 = add nsw i64 %31, %26
  store i64 %32, ptr %16, align 8, !tbaa !13
  %33 = or disjoint i64 %25, 1
  %34 = getelementptr inbounds nuw i64, ptr %9, i64 %33
  %35 = load i64, ptr %34, align 8, !tbaa !13
  %36 = getelementptr inbounds nuw [20 x i64], ptr %17, i64 %33
  %37 = load i64, ptr %36, align 8, !tbaa !13
  %38 = mul nsw i64 %37, %35
  %39 = add nsw i64 %38, %32
  store i64 %39, ptr %16, align 8, !tbaa !13
  %40 = add nuw nsw i64 %25, 2
  %41 = icmp eq i64 %40, 20
  %42 = load i64, ptr @DynMemReadCount, align 8
  %43 = add i64 %42, 4
  store i64 %43, ptr @DynMemReadCount, align 8
  %44 = load i64, ptr @DynMemWriteCount, align 8
  %45 = add i64 %44, 2
  store i64 %45, ptr @DynMemWriteCount, align 8
  %46 = load i64, ptr @DynAddressMathCount, align 8
  %47 = add i64 %46, 4
  store i64 %47, ptr @DynAddressMathCount, align 8
  %48 = load i64, ptr @DynControlFlowCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynControlFlowCount, align 8
  %50 = load i64, ptr @DynALUCount, align 8
  %51 = add i64 %50, 7
  store i64 %51, ptr @DynALUCount, align 8
  br i1 %41, label %52, label %24, !llvm.loop !18

52:                                               ; preds = %24
  %53 = add nuw nsw i64 %15, 1
  %54 = icmp eq i64 %53, 20
  %55 = load i64, ptr @DynControlFlowCount, align 8
  %56 = add i64 %55, 1
  store i64 %56, ptr @DynControlFlowCount, align 8
  %57 = load i64, ptr @DynALUCount, align 8
  %58 = add i64 %57, 2
  store i64 %58, ptr @DynALUCount, align 8
  br i1 %54, label %59, label %14, !llvm.loop !15

59:                                               ; preds = %52
  %60 = add nuw nsw i64 %7, 1
  %61 = icmp eq i64 %60, 20
  %62 = load i64, ptr @DynControlFlowCount, align 8
  %63 = add i64 %62, 1
  store i64 %63, ptr @DynControlFlowCount, align 8
  %64 = load i64, ptr @DynALUCount, align 8
  %65 = add i64 %64, 2
  store i64 %65, ptr @DynALUCount, align 8
  br i1 %61, label %66, label %6, !llvm.loop !16

66:                                               ; preds = %59
  %67 = load i64, ptr @DynControlFlowCount, align 8
  %68 = add i64 %67, 1
  store i64 %68, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @Multiply(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #8 {
  %4 = load i64, ptr @DynControlFlowCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynControlFlowCount, align 8
  br label %6

6:                                                ; preds = %59, %3
  %7 = phi i64 [ 0, %3 ], [ %60, %59 ]
  %8 = getelementptr inbounds nuw [20 x i64], ptr %2, i64 %7
  %9 = getelementptr inbounds nuw [20 x i64], ptr %0, i64 %7
  %10 = load i64, ptr @DynAddressMathCount, align 8
  %11 = add i64 %10, 2
  store i64 %11, ptr @DynAddressMathCount, align 8
  %12 = load i64, ptr @DynControlFlowCount, align 8
  %13 = add i64 %12, 1
  store i64 %13, ptr @DynControlFlowCount, align 8
  br label %14

14:                                               ; preds = %52, %6
  %15 = phi i64 [ 0, %6 ], [ %53, %52 ]
  %16 = getelementptr inbounds nuw i64, ptr %8, i64 %15
  store i64 0, ptr %16, align 8, !tbaa !13
  %17 = getelementptr inbounds nuw i64, ptr %1, i64 %15
  %18 = load i64, ptr @DynMemWriteCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynMemWriteCount, align 8
  %20 = load i64, ptr @DynAddressMathCount, align 8
  %21 = add i64 %20, 2
  store i64 %21, ptr @DynAddressMathCount, align 8
  %22 = load i64, ptr @DynControlFlowCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynControlFlowCount, align 8
  br label %24

24:                                               ; preds = %24, %14
  %25 = phi i64 [ 0, %14 ], [ %40, %24 ]
  %26 = phi i64 [ 0, %14 ], [ %39, %24 ]
  %27 = getelementptr inbounds nuw i64, ptr %9, i64 %25
  %28 = load i64, ptr %27, align 8, !tbaa !13
  %29 = getelementptr inbounds nuw [20 x i64], ptr %17, i64 %25
  %30 = load i64, ptr %29, align 8, !tbaa !13
  %31 = mul nsw i64 %30, %28
  %32 = add nsw i64 %26, %31
  store i64 %32, ptr %16, align 8, !tbaa !13
  %33 = or disjoint i64 %25, 1
  %34 = getelementptr inbounds nuw i64, ptr %9, i64 %33
  %35 = load i64, ptr %34, align 8, !tbaa !13
  %36 = getelementptr inbounds nuw [20 x i64], ptr %17, i64 %33
  %37 = load i64, ptr %36, align 8, !tbaa !13
  %38 = mul nsw i64 %37, %35
  %39 = add nsw i64 %32, %38
  store i64 %39, ptr %16, align 8, !tbaa !13
  %40 = add nuw nsw i64 %25, 2
  %41 = icmp eq i64 %40, 20
  %42 = load i64, ptr @DynMemReadCount, align 8
  %43 = add i64 %42, 4
  store i64 %43, ptr @DynMemReadCount, align 8
  %44 = load i64, ptr @DynMemWriteCount, align 8
  %45 = add i64 %44, 2
  store i64 %45, ptr @DynMemWriteCount, align 8
  %46 = load i64, ptr @DynAddressMathCount, align 8
  %47 = add i64 %46, 4
  store i64 %47, ptr @DynAddressMathCount, align 8
  %48 = load i64, ptr @DynControlFlowCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynControlFlowCount, align 8
  %50 = load i64, ptr @DynALUCount, align 8
  %51 = add i64 %50, 7
  store i64 %51, ptr @DynALUCount, align 8
  br i1 %41, label %52, label %24, !llvm.loop !18

52:                                               ; preds = %24
  %53 = add nuw nsw i64 %15, 1
  %54 = icmp eq i64 %53, 20
  %55 = load i64, ptr @DynControlFlowCount, align 8
  %56 = add i64 %55, 1
  store i64 %56, ptr @DynControlFlowCount, align 8
  %57 = load i64, ptr @DynALUCount, align 8
  %58 = add i64 %57, 2
  store i64 %58, ptr @DynALUCount, align 8
  br i1 %54, label %59, label %14, !llvm.loop !15

59:                                               ; preds = %52
  %60 = add nuw nsw i64 %7, 1
  %61 = icmp eq i64 %60, 20
  %62 = load i64, ptr @DynControlFlowCount, align 8
  %63 = add i64 %62, 1
  store i64 %63, ptr @DynControlFlowCount, align 8
  %64 = load i64, ptr @DynALUCount, align 8
  %65 = add i64 %64, 2
  store i64 %65, ptr @DynALUCount, align 8
  br i1 %61, label %66, label %6, !llvm.loop !16

66:                                               ; preds = %59
  %67 = load i64, ptr @DynControlFlowCount, align 8
  %68 = add i64 %67, 1
  store i64 %68, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 -8094, 8095) i32 @RandomInteger() local_unnamed_addr #9 {
  %1 = load i32, ptr @Seed, align 4, !tbaa !1
  %2 = mul nsw i32 %1, 133
  %3 = add nsw i32 %2, 81
  %4 = srem i32 %3, 8095
  store i32 %4, ptr @Seed, align 4, !tbaa !1
  %5 = load i64, ptr @DynMemReadCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynMemReadCount, align 8
  %7 = load i64, ptr @DynMemWriteCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynMemWriteCount, align 8
  %9 = load i64, ptr @DynControlFlowCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynControlFlowCount, align 8
  %11 = load i64, ptr @DynALUCount, align 8
  %12 = add i64 %11, 3
  store i64 %12, ptr @DynALUCount, align 8
  ret i32 %4
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @initialise_benchmark() local_unnamed_addr #10 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  br label %3

3:                                                ; preds = %37, %0
  %4 = phi i64 [ 0, %0 ], [ %38, %37 ]
  %5 = phi i32 [ 0, %0 ], [ %21, %37 ]
  %6 = getelementptr inbounds nuw [20 x i64], ptr @ArrayA_ref, i64 %4
  %7 = load i64, ptr @DynAddressMathCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynAddressMathCount, align 8
  %9 = load i64, ptr @DynControlFlowCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynControlFlowCount, align 8
  br label %11

11:                                               ; preds = %11, %3
  %12 = phi i64 [ 0, %3 ], [ %25, %11 ]
  %13 = phi i32 [ %5, %3 ], [ %21, %11 ]
  %14 = mul nuw nsw i32 %13, 133
  %15 = add nuw nsw i32 %14, 81
  %16 = urem i32 %15, 8095
  %17 = zext nneg i32 %16 to i64
  %18 = getelementptr inbounds nuw i64, ptr %6, i64 %12
  store i64 %17, ptr %18, align 16, !tbaa !13
  %19 = mul nuw nsw i32 %16, 133
  %20 = add nuw nsw i32 %19, 81
  %21 = urem i32 %20, 8095
  %22 = zext nneg i32 %21 to i64
  %23 = getelementptr inbounds nuw i64, ptr %6, i64 %12
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 8
  store i64 %22, ptr %24, align 8, !tbaa !13
  %25 = add nuw nsw i64 %12, 2
  %26 = icmp eq i64 %25, 20
  %27 = load i64, ptr @DynMemWriteCount, align 8
  %28 = add i64 %27, 2
  store i64 %28, ptr @DynMemWriteCount, align 8
  %29 = load i64, ptr @DynAddressMathCount, align 8
  %30 = add i64 %29, 3
  store i64 %30, ptr @DynAddressMathCount, align 8
  %31 = load i64, ptr @DynControlFlowCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynControlFlowCount, align 8
  %33 = load i64, ptr @DynALUCount, align 8
  %34 = add i64 %33, 8
  store i64 %34, ptr @DynALUCount, align 8
  %35 = load i64, ptr @DynCastCount, align 8
  %36 = add i64 %35, 2
  store i64 %36, ptr @DynCastCount, align 8
  br i1 %26, label %37, label %11, !llvm.loop !19

37:                                               ; preds = %11
  %38 = add nuw nsw i64 %4, 1
  %39 = icmp eq i64 %38, 20
  %40 = load i64, ptr @DynControlFlowCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynControlFlowCount, align 8
  %42 = load i64, ptr @DynALUCount, align 8
  %43 = add i64 %42, 2
  store i64 %43, ptr @DynALUCount, align 8
  br i1 %39, label %44, label %3, !llvm.loop !20

44:                                               ; preds = %78, %37
  %45 = phi i64 [ %79, %78 ], [ 0, %37 ]
  %46 = phi i32 [ %62, %78 ], [ %21, %37 ]
  %47 = getelementptr inbounds nuw [20 x i64], ptr @ArrayB_ref, i64 %45
  %48 = load i64, ptr @DynAddressMathCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynAddressMathCount, align 8
  %50 = load i64, ptr @DynControlFlowCount, align 8
  %51 = add i64 %50, 1
  store i64 %51, ptr @DynControlFlowCount, align 8
  br label %52

52:                                               ; preds = %52, %44
  %53 = phi i64 [ 0, %44 ], [ %66, %52 ]
  %54 = phi i32 [ %46, %44 ], [ %62, %52 ]
  %55 = mul nuw nsw i32 %54, 133
  %56 = add nuw nsw i32 %55, 81
  %57 = urem i32 %56, 8095
  %58 = zext nneg i32 %57 to i64
  %59 = getelementptr inbounds nuw i64, ptr %47, i64 %53
  store i64 %58, ptr %59, align 16, !tbaa !13
  %60 = mul nuw nsw i32 %57, 133
  %61 = add nuw nsw i32 %60, 81
  %62 = urem i32 %61, 8095
  %63 = zext nneg i32 %62 to i64
  %64 = getelementptr inbounds nuw i64, ptr %47, i64 %53
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 8
  store i64 %63, ptr %65, align 8, !tbaa !13
  %66 = add nuw nsw i64 %53, 2
  %67 = icmp eq i64 %66, 20
  %68 = load i64, ptr @DynMemWriteCount, align 8
  %69 = add i64 %68, 2
  store i64 %69, ptr @DynMemWriteCount, align 8
  %70 = load i64, ptr @DynAddressMathCount, align 8
  %71 = add i64 %70, 3
  store i64 %71, ptr @DynAddressMathCount, align 8
  %72 = load i64, ptr @DynControlFlowCount, align 8
  %73 = add i64 %72, 1
  store i64 %73, ptr @DynControlFlowCount, align 8
  %74 = load i64, ptr @DynALUCount, align 8
  %75 = add i64 %74, 8
  store i64 %75, ptr @DynALUCount, align 8
  %76 = load i64, ptr @DynCastCount, align 8
  %77 = add i64 %76, 2
  store i64 %77, ptr @DynCastCount, align 8
  br i1 %67, label %78, label %52, !llvm.loop !21

78:                                               ; preds = %52
  %79 = add nuw nsw i64 %45, 1
  %80 = icmp eq i64 %79, 20
  %81 = load i64, ptr @DynControlFlowCount, align 8
  %82 = add i64 %81, 1
  store i64 %82, ptr @DynControlFlowCount, align 8
  %83 = load i64, ptr @DynALUCount, align 8
  %84 = add i64 %83, 2
  store i64 %84, ptr @DynALUCount, align 8
  br i1 %80, label %85, label %44, !llvm.loop !22

85:                                               ; preds = %78
  store i32 %62, ptr @Seed, align 4, !tbaa !1
  %86 = load i64, ptr @DynMemWriteCount, align 8
  %87 = add i64 %86, 1
  store i64 %87, ptr @DynMemWriteCount, align 8
  %88 = load i64, ptr @DynControlFlowCount, align 8
  %89 = add i64 %88, 1
  store i64 %89, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #11 {
  %2 = tail call i32 @bcmp(ptr noundef nonnull dereferenceable(3200) @ResultArray, ptr noundef nonnull dereferenceable(3200) @__const.verify_benchmark.exp, i64 3200)
  %3 = icmp eq i32 %2, 0
  %4 = zext i1 %3 to i32
  %5 = load i64, ptr @DynControlFlowCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynControlFlowCount, align 8
  %7 = load i64, ptr @DynALUCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynALUCount, align 8
  %9 = load i64, ptr @DynCastCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynCastCount, align 8
  ret i32 %4
}

; Function Attrs: nofree nounwind willreturn memory(argmem: read)
declare i32 @bcmp(ptr captures(none), ptr captures(none), i64) local_unnamed_addr #12

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @initialise_board() local_unnamed_addr #2 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @start_trigger() local_unnamed_addr #2 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @stop_trigger() local_unnamed_addr #2 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
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
define dso_local void @srand_beebs(i32 noundef %0) local_unnamed_addr #7 {
  %2 = zext i32 %0 to i64
  store i64 %2, ptr @seed, align 8, !tbaa !13
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
define dso_local void @init_heap_beebs(ptr noundef %0, i64 noundef %1) local_unnamed_addr #10 {
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
  store ptr %0, ptr @heap_ptr, align 8, !tbaa !23
  %13 = getelementptr inbounds nuw i8, ptr %0, i64 %1
  store ptr %13, ptr @heap_end, align 8, !tbaa !23
  store i64 0, ptr @heap_requested, align 8, !tbaa !13
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
define dso_local range(i32 0, 2) i32 @check_heap_beebs(ptr noundef readnone captures(address) %0) local_unnamed_addr #13 {
  %2 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %3 = getelementptr inbounds nuw i8, ptr %0, i64 %2
  %4 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
define dso_local ptr @malloc_beebs(i64 noundef %0) local_unnamed_addr #9 {
  %2 = icmp eq i64 %0, 0
  %3 = load i64, ptr @DynControlFlowCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynControlFlowCount, align 8
  %5 = load i64, ptr @DynALUCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynALUCount, align 8
  br i1 %2, label %38, label %7

7:                                                ; preds = %1
  %8 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 %0
  %10 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %11 = add i64 %10, %0
  %12 = ptrtoint ptr %9 to i64
  %13 = and i64 %12, 7
  %14 = icmp eq i64 %13, 0
  %15 = sub nuw nsw i64 8, %13
  %16 = select i1 %14, i64 0, i64 %15
  %17 = add i64 %11, %16
  %18 = getelementptr inbounds nuw i8, ptr %9, i64 %16
  store i64 %17, ptr @heap_requested, align 8, !tbaa !13
  %19 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
  store ptr %18, ptr @heap_ptr, align 8, !tbaa !23
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
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) local_unnamed_addr #14 {
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
  %10 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 %3
  %12 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %13 = add i64 %12, %3
  %14 = ptrtoint ptr %11 to i64
  %15 = and i64 %14, 7
  %16 = icmp eq i64 %15, 0
  %17 = sub nuw nsw i64 8, %15
  %18 = select i1 %16, i64 0, i64 %17
  %19 = add i64 %13, %18
  %20 = getelementptr inbounds nuw i8, ptr %11, i64 %18
  store i64 %19, ptr @heap_requested, align 8, !tbaa !13
  %21 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
  store ptr %20, ptr @heap_ptr, align 8, !tbaa !23
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #15

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @realloc_beebs(ptr noundef readonly captures(address_is_null) %0, i64 noundef %1) local_unnamed_addr #3 {
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
  %14 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %15 = ptrtoint ptr %14 to i64
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 %1
  %17 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %18 = add i64 %17, %1
  %19 = ptrtoint ptr %16 to i64
  %20 = and i64 %19, 7
  %21 = icmp eq i64 %20, 0
  %22 = sub nuw nsw i64 8, %20
  %23 = select i1 %21, i64 0, i64 %22
  %24 = add i64 %18, %23
  %25 = getelementptr inbounds nuw i8, ptr %16, i64 %23
  store i64 %24, ptr @heap_requested, align 8, !tbaa !13
  %26 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
  store ptr %25, ptr @heap_ptr, align 8, !tbaa !23
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
  %74 = load <16 x i8>, ptr %72, align 1, !tbaa !25
  %75 = load <16 x i8>, ptr %73, align 1, !tbaa !25
  %76 = getelementptr inbounds nuw i8, ptr %14, i64 %71
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 16
  store <16 x i8> %74, ptr %76, align 1, !tbaa !25
  store <16 x i8> %75, ptr %77, align 1, !tbaa !25
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
  br i1 %79, label %90, label %70, !llvm.loop !26

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
  br i1 %97, label %132, label %102, !prof !29

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
  %112 = load <4 x i8>, ptr %111, align 1, !tbaa !25
  %113 = getelementptr inbounds nuw i8, ptr %14, i64 %110
  store <4 x i8> %112, ptr %113, align 1, !tbaa !25
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
  br i1 %115, label %126, label %109, !llvm.loop !30

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
  %144 = load i8, ptr %143, align 1, !tbaa !25
  %145 = getelementptr inbounds nuw i8, ptr %14, i64 %141
  store i8 %144, ptr %145, align 1, !tbaa !25
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
  br i1 %148, label %159, label %140, !llvm.loop !31

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
  %170 = load i8, ptr %169, align 1, !tbaa !25
  %171 = getelementptr inbounds nuw i8, ptr %14, i64 %168
  store i8 %170, ptr %171, align 1, !tbaa !25
  %172 = add nuw i64 %168, 1
  %173 = getelementptr inbounds nuw i8, ptr %0, i64 %172
  %174 = load i8, ptr %173, align 1, !tbaa !25
  %175 = getelementptr inbounds nuw i8, ptr %14, i64 %172
  store i8 %174, ptr %175, align 1, !tbaa !25
  %176 = add nuw i64 %168, 2
  %177 = getelementptr inbounds nuw i8, ptr %0, i64 %176
  %178 = load i8, ptr %177, align 1, !tbaa !25
  %179 = getelementptr inbounds nuw i8, ptr %14, i64 %176
  store i8 %178, ptr %179, align 1, !tbaa !25
  %180 = add nuw i64 %168, 3
  %181 = getelementptr inbounds nuw i8, ptr %0, i64 %180
  %182 = load i8, ptr %181, align 1, !tbaa !25
  %183 = getelementptr inbounds nuw i8, ptr %14, i64 %180
  store i8 %182, ptr %183, align 1, !tbaa !25
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
  br i1 %185, label %196, label %167, !llvm.loop !33

196:                                              ; preds = %167, %159, %126, %90, %40, %13, %2
  %197 = phi ptr [ null, %2 ], [ null, %13 ], [ null, %40 ], [ %14, %90 ], [ %14, %126 ], [ %14, %167 ], [ %14, %159 ]
  %198 = load i64, ptr @DynControlFlowCount, align 8
  %199 = add i64 %198, 1
  store i64 %199, ptr @DynControlFlowCount, align 8
  ret ptr %197
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local void @free_beebs(ptr noundef readnone captures(none) %0) local_unnamed_addr #2 {
  %2 = load i64, ptr @DynControlFlowCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynControlFlowCount, align 8
  ret void
}

declare i32 @printf(ptr, ...)

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
