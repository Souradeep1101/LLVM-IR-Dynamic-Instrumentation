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
  %7 = load i64, ptr @DynMemReadCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynMemReadCount, align 8
  %9 = load volatile i32, ptr %3, align 4, !tbaa !1
  %10 = tail call i32 @verify_benchmark(i32 noundef %9) #16
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
  %29 = tail call i32 @benchmark() #16
  %30 = load i64, ptr @DynMemWriteCount, align 8
  %31 = add i64 %30, 1
  store i64 %31, ptr @DynMemWriteCount, align 8
  store volatile i32 %29, ptr %3, align 4, !tbaa !1
  %32 = load i64, ptr @DynMemReadCount, align 8
  %33 = add i64 %32, 1
  store i64 %33, ptr @DynMemReadCount, align 8
  %34 = load volatile i32, ptr %3, align 4, !tbaa !1
  tail call void asm sideeffect "", "r,~{memory},~{dirflag},~{fpsr},~{flags}"(i32 %34) #16, !srcloc !9
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

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(none) uwtable
define dso_local range(i32 0, 2) i32 @values_match(i64 noundef %0, i64 noundef %1) local_unnamed_addr #2 {
  %3 = load i64, ptr @DynALUCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynALUCount, align 8
  %5 = icmp eq i64 %0, %1
  %6 = load i64, ptr @DynCastCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynCastCount, align 8
  %8 = zext i1 %5 to i32
  %9 = load i64, ptr @DynControlFlowCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynControlFlowCount, align 8
  ret i32 %8
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
  %3 = load i64, ptr @DynALUCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynALUCount, align 8
  %5 = icmp eq i32 %1, 0
  %6 = load i64, ptr @DynControlFlowCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynControlFlowCount, align 8
  br label %8

8:                                                ; preds = %15, %2
  %9 = phi i32 [ 0, %2 ], [ %18, %15 ]
  %10 = load i64, ptr @DynControlFlowCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynControlFlowCount, align 8
  br i1 %5, label %15, label %24

12:                                               ; preds = %15
  %13 = load i64, ptr @DynControlFlowCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynControlFlowCount, align 8
  ret void

15:                                               ; preds = %416, %8
  %16 = load i64, ptr @DynALUCount, align 8
  %17 = add i64 %16, 1
  store i64 %17, ptr @DynALUCount, align 8
  %18 = add nuw nsw i32 %9, 1
  %19 = load i64, ptr @DynALUCount, align 8
  %20 = add i64 %19, 1
  store i64 %20, ptr @DynALUCount, align 8
  %21 = icmp eq i32 %18, %0
  %22 = load i64, ptr @DynControlFlowCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynControlFlowCount, align 8
  br i1 %21, label %12, label %8, !llvm.loop !12

24:                                               ; preds = %416, %8
  %25 = phi i32 [ %419, %416 ], [ 0, %8 ]
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(3200) @ArrayA, ptr noundef nonnull align 16 dereferenceable(3200) @ArrayA_ref, i64 3200, i1 false)
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 16 dereferenceable(3200) @ArrayB, ptr noundef nonnull align 16 dereferenceable(3200) @ArrayB_ref, i64 3200, i1 false)
  %26 = load i64, ptr @DynControlFlowCount, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr @DynControlFlowCount, align 8
  br label %28

28:                                               ; preds = %407, %24
  %29 = phi i64 [ 0, %24 ], [ %410, %407 ]
  %30 = load i64, ptr @DynAddressMathCount, align 8
  %31 = add i64 %30, 1
  store i64 %31, ptr @DynAddressMathCount, align 8
  %32 = getelementptr inbounds nuw [20 x i64], ptr @ResultArray, i64 %29
  %33 = load i64, ptr @DynAddressMathCount, align 8
  %34 = add i64 %33, 1
  store i64 %34, ptr @DynAddressMathCount, align 8
  %35 = getelementptr inbounds nuw [20 x i64], ptr @ArrayA, i64 %29
  %36 = load i64, ptr @DynAddressMathCount, align 8
  %37 = add i64 %36, 1
  store i64 %37, ptr @DynAddressMathCount, align 8
  %38 = getelementptr inbounds nuw i8, ptr %35, i64 32
  %39 = load i64, ptr @DynMemReadCount, align 8
  %40 = add i64 %39, 1
  store i64 %40, ptr @DynMemReadCount, align 8
  %41 = load i64, ptr %38, align 16, !tbaa !13
  %42 = load i64, ptr @DynAddressMathCount, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr @DynAddressMathCount, align 8
  %44 = getelementptr inbounds nuw i8, ptr %35, i64 40
  %45 = load i64, ptr @DynMemReadCount, align 8
  %46 = add i64 %45, 1
  store i64 %46, ptr @DynMemReadCount, align 8
  %47 = load i64, ptr %44, align 8, !tbaa !13
  %48 = load i64, ptr @DynAddressMathCount, align 8
  %49 = add i64 %48, 1
  store i64 %49, ptr @DynAddressMathCount, align 8
  %50 = getelementptr inbounds nuw i8, ptr %35, i64 48
  %51 = load i64, ptr @DynMemReadCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynMemReadCount, align 8
  %53 = load i64, ptr %50, align 16, !tbaa !13
  %54 = load i64, ptr @DynAddressMathCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynAddressMathCount, align 8
  %56 = getelementptr inbounds nuw i8, ptr %35, i64 56
  %57 = load i64, ptr @DynMemReadCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynMemReadCount, align 8
  %59 = load i64, ptr %56, align 8, !tbaa !13
  %60 = load i64, ptr @DynAddressMathCount, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr @DynAddressMathCount, align 8
  %62 = getelementptr inbounds nuw i8, ptr %35, i64 64
  %63 = load i64, ptr @DynMemReadCount, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr @DynMemReadCount, align 8
  %65 = load i64, ptr %62, align 16, !tbaa !13
  %66 = load i64, ptr @DynAddressMathCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynAddressMathCount, align 8
  %68 = getelementptr inbounds nuw i8, ptr %35, i64 72
  %69 = load i64, ptr @DynMemReadCount, align 8
  %70 = add i64 %69, 1
  store i64 %70, ptr @DynMemReadCount, align 8
  %71 = load i64, ptr %68, align 8, !tbaa !13
  %72 = load i64, ptr @DynAddressMathCount, align 8
  %73 = add i64 %72, 1
  store i64 %73, ptr @DynAddressMathCount, align 8
  %74 = getelementptr inbounds nuw i8, ptr %35, i64 80
  %75 = load i64, ptr @DynMemReadCount, align 8
  %76 = add i64 %75, 1
  store i64 %76, ptr @DynMemReadCount, align 8
  %77 = load i64, ptr %74, align 16, !tbaa !13
  %78 = load i64, ptr @DynAddressMathCount, align 8
  %79 = add i64 %78, 1
  store i64 %79, ptr @DynAddressMathCount, align 8
  %80 = getelementptr inbounds nuw i8, ptr %35, i64 88
  %81 = load i64, ptr @DynMemReadCount, align 8
  %82 = add i64 %81, 1
  store i64 %82, ptr @DynMemReadCount, align 8
  %83 = load i64, ptr %80, align 8, !tbaa !13
  %84 = load i64, ptr @DynAddressMathCount, align 8
  %85 = add i64 %84, 1
  store i64 %85, ptr @DynAddressMathCount, align 8
  %86 = getelementptr inbounds nuw i8, ptr %35, i64 96
  %87 = load i64, ptr @DynMemReadCount, align 8
  %88 = add i64 %87, 1
  store i64 %88, ptr @DynMemReadCount, align 8
  %89 = load i64, ptr %86, align 16, !tbaa !13
  %90 = load i64, ptr @DynAddressMathCount, align 8
  %91 = add i64 %90, 1
  store i64 %91, ptr @DynAddressMathCount, align 8
  %92 = getelementptr inbounds nuw i8, ptr %35, i64 104
  %93 = load i64, ptr @DynMemReadCount, align 8
  %94 = add i64 %93, 1
  store i64 %94, ptr @DynMemReadCount, align 8
  %95 = load i64, ptr %92, align 8, !tbaa !13
  %96 = load i64, ptr @DynAddressMathCount, align 8
  %97 = add i64 %96, 1
  store i64 %97, ptr @DynAddressMathCount, align 8
  %98 = getelementptr inbounds nuw i8, ptr %35, i64 112
  %99 = load i64, ptr @DynMemReadCount, align 8
  %100 = add i64 %99, 1
  store i64 %100, ptr @DynMemReadCount, align 8
  %101 = load i64, ptr %98, align 16, !tbaa !13
  %102 = load i64, ptr @DynAddressMathCount, align 8
  %103 = add i64 %102, 1
  store i64 %103, ptr @DynAddressMathCount, align 8
  %104 = getelementptr inbounds nuw i8, ptr %35, i64 120
  %105 = load i64, ptr @DynMemReadCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynMemReadCount, align 8
  %107 = load i64, ptr %104, align 8, !tbaa !13
  %108 = load i64, ptr @DynAddressMathCount, align 8
  %109 = add i64 %108, 1
  store i64 %109, ptr @DynAddressMathCount, align 8
  %110 = getelementptr inbounds nuw i8, ptr %35, i64 128
  %111 = load i64, ptr @DynMemReadCount, align 8
  %112 = add i64 %111, 1
  store i64 %112, ptr @DynMemReadCount, align 8
  %113 = load i64, ptr %110, align 16, !tbaa !13
  %114 = load i64, ptr @DynAddressMathCount, align 8
  %115 = add i64 %114, 1
  store i64 %115, ptr @DynAddressMathCount, align 8
  %116 = getelementptr inbounds nuw i8, ptr %35, i64 136
  %117 = load i64, ptr @DynMemReadCount, align 8
  %118 = add i64 %117, 1
  store i64 %118, ptr @DynMemReadCount, align 8
  %119 = load i64, ptr %116, align 8, !tbaa !13
  %120 = load i64, ptr @DynAddressMathCount, align 8
  %121 = add i64 %120, 1
  store i64 %121, ptr @DynAddressMathCount, align 8
  %122 = getelementptr inbounds nuw i8, ptr %35, i64 144
  %123 = load i64, ptr @DynMemReadCount, align 8
  %124 = add i64 %123, 1
  store i64 %124, ptr @DynMemReadCount, align 8
  %125 = load i64, ptr %122, align 16, !tbaa !13
  %126 = load i64, ptr @DynMemReadCount, align 8
  %127 = add i64 %126, 1
  store i64 %127, ptr @DynMemReadCount, align 8
  %128 = load i64, ptr %35, align 16, !tbaa !13
  %129 = load i64, ptr @DynAddressMathCount, align 8
  %130 = add i64 %129, 1
  store i64 %130, ptr @DynAddressMathCount, align 8
  %131 = getelementptr inbounds nuw i8, ptr %35, i64 8
  %132 = load i64, ptr @DynMemReadCount, align 8
  %133 = add i64 %132, 1
  store i64 %133, ptr @DynMemReadCount, align 8
  %134 = load i64, ptr %131, align 8, !tbaa !13
  %135 = load i64, ptr @DynAddressMathCount, align 8
  %136 = add i64 %135, 1
  store i64 %136, ptr @DynAddressMathCount, align 8
  %137 = getelementptr inbounds nuw i8, ptr %35, i64 16
  %138 = load i64, ptr @DynMemReadCount, align 8
  %139 = add i64 %138, 1
  store i64 %139, ptr @DynMemReadCount, align 8
  %140 = load i64, ptr %137, align 16, !tbaa !13
  %141 = load i64, ptr @DynAddressMathCount, align 8
  %142 = add i64 %141, 1
  store i64 %142, ptr @DynAddressMathCount, align 8
  %143 = getelementptr inbounds nuw i8, ptr %35, i64 24
  %144 = load i64, ptr @DynMemReadCount, align 8
  %145 = add i64 %144, 1
  store i64 %145, ptr @DynMemReadCount, align 8
  %146 = load i64, ptr %143, align 8, !tbaa !13
  %147 = load i64, ptr @DynAddressMathCount, align 8
  %148 = add i64 %147, 1
  store i64 %148, ptr @DynAddressMathCount, align 8
  %149 = getelementptr inbounds nuw i8, ptr %35, i64 152
  %150 = load i64, ptr @DynMemReadCount, align 8
  %151 = add i64 %150, 1
  store i64 %151, ptr @DynMemReadCount, align 8
  %152 = load i64, ptr %149, align 8, !tbaa !13
  %153 = load i64, ptr @DynControlFlowCount, align 8
  %154 = add i64 %153, 1
  store i64 %154, ptr @DynControlFlowCount, align 8
  br label %155

155:                                              ; preds = %155, %28
  %156 = phi i64 [ 0, %28 ], [ %401, %155 ]
  %157 = load i64, ptr @DynAddressMathCount, align 8
  %158 = add i64 %157, 1
  store i64 %158, ptr @DynAddressMathCount, align 8
  %159 = getelementptr inbounds nuw i64, ptr %32, i64 %156
  %160 = load i64, ptr @DynAddressMathCount, align 8
  %161 = add i64 %160, 1
  store i64 %161, ptr @DynAddressMathCount, align 8
  %162 = getelementptr inbounds nuw i64, ptr @ArrayB, i64 %156
  %163 = load i64, ptr @DynMemReadCount, align 8
  %164 = add i64 %163, 1
  store i64 %164, ptr @DynMemReadCount, align 8
  %165 = load i64, ptr %162, align 8, !tbaa !13
  %166 = load i64, ptr @DynALUCount, align 8
  %167 = add i64 %166, 1
  store i64 %167, ptr @DynALUCount, align 8
  %168 = mul nsw i64 %165, %128
  %169 = load i64, ptr @DynAddressMathCount, align 8
  %170 = add i64 %169, 1
  store i64 %170, ptr @DynAddressMathCount, align 8
  %171 = getelementptr inbounds nuw i8, ptr %162, i64 160
  %172 = load i64, ptr @DynMemReadCount, align 8
  %173 = add i64 %172, 1
  store i64 %173, ptr @DynMemReadCount, align 8
  %174 = load i64, ptr %171, align 8, !tbaa !13
  %175 = load i64, ptr @DynALUCount, align 8
  %176 = add i64 %175, 1
  store i64 %176, ptr @DynALUCount, align 8
  %177 = mul nsw i64 %174, %134
  %178 = load i64, ptr @DynALUCount, align 8
  %179 = add i64 %178, 1
  store i64 %179, ptr @DynALUCount, align 8
  %180 = add nsw i64 %177, %168
  %181 = load i64, ptr @DynAddressMathCount, align 8
  %182 = add i64 %181, 1
  store i64 %182, ptr @DynAddressMathCount, align 8
  %183 = getelementptr inbounds nuw i8, ptr %162, i64 320
  %184 = load i64, ptr @DynMemReadCount, align 8
  %185 = add i64 %184, 1
  store i64 %185, ptr @DynMemReadCount, align 8
  %186 = load i64, ptr %183, align 8, !tbaa !13
  %187 = load i64, ptr @DynALUCount, align 8
  %188 = add i64 %187, 1
  store i64 %188, ptr @DynALUCount, align 8
  %189 = mul nsw i64 %186, %140
  %190 = load i64, ptr @DynALUCount, align 8
  %191 = add i64 %190, 1
  store i64 %191, ptr @DynALUCount, align 8
  %192 = add nsw i64 %189, %180
  %193 = load i64, ptr @DynAddressMathCount, align 8
  %194 = add i64 %193, 1
  store i64 %194, ptr @DynAddressMathCount, align 8
  %195 = getelementptr inbounds nuw i8, ptr %162, i64 480
  %196 = load i64, ptr @DynMemReadCount, align 8
  %197 = add i64 %196, 1
  store i64 %197, ptr @DynMemReadCount, align 8
  %198 = load i64, ptr %195, align 8, !tbaa !13
  %199 = load i64, ptr @DynALUCount, align 8
  %200 = add i64 %199, 1
  store i64 %200, ptr @DynALUCount, align 8
  %201 = mul nsw i64 %198, %146
  %202 = load i64, ptr @DynALUCount, align 8
  %203 = add i64 %202, 1
  store i64 %203, ptr @DynALUCount, align 8
  %204 = add nsw i64 %201, %192
  %205 = load i64, ptr @DynAddressMathCount, align 8
  %206 = add i64 %205, 1
  store i64 %206, ptr @DynAddressMathCount, align 8
  %207 = getelementptr inbounds nuw i8, ptr %162, i64 640
  %208 = load i64, ptr @DynMemReadCount, align 8
  %209 = add i64 %208, 1
  store i64 %209, ptr @DynMemReadCount, align 8
  %210 = load i64, ptr %207, align 8, !tbaa !13
  %211 = load i64, ptr @DynALUCount, align 8
  %212 = add i64 %211, 1
  store i64 %212, ptr @DynALUCount, align 8
  %213 = mul nsw i64 %210, %41
  %214 = load i64, ptr @DynALUCount, align 8
  %215 = add i64 %214, 1
  store i64 %215, ptr @DynALUCount, align 8
  %216 = add nsw i64 %213, %204
  %217 = load i64, ptr @DynAddressMathCount, align 8
  %218 = add i64 %217, 1
  store i64 %218, ptr @DynAddressMathCount, align 8
  %219 = getelementptr inbounds nuw i8, ptr %162, i64 800
  %220 = load i64, ptr @DynMemReadCount, align 8
  %221 = add i64 %220, 1
  store i64 %221, ptr @DynMemReadCount, align 8
  %222 = load i64, ptr %219, align 8, !tbaa !13
  %223 = load i64, ptr @DynALUCount, align 8
  %224 = add i64 %223, 1
  store i64 %224, ptr @DynALUCount, align 8
  %225 = mul nsw i64 %222, %47
  %226 = load i64, ptr @DynALUCount, align 8
  %227 = add i64 %226, 1
  store i64 %227, ptr @DynALUCount, align 8
  %228 = add nsw i64 %225, %216
  %229 = load i64, ptr @DynAddressMathCount, align 8
  %230 = add i64 %229, 1
  store i64 %230, ptr @DynAddressMathCount, align 8
  %231 = getelementptr inbounds nuw i8, ptr %162, i64 960
  %232 = load i64, ptr @DynMemReadCount, align 8
  %233 = add i64 %232, 1
  store i64 %233, ptr @DynMemReadCount, align 8
  %234 = load i64, ptr %231, align 8, !tbaa !13
  %235 = load i64, ptr @DynALUCount, align 8
  %236 = add i64 %235, 1
  store i64 %236, ptr @DynALUCount, align 8
  %237 = mul nsw i64 %234, %53
  %238 = load i64, ptr @DynALUCount, align 8
  %239 = add i64 %238, 1
  store i64 %239, ptr @DynALUCount, align 8
  %240 = add nsw i64 %237, %228
  %241 = load i64, ptr @DynAddressMathCount, align 8
  %242 = add i64 %241, 1
  store i64 %242, ptr @DynAddressMathCount, align 8
  %243 = getelementptr inbounds nuw i8, ptr %162, i64 1120
  %244 = load i64, ptr @DynMemReadCount, align 8
  %245 = add i64 %244, 1
  store i64 %245, ptr @DynMemReadCount, align 8
  %246 = load i64, ptr %243, align 8, !tbaa !13
  %247 = load i64, ptr @DynALUCount, align 8
  %248 = add i64 %247, 1
  store i64 %248, ptr @DynALUCount, align 8
  %249 = mul nsw i64 %246, %59
  %250 = load i64, ptr @DynALUCount, align 8
  %251 = add i64 %250, 1
  store i64 %251, ptr @DynALUCount, align 8
  %252 = add nsw i64 %249, %240
  %253 = load i64, ptr @DynAddressMathCount, align 8
  %254 = add i64 %253, 1
  store i64 %254, ptr @DynAddressMathCount, align 8
  %255 = getelementptr inbounds nuw i8, ptr %162, i64 1280
  %256 = load i64, ptr @DynMemReadCount, align 8
  %257 = add i64 %256, 1
  store i64 %257, ptr @DynMemReadCount, align 8
  %258 = load i64, ptr %255, align 8, !tbaa !13
  %259 = load i64, ptr @DynALUCount, align 8
  %260 = add i64 %259, 1
  store i64 %260, ptr @DynALUCount, align 8
  %261 = mul nsw i64 %258, %65
  %262 = load i64, ptr @DynALUCount, align 8
  %263 = add i64 %262, 1
  store i64 %263, ptr @DynALUCount, align 8
  %264 = add nsw i64 %261, %252
  %265 = load i64, ptr @DynAddressMathCount, align 8
  %266 = add i64 %265, 1
  store i64 %266, ptr @DynAddressMathCount, align 8
  %267 = getelementptr inbounds nuw i8, ptr %162, i64 1440
  %268 = load i64, ptr @DynMemReadCount, align 8
  %269 = add i64 %268, 1
  store i64 %269, ptr @DynMemReadCount, align 8
  %270 = load i64, ptr %267, align 8, !tbaa !13
  %271 = load i64, ptr @DynALUCount, align 8
  %272 = add i64 %271, 1
  store i64 %272, ptr @DynALUCount, align 8
  %273 = mul nsw i64 %270, %71
  %274 = load i64, ptr @DynALUCount, align 8
  %275 = add i64 %274, 1
  store i64 %275, ptr @DynALUCount, align 8
  %276 = add nsw i64 %273, %264
  %277 = load i64, ptr @DynAddressMathCount, align 8
  %278 = add i64 %277, 1
  store i64 %278, ptr @DynAddressMathCount, align 8
  %279 = getelementptr inbounds nuw i8, ptr %162, i64 1600
  %280 = load i64, ptr @DynMemReadCount, align 8
  %281 = add i64 %280, 1
  store i64 %281, ptr @DynMemReadCount, align 8
  %282 = load i64, ptr %279, align 8, !tbaa !13
  %283 = load i64, ptr @DynALUCount, align 8
  %284 = add i64 %283, 1
  store i64 %284, ptr @DynALUCount, align 8
  %285 = mul nsw i64 %282, %77
  %286 = load i64, ptr @DynALUCount, align 8
  %287 = add i64 %286, 1
  store i64 %287, ptr @DynALUCount, align 8
  %288 = add nsw i64 %285, %276
  %289 = load i64, ptr @DynAddressMathCount, align 8
  %290 = add i64 %289, 1
  store i64 %290, ptr @DynAddressMathCount, align 8
  %291 = getelementptr inbounds nuw i8, ptr %162, i64 1760
  %292 = load i64, ptr @DynMemReadCount, align 8
  %293 = add i64 %292, 1
  store i64 %293, ptr @DynMemReadCount, align 8
  %294 = load i64, ptr %291, align 8, !tbaa !13
  %295 = load i64, ptr @DynALUCount, align 8
  %296 = add i64 %295, 1
  store i64 %296, ptr @DynALUCount, align 8
  %297 = mul nsw i64 %294, %83
  %298 = load i64, ptr @DynALUCount, align 8
  %299 = add i64 %298, 1
  store i64 %299, ptr @DynALUCount, align 8
  %300 = add nsw i64 %297, %288
  %301 = load i64, ptr @DynAddressMathCount, align 8
  %302 = add i64 %301, 1
  store i64 %302, ptr @DynAddressMathCount, align 8
  %303 = getelementptr inbounds nuw i8, ptr %162, i64 1920
  %304 = load i64, ptr @DynMemReadCount, align 8
  %305 = add i64 %304, 1
  store i64 %305, ptr @DynMemReadCount, align 8
  %306 = load i64, ptr %303, align 8, !tbaa !13
  %307 = load i64, ptr @DynALUCount, align 8
  %308 = add i64 %307, 1
  store i64 %308, ptr @DynALUCount, align 8
  %309 = mul nsw i64 %306, %89
  %310 = load i64, ptr @DynALUCount, align 8
  %311 = add i64 %310, 1
  store i64 %311, ptr @DynALUCount, align 8
  %312 = add nsw i64 %309, %300
  %313 = load i64, ptr @DynAddressMathCount, align 8
  %314 = add i64 %313, 1
  store i64 %314, ptr @DynAddressMathCount, align 8
  %315 = getelementptr inbounds nuw i8, ptr %162, i64 2080
  %316 = load i64, ptr @DynMemReadCount, align 8
  %317 = add i64 %316, 1
  store i64 %317, ptr @DynMemReadCount, align 8
  %318 = load i64, ptr %315, align 8, !tbaa !13
  %319 = load i64, ptr @DynALUCount, align 8
  %320 = add i64 %319, 1
  store i64 %320, ptr @DynALUCount, align 8
  %321 = mul nsw i64 %318, %95
  %322 = load i64, ptr @DynALUCount, align 8
  %323 = add i64 %322, 1
  store i64 %323, ptr @DynALUCount, align 8
  %324 = add nsw i64 %321, %312
  %325 = load i64, ptr @DynAddressMathCount, align 8
  %326 = add i64 %325, 1
  store i64 %326, ptr @DynAddressMathCount, align 8
  %327 = getelementptr inbounds nuw i8, ptr %162, i64 2240
  %328 = load i64, ptr @DynMemReadCount, align 8
  %329 = add i64 %328, 1
  store i64 %329, ptr @DynMemReadCount, align 8
  %330 = load i64, ptr %327, align 8, !tbaa !13
  %331 = load i64, ptr @DynALUCount, align 8
  %332 = add i64 %331, 1
  store i64 %332, ptr @DynALUCount, align 8
  %333 = mul nsw i64 %330, %101
  %334 = load i64, ptr @DynALUCount, align 8
  %335 = add i64 %334, 1
  store i64 %335, ptr @DynALUCount, align 8
  %336 = add nsw i64 %333, %324
  %337 = load i64, ptr @DynAddressMathCount, align 8
  %338 = add i64 %337, 1
  store i64 %338, ptr @DynAddressMathCount, align 8
  %339 = getelementptr inbounds nuw i8, ptr %162, i64 2400
  %340 = load i64, ptr @DynMemReadCount, align 8
  %341 = add i64 %340, 1
  store i64 %341, ptr @DynMemReadCount, align 8
  %342 = load i64, ptr %339, align 8, !tbaa !13
  %343 = load i64, ptr @DynALUCount, align 8
  %344 = add i64 %343, 1
  store i64 %344, ptr @DynALUCount, align 8
  %345 = mul nsw i64 %342, %107
  %346 = load i64, ptr @DynALUCount, align 8
  %347 = add i64 %346, 1
  store i64 %347, ptr @DynALUCount, align 8
  %348 = add nsw i64 %345, %336
  %349 = load i64, ptr @DynAddressMathCount, align 8
  %350 = add i64 %349, 1
  store i64 %350, ptr @DynAddressMathCount, align 8
  %351 = getelementptr inbounds nuw i8, ptr %162, i64 2560
  %352 = load i64, ptr @DynMemReadCount, align 8
  %353 = add i64 %352, 1
  store i64 %353, ptr @DynMemReadCount, align 8
  %354 = load i64, ptr %351, align 8, !tbaa !13
  %355 = load i64, ptr @DynALUCount, align 8
  %356 = add i64 %355, 1
  store i64 %356, ptr @DynALUCount, align 8
  %357 = mul nsw i64 %354, %113
  %358 = load i64, ptr @DynALUCount, align 8
  %359 = add i64 %358, 1
  store i64 %359, ptr @DynALUCount, align 8
  %360 = add nsw i64 %357, %348
  %361 = load i64, ptr @DynAddressMathCount, align 8
  %362 = add i64 %361, 1
  store i64 %362, ptr @DynAddressMathCount, align 8
  %363 = getelementptr inbounds nuw i8, ptr %162, i64 2720
  %364 = load i64, ptr @DynMemReadCount, align 8
  %365 = add i64 %364, 1
  store i64 %365, ptr @DynMemReadCount, align 8
  %366 = load i64, ptr %363, align 8, !tbaa !13
  %367 = load i64, ptr @DynALUCount, align 8
  %368 = add i64 %367, 1
  store i64 %368, ptr @DynALUCount, align 8
  %369 = mul nsw i64 %366, %119
  %370 = load i64, ptr @DynALUCount, align 8
  %371 = add i64 %370, 1
  store i64 %371, ptr @DynALUCount, align 8
  %372 = add nsw i64 %369, %360
  %373 = load i64, ptr @DynAddressMathCount, align 8
  %374 = add i64 %373, 1
  store i64 %374, ptr @DynAddressMathCount, align 8
  %375 = getelementptr inbounds nuw i8, ptr %162, i64 2880
  %376 = load i64, ptr @DynMemReadCount, align 8
  %377 = add i64 %376, 1
  store i64 %377, ptr @DynMemReadCount, align 8
  %378 = load i64, ptr %375, align 8, !tbaa !13
  %379 = load i64, ptr @DynALUCount, align 8
  %380 = add i64 %379, 1
  store i64 %380, ptr @DynALUCount, align 8
  %381 = mul nsw i64 %378, %125
  %382 = load i64, ptr @DynALUCount, align 8
  %383 = add i64 %382, 1
  store i64 %383, ptr @DynALUCount, align 8
  %384 = add nsw i64 %381, %372
  %385 = load i64, ptr @DynAddressMathCount, align 8
  %386 = add i64 %385, 1
  store i64 %386, ptr @DynAddressMathCount, align 8
  %387 = getelementptr inbounds nuw i8, ptr %162, i64 3040
  %388 = load i64, ptr @DynMemReadCount, align 8
  %389 = add i64 %388, 1
  store i64 %389, ptr @DynMemReadCount, align 8
  %390 = load i64, ptr %387, align 8, !tbaa !13
  %391 = load i64, ptr @DynALUCount, align 8
  %392 = add i64 %391, 1
  store i64 %392, ptr @DynALUCount, align 8
  %393 = mul nsw i64 %390, %152
  %394 = load i64, ptr @DynALUCount, align 8
  %395 = add i64 %394, 1
  store i64 %395, ptr @DynALUCount, align 8
  %396 = add nsw i64 %393, %384
  %397 = load i64, ptr @DynMemWriteCount, align 8
  %398 = add i64 %397, 1
  store i64 %398, ptr @DynMemWriteCount, align 8
  store i64 %396, ptr %159, align 8, !tbaa !13
  %399 = load i64, ptr @DynALUCount, align 8
  %400 = add i64 %399, 1
  store i64 %400, ptr @DynALUCount, align 8
  %401 = add nuw nsw i64 %156, 1
  %402 = load i64, ptr @DynALUCount, align 8
  %403 = add i64 %402, 1
  store i64 %403, ptr @DynALUCount, align 8
  %404 = icmp eq i64 %401, 20
  %405 = load i64, ptr @DynControlFlowCount, align 8
  %406 = add i64 %405, 1
  store i64 %406, ptr @DynControlFlowCount, align 8
  br i1 %404, label %407, label %155, !llvm.loop !15

407:                                              ; preds = %155
  %408 = load i64, ptr @DynALUCount, align 8
  %409 = add i64 %408, 1
  store i64 %409, ptr @DynALUCount, align 8
  %410 = add nuw nsw i64 %29, 1
  %411 = load i64, ptr @DynALUCount, align 8
  %412 = add i64 %411, 1
  store i64 %412, ptr @DynALUCount, align 8
  %413 = icmp eq i64 %410, 20
  %414 = load i64, ptr @DynControlFlowCount, align 8
  %415 = add i64 %414, 1
  store i64 %415, ptr @DynControlFlowCount, align 8
  br i1 %413, label %416, label %28, !llvm.loop !16

416:                                              ; preds = %407
  %417 = load i64, ptr @DynALUCount, align 8
  %418 = add i64 %417, 1
  store i64 %418, ptr @DynALUCount, align 8
  %419 = add nuw i32 %25, 1
  %420 = load i64, ptr @DynALUCount, align 8
  %421 = add i64 %420, 1
  store i64 %421, ptr @DynALUCount, align 8
  %422 = icmp eq i32 %419, %1
  %423 = load i64, ptr @DynControlFlowCount, align 8
  %424 = add i64 %423, 1
  store i64 %424, ptr @DynControlFlowCount, align 8
  br i1 %422, label %15, label %24, !llvm.loop !17
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
  %1 = load i64, ptr @DynMemWriteCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynMemWriteCount, align 8
  store i32 0, ptr @Seed, align 4, !tbaa !1
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

6:                                                ; preds = %91, %3
  %7 = phi i64 [ 0, %3 ], [ %94, %91 ]
  %8 = load i64, ptr @DynAddressMathCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynAddressMathCount, align 8
  %10 = getelementptr inbounds nuw [20 x i64], ptr %2, i64 %7
  %11 = load i64, ptr @DynAddressMathCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynAddressMathCount, align 8
  %13 = getelementptr inbounds nuw [20 x i64], ptr %0, i64 %7
  %14 = load i64, ptr @DynControlFlowCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynControlFlowCount, align 8
  br label %16

16:                                               ; preds = %82, %6
  %17 = phi i64 [ 0, %6 ], [ %85, %82 ]
  %18 = load i64, ptr @DynAddressMathCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynAddressMathCount, align 8
  %20 = getelementptr inbounds nuw i64, ptr %10, i64 %17
  %21 = load i64, ptr @DynMemWriteCount, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr @DynMemWriteCount, align 8
  store i64 0, ptr %20, align 8, !tbaa !13
  %23 = load i64, ptr @DynAddressMathCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynAddressMathCount, align 8
  %25 = getelementptr inbounds nuw i64, ptr %1, i64 %17
  %26 = load i64, ptr @DynControlFlowCount, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr @DynControlFlowCount, align 8
  br label %28

28:                                               ; preds = %28, %16
  %29 = phi i64 [ 0, %16 ], [ %76, %28 ]
  %30 = phi i64 [ 0, %16 ], [ %71, %28 ]
  %31 = load i64, ptr @DynAddressMathCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynAddressMathCount, align 8
  %33 = getelementptr inbounds nuw i64, ptr %13, i64 %29
  %34 = load i64, ptr @DynMemReadCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynMemReadCount, align 8
  %36 = load i64, ptr %33, align 8, !tbaa !13
  %37 = load i64, ptr @DynAddressMathCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynAddressMathCount, align 8
  %39 = getelementptr inbounds nuw [20 x i64], ptr %25, i64 %29
  %40 = load i64, ptr @DynMemReadCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynMemReadCount, align 8
  %42 = load i64, ptr %39, align 8, !tbaa !13
  %43 = load i64, ptr @DynALUCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynALUCount, align 8
  %45 = mul nsw i64 %42, %36
  %46 = load i64, ptr @DynALUCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynALUCount, align 8
  %48 = add nsw i64 %45, %30
  %49 = load i64, ptr @DynMemWriteCount, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr @DynMemWriteCount, align 8
  store i64 %48, ptr %20, align 8, !tbaa !13
  %51 = load i64, ptr @DynALUCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynALUCount, align 8
  %53 = or disjoint i64 %29, 1
  %54 = load i64, ptr @DynAddressMathCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynAddressMathCount, align 8
  %56 = getelementptr inbounds nuw i64, ptr %13, i64 %53
  %57 = load i64, ptr @DynMemReadCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynMemReadCount, align 8
  %59 = load i64, ptr %56, align 8, !tbaa !13
  %60 = load i64, ptr @DynAddressMathCount, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr @DynAddressMathCount, align 8
  %62 = getelementptr inbounds nuw [20 x i64], ptr %25, i64 %53
  %63 = load i64, ptr @DynMemReadCount, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr @DynMemReadCount, align 8
  %65 = load i64, ptr %62, align 8, !tbaa !13
  %66 = load i64, ptr @DynALUCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynALUCount, align 8
  %68 = mul nsw i64 %65, %59
  %69 = load i64, ptr @DynALUCount, align 8
  %70 = add i64 %69, 1
  store i64 %70, ptr @DynALUCount, align 8
  %71 = add nsw i64 %68, %48
  %72 = load i64, ptr @DynMemWriteCount, align 8
  %73 = add i64 %72, 1
  store i64 %73, ptr @DynMemWriteCount, align 8
  store i64 %71, ptr %20, align 8, !tbaa !13
  %74 = load i64, ptr @DynALUCount, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr @DynALUCount, align 8
  %76 = add nuw nsw i64 %29, 2
  %77 = load i64, ptr @DynALUCount, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr @DynALUCount, align 8
  %79 = icmp eq i64 %76, 20
  %80 = load i64, ptr @DynControlFlowCount, align 8
  %81 = add i64 %80, 1
  store i64 %81, ptr @DynControlFlowCount, align 8
  br i1 %79, label %82, label %28, !llvm.loop !18

82:                                               ; preds = %28
  %83 = load i64, ptr @DynALUCount, align 8
  %84 = add i64 %83, 1
  store i64 %84, ptr @DynALUCount, align 8
  %85 = add nuw nsw i64 %17, 1
  %86 = load i64, ptr @DynALUCount, align 8
  %87 = add i64 %86, 1
  store i64 %87, ptr @DynALUCount, align 8
  %88 = icmp eq i64 %85, 20
  %89 = load i64, ptr @DynControlFlowCount, align 8
  %90 = add i64 %89, 1
  store i64 %90, ptr @DynControlFlowCount, align 8
  br i1 %88, label %91, label %16, !llvm.loop !15

91:                                               ; preds = %82
  %92 = load i64, ptr @DynALUCount, align 8
  %93 = add i64 %92, 1
  store i64 %93, ptr @DynALUCount, align 8
  %94 = add nuw nsw i64 %7, 1
  %95 = load i64, ptr @DynALUCount, align 8
  %96 = add i64 %95, 1
  store i64 %96, ptr @DynALUCount, align 8
  %97 = icmp eq i64 %94, 20
  %98 = load i64, ptr @DynControlFlowCount, align 8
  %99 = add i64 %98, 1
  store i64 %99, ptr @DynControlFlowCount, align 8
  br i1 %97, label %100, label %6, !llvm.loop !16

100:                                              ; preds = %91
  %101 = load i64, ptr @DynControlFlowCount, align 8
  %102 = add i64 %101, 1
  store i64 %102, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(argmem: readwrite) uwtable
define dso_local void @Multiply(ptr noundef readonly captures(none) %0, ptr noundef readonly captures(none) %1, ptr noundef writeonly captures(none) %2) local_unnamed_addr #8 {
  %4 = load i64, ptr @DynControlFlowCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynControlFlowCount, align 8
  br label %6

6:                                                ; preds = %91, %3
  %7 = phi i64 [ 0, %3 ], [ %94, %91 ]
  %8 = load i64, ptr @DynAddressMathCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynAddressMathCount, align 8
  %10 = getelementptr inbounds nuw [20 x i64], ptr %2, i64 %7
  %11 = load i64, ptr @DynAddressMathCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynAddressMathCount, align 8
  %13 = getelementptr inbounds nuw [20 x i64], ptr %0, i64 %7
  %14 = load i64, ptr @DynControlFlowCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynControlFlowCount, align 8
  br label %16

16:                                               ; preds = %82, %6
  %17 = phi i64 [ 0, %6 ], [ %85, %82 ]
  %18 = load i64, ptr @DynAddressMathCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynAddressMathCount, align 8
  %20 = getelementptr inbounds nuw i64, ptr %10, i64 %17
  %21 = load i64, ptr @DynMemWriteCount, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr @DynMemWriteCount, align 8
  store i64 0, ptr %20, align 8, !tbaa !13
  %23 = load i64, ptr @DynAddressMathCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynAddressMathCount, align 8
  %25 = getelementptr inbounds nuw i64, ptr %1, i64 %17
  %26 = load i64, ptr @DynControlFlowCount, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr @DynControlFlowCount, align 8
  br label %28

28:                                               ; preds = %28, %16
  %29 = phi i64 [ 0, %16 ], [ %76, %28 ]
  %30 = phi i64 [ 0, %16 ], [ %71, %28 ]
  %31 = load i64, ptr @DynAddressMathCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynAddressMathCount, align 8
  %33 = getelementptr inbounds nuw i64, ptr %13, i64 %29
  %34 = load i64, ptr @DynMemReadCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynMemReadCount, align 8
  %36 = load i64, ptr %33, align 8, !tbaa !13
  %37 = load i64, ptr @DynAddressMathCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynAddressMathCount, align 8
  %39 = getelementptr inbounds nuw [20 x i64], ptr %25, i64 %29
  %40 = load i64, ptr @DynMemReadCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynMemReadCount, align 8
  %42 = load i64, ptr %39, align 8, !tbaa !13
  %43 = load i64, ptr @DynALUCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynALUCount, align 8
  %45 = mul nsw i64 %42, %36
  %46 = load i64, ptr @DynALUCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynALUCount, align 8
  %48 = add nsw i64 %30, %45
  %49 = load i64, ptr @DynMemWriteCount, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr @DynMemWriteCount, align 8
  store i64 %48, ptr %20, align 8, !tbaa !13
  %51 = load i64, ptr @DynALUCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynALUCount, align 8
  %53 = or disjoint i64 %29, 1
  %54 = load i64, ptr @DynAddressMathCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynAddressMathCount, align 8
  %56 = getelementptr inbounds nuw i64, ptr %13, i64 %53
  %57 = load i64, ptr @DynMemReadCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynMemReadCount, align 8
  %59 = load i64, ptr %56, align 8, !tbaa !13
  %60 = load i64, ptr @DynAddressMathCount, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr @DynAddressMathCount, align 8
  %62 = getelementptr inbounds nuw [20 x i64], ptr %25, i64 %53
  %63 = load i64, ptr @DynMemReadCount, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr @DynMemReadCount, align 8
  %65 = load i64, ptr %62, align 8, !tbaa !13
  %66 = load i64, ptr @DynALUCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynALUCount, align 8
  %68 = mul nsw i64 %65, %59
  %69 = load i64, ptr @DynALUCount, align 8
  %70 = add i64 %69, 1
  store i64 %70, ptr @DynALUCount, align 8
  %71 = add nsw i64 %48, %68
  %72 = load i64, ptr @DynMemWriteCount, align 8
  %73 = add i64 %72, 1
  store i64 %73, ptr @DynMemWriteCount, align 8
  store i64 %71, ptr %20, align 8, !tbaa !13
  %74 = load i64, ptr @DynALUCount, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr @DynALUCount, align 8
  %76 = add nuw nsw i64 %29, 2
  %77 = load i64, ptr @DynALUCount, align 8
  %78 = add i64 %77, 1
  store i64 %78, ptr @DynALUCount, align 8
  %79 = icmp eq i64 %76, 20
  %80 = load i64, ptr @DynControlFlowCount, align 8
  %81 = add i64 %80, 1
  store i64 %81, ptr @DynControlFlowCount, align 8
  br i1 %79, label %82, label %28, !llvm.loop !18

82:                                               ; preds = %28
  %83 = load i64, ptr @DynALUCount, align 8
  %84 = add i64 %83, 1
  store i64 %84, ptr @DynALUCount, align 8
  %85 = add nuw nsw i64 %17, 1
  %86 = load i64, ptr @DynALUCount, align 8
  %87 = add i64 %86, 1
  store i64 %87, ptr @DynALUCount, align 8
  %88 = icmp eq i64 %85, 20
  %89 = load i64, ptr @DynControlFlowCount, align 8
  %90 = add i64 %89, 1
  store i64 %90, ptr @DynControlFlowCount, align 8
  br i1 %88, label %91, label %16, !llvm.loop !15

91:                                               ; preds = %82
  %92 = load i64, ptr @DynALUCount, align 8
  %93 = add i64 %92, 1
  store i64 %93, ptr @DynALUCount, align 8
  %94 = add nuw nsw i64 %7, 1
  %95 = load i64, ptr @DynALUCount, align 8
  %96 = add i64 %95, 1
  store i64 %96, ptr @DynALUCount, align 8
  %97 = icmp eq i64 %94, 20
  %98 = load i64, ptr @DynControlFlowCount, align 8
  %99 = add i64 %98, 1
  store i64 %99, ptr @DynControlFlowCount, align 8
  br i1 %97, label %100, label %6, !llvm.loop !16

100:                                              ; preds = %91
  %101 = load i64, ptr @DynControlFlowCount, align 8
  %102 = add i64 %101, 1
  store i64 %102, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(readwrite, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 -8094, 8095) i32 @RandomInteger() local_unnamed_addr #9 {
  %1 = load i64, ptr @DynMemReadCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynMemReadCount, align 8
  %3 = load i32, ptr @Seed, align 4, !tbaa !1
  %4 = load i64, ptr @DynALUCount, align 8
  %5 = add i64 %4, 1
  store i64 %5, ptr @DynALUCount, align 8
  %6 = mul nsw i32 %3, 133
  %7 = load i64, ptr @DynALUCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynALUCount, align 8
  %9 = add nsw i32 %6, 81
  %10 = load i64, ptr @DynALUCount, align 8
  %11 = add i64 %10, 1
  store i64 %11, ptr @DynALUCount, align 8
  %12 = srem i32 %9, 8095
  %13 = load i64, ptr @DynMemWriteCount, align 8
  %14 = add i64 %13, 1
  store i64 %14, ptr @DynMemWriteCount, align 8
  store i32 %12, ptr @Seed, align 4, !tbaa !1
  %15 = load i64, ptr @DynControlFlowCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynControlFlowCount, align 8
  ret i32 %12
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @initialise_benchmark() local_unnamed_addr #10 {
  %1 = load i64, ptr @DynControlFlowCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynControlFlowCount, align 8
  br label %3

3:                                                ; preds = %59, %0
  %4 = phi i64 [ 0, %0 ], [ %62, %59 ]
  %5 = phi i32 [ 0, %0 ], [ %39, %59 ]
  %6 = load i64, ptr @DynAddressMathCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynAddressMathCount, align 8
  %8 = getelementptr inbounds nuw [20 x i64], ptr @ArrayA_ref, i64 %4
  %9 = load i64, ptr @DynControlFlowCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynControlFlowCount, align 8
  br label %11

11:                                               ; preds = %11, %3
  %12 = phi i64 [ 0, %3 ], [ %53, %11 ]
  %13 = phi i32 [ %5, %3 ], [ %39, %11 ]
  %14 = load i64, ptr @DynALUCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynALUCount, align 8
  %16 = mul nuw nsw i32 %13, 133
  %17 = load i64, ptr @DynALUCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynALUCount, align 8
  %19 = add nuw nsw i32 %16, 81
  %20 = load i64, ptr @DynALUCount, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr @DynALUCount, align 8
  %22 = urem i32 %19, 8095
  %23 = load i64, ptr @DynCastCount, align 8
  %24 = add i64 %23, 1
  store i64 %24, ptr @DynCastCount, align 8
  %25 = zext nneg i32 %22 to i64
  %26 = load i64, ptr @DynAddressMathCount, align 8
  %27 = add i64 %26, 1
  store i64 %27, ptr @DynAddressMathCount, align 8
  %28 = getelementptr inbounds nuw i64, ptr %8, i64 %12
  %29 = load i64, ptr @DynMemWriteCount, align 8
  %30 = add i64 %29, 1
  store i64 %30, ptr @DynMemWriteCount, align 8
  store i64 %25, ptr %28, align 16, !tbaa !13
  %31 = load i64, ptr @DynALUCount, align 8
  %32 = add i64 %31, 1
  store i64 %32, ptr @DynALUCount, align 8
  %33 = mul nuw nsw i32 %22, 133
  %34 = load i64, ptr @DynALUCount, align 8
  %35 = add i64 %34, 1
  store i64 %35, ptr @DynALUCount, align 8
  %36 = add nuw nsw i32 %33, 81
  %37 = load i64, ptr @DynALUCount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @DynALUCount, align 8
  %39 = urem i32 %36, 8095
  %40 = load i64, ptr @DynCastCount, align 8
  %41 = add i64 %40, 1
  store i64 %41, ptr @DynCastCount, align 8
  %42 = zext nneg i32 %39 to i64
  %43 = load i64, ptr @DynAddressMathCount, align 8
  %44 = add i64 %43, 1
  store i64 %44, ptr @DynAddressMathCount, align 8
  %45 = getelementptr inbounds nuw i64, ptr %8, i64 %12
  %46 = load i64, ptr @DynAddressMathCount, align 8
  %47 = add i64 %46, 1
  store i64 %47, ptr @DynAddressMathCount, align 8
  %48 = getelementptr inbounds nuw i8, ptr %45, i64 8
  %49 = load i64, ptr @DynMemWriteCount, align 8
  %50 = add i64 %49, 1
  store i64 %50, ptr @DynMemWriteCount, align 8
  store i64 %42, ptr %48, align 8, !tbaa !13
  %51 = load i64, ptr @DynALUCount, align 8
  %52 = add i64 %51, 1
  store i64 %52, ptr @DynALUCount, align 8
  %53 = add nuw nsw i64 %12, 2
  %54 = load i64, ptr @DynALUCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynALUCount, align 8
  %56 = icmp eq i64 %53, 20
  %57 = load i64, ptr @DynControlFlowCount, align 8
  %58 = add i64 %57, 1
  store i64 %58, ptr @DynControlFlowCount, align 8
  br i1 %56, label %59, label %11, !llvm.loop !19

59:                                               ; preds = %11
  %60 = load i64, ptr @DynALUCount, align 8
  %61 = add i64 %60, 1
  store i64 %61, ptr @DynALUCount, align 8
  %62 = add nuw nsw i64 %4, 1
  %63 = load i64, ptr @DynALUCount, align 8
  %64 = add i64 %63, 1
  store i64 %64, ptr @DynALUCount, align 8
  %65 = icmp eq i64 %62, 20
  %66 = load i64, ptr @DynControlFlowCount, align 8
  %67 = add i64 %66, 1
  store i64 %67, ptr @DynControlFlowCount, align 8
  br i1 %65, label %68, label %3, !llvm.loop !20

68:                                               ; preds = %124, %59
  %69 = phi i64 [ %127, %124 ], [ 0, %59 ]
  %70 = phi i32 [ %104, %124 ], [ %39, %59 ]
  %71 = load i64, ptr @DynAddressMathCount, align 8
  %72 = add i64 %71, 1
  store i64 %72, ptr @DynAddressMathCount, align 8
  %73 = getelementptr inbounds nuw [20 x i64], ptr @ArrayB_ref, i64 %69
  %74 = load i64, ptr @DynControlFlowCount, align 8
  %75 = add i64 %74, 1
  store i64 %75, ptr @DynControlFlowCount, align 8
  br label %76

76:                                               ; preds = %76, %68
  %77 = phi i64 [ 0, %68 ], [ %118, %76 ]
  %78 = phi i32 [ %70, %68 ], [ %104, %76 ]
  %79 = load i64, ptr @DynALUCount, align 8
  %80 = add i64 %79, 1
  store i64 %80, ptr @DynALUCount, align 8
  %81 = mul nuw nsw i32 %78, 133
  %82 = load i64, ptr @DynALUCount, align 8
  %83 = add i64 %82, 1
  store i64 %83, ptr @DynALUCount, align 8
  %84 = add nuw nsw i32 %81, 81
  %85 = load i64, ptr @DynALUCount, align 8
  %86 = add i64 %85, 1
  store i64 %86, ptr @DynALUCount, align 8
  %87 = urem i32 %84, 8095
  %88 = load i64, ptr @DynCastCount, align 8
  %89 = add i64 %88, 1
  store i64 %89, ptr @DynCastCount, align 8
  %90 = zext nneg i32 %87 to i64
  %91 = load i64, ptr @DynAddressMathCount, align 8
  %92 = add i64 %91, 1
  store i64 %92, ptr @DynAddressMathCount, align 8
  %93 = getelementptr inbounds nuw i64, ptr %73, i64 %77
  %94 = load i64, ptr @DynMemWriteCount, align 8
  %95 = add i64 %94, 1
  store i64 %95, ptr @DynMemWriteCount, align 8
  store i64 %90, ptr %93, align 16, !tbaa !13
  %96 = load i64, ptr @DynALUCount, align 8
  %97 = add i64 %96, 1
  store i64 %97, ptr @DynALUCount, align 8
  %98 = mul nuw nsw i32 %87, 133
  %99 = load i64, ptr @DynALUCount, align 8
  %100 = add i64 %99, 1
  store i64 %100, ptr @DynALUCount, align 8
  %101 = add nuw nsw i32 %98, 81
  %102 = load i64, ptr @DynALUCount, align 8
  %103 = add i64 %102, 1
  store i64 %103, ptr @DynALUCount, align 8
  %104 = urem i32 %101, 8095
  %105 = load i64, ptr @DynCastCount, align 8
  %106 = add i64 %105, 1
  store i64 %106, ptr @DynCastCount, align 8
  %107 = zext nneg i32 %104 to i64
  %108 = load i64, ptr @DynAddressMathCount, align 8
  %109 = add i64 %108, 1
  store i64 %109, ptr @DynAddressMathCount, align 8
  %110 = getelementptr inbounds nuw i64, ptr %73, i64 %77
  %111 = load i64, ptr @DynAddressMathCount, align 8
  %112 = add i64 %111, 1
  store i64 %112, ptr @DynAddressMathCount, align 8
  %113 = getelementptr inbounds nuw i8, ptr %110, i64 8
  %114 = load i64, ptr @DynMemWriteCount, align 8
  %115 = add i64 %114, 1
  store i64 %115, ptr @DynMemWriteCount, align 8
  store i64 %107, ptr %113, align 8, !tbaa !13
  %116 = load i64, ptr @DynALUCount, align 8
  %117 = add i64 %116, 1
  store i64 %117, ptr @DynALUCount, align 8
  %118 = add nuw nsw i64 %77, 2
  %119 = load i64, ptr @DynALUCount, align 8
  %120 = add i64 %119, 1
  store i64 %120, ptr @DynALUCount, align 8
  %121 = icmp eq i64 %118, 20
  %122 = load i64, ptr @DynControlFlowCount, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr @DynControlFlowCount, align 8
  br i1 %121, label %124, label %76, !llvm.loop !21

124:                                              ; preds = %76
  %125 = load i64, ptr @DynALUCount, align 8
  %126 = add i64 %125, 1
  store i64 %126, ptr @DynALUCount, align 8
  %127 = add nuw nsw i64 %69, 1
  %128 = load i64, ptr @DynALUCount, align 8
  %129 = add i64 %128, 1
  store i64 %129, ptr @DynALUCount, align 8
  %130 = icmp eq i64 %127, 20
  %131 = load i64, ptr @DynControlFlowCount, align 8
  %132 = add i64 %131, 1
  store i64 %132, ptr @DynControlFlowCount, align 8
  br i1 %130, label %133, label %68, !llvm.loop !22

133:                                              ; preds = %124
  %134 = load i64, ptr @DynMemWriteCount, align 8
  %135 = add i64 %134, 1
  store i64 %135, ptr @DynMemWriteCount, align 8
  store i32 %104, ptr @Seed, align 4, !tbaa !1
  %136 = load i64, ptr @DynControlFlowCount, align 8
  %137 = add i64 %136, 1
  store i64 %137, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @verify_benchmark(i32 noundef %0) local_unnamed_addr #11 {
  %2 = tail call i32 @bcmp(ptr noundef nonnull dereferenceable(3200) @ResultArray, ptr noundef nonnull dereferenceable(3200) @__const.verify_benchmark.exp, i64 3200)
  %3 = load i64, ptr @DynALUCount, align 8
  %4 = add i64 %3, 1
  store i64 %4, ptr @DynALUCount, align 8
  %5 = icmp eq i32 %2, 0
  %6 = load i64, ptr @DynCastCount, align 8
  %7 = add i64 %6, 1
  store i64 %7, ptr @DynCastCount, align 8
  %8 = zext i1 %5 to i32
  %9 = load i64, ptr @DynControlFlowCount, align 8
  %10 = add i64 %9, 1
  store i64 %10, ptr @DynControlFlowCount, align 8
  ret i32 %8
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
  %1 = load i64, ptr @DynMemReadCount, align 8
  %2 = add i64 %1, 1
  store i64 %2, ptr @DynMemReadCount, align 8
  %3 = load i64, ptr @seed, align 8, !tbaa !13
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
  store i64 %12, ptr @seed, align 8, !tbaa !13
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
define dso_local void @srand_beebs(i32 noundef %0) local_unnamed_addr #7 {
  %2 = load i64, ptr @DynCastCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynCastCount, align 8
  %4 = zext i32 %0 to i64
  %5 = load i64, ptr @DynMemWriteCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynMemWriteCount, align 8
  store i64 %4, ptr @seed, align 8, !tbaa !13
  %7 = load i64, ptr @DynControlFlowCount, align 8
  %8 = add i64 %7, 1
  store i64 %8, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(write, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local void @init_heap_beebs(ptr noundef %0, i64 noundef %1) local_unnamed_addr #10 {
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
  store ptr %0, ptr @heap_ptr, align 8, !tbaa !23
  %17 = load i64, ptr @DynAddressMathCount, align 8
  %18 = add i64 %17, 1
  store i64 %18, ptr @DynAddressMathCount, align 8
  %19 = getelementptr inbounds nuw i8, ptr %0, i64 %1
  %20 = load i64, ptr @DynMemWriteCount, align 8
  %21 = add i64 %20, 1
  store i64 %21, ptr @DynMemWriteCount, align 8
  store ptr %19, ptr @heap_end, align 8, !tbaa !23
  %22 = load i64, ptr @DynMemWriteCount, align 8
  %23 = add i64 %22, 1
  store i64 %23, ptr @DynMemWriteCount, align 8
  store i64 0, ptr @heap_requested, align 8, !tbaa !13
  %24 = load i64, ptr @DynControlFlowCount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @DynControlFlowCount, align 8
  ret void
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind sspstrong willreturn memory(read, argmem: none, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local range(i32 0, 2) i32 @check_heap_beebs(ptr noundef readnone captures(address) %0) local_unnamed_addr #13 {
  %2 = load i64, ptr @DynMemReadCount, align 8
  %3 = add i64 %2, 1
  store i64 %3, ptr @DynMemReadCount, align 8
  %4 = load i64, ptr @heap_requested, align 8, !tbaa !13
  %5 = load i64, ptr @DynAddressMathCount, align 8
  %6 = add i64 %5, 1
  store i64 %6, ptr @DynAddressMathCount, align 8
  %7 = getelementptr inbounds nuw i8, ptr %0, i64 %4
  %8 = load i64, ptr @DynMemReadCount, align 8
  %9 = add i64 %8, 1
  store i64 %9, ptr @DynMemReadCount, align 8
  %10 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
define dso_local ptr @malloc_beebs(i64 noundef %0) local_unnamed_addr #9 {
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
  %10 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %11 = load i64, ptr @DynAddressMathCount, align 8
  %12 = add i64 %11, 1
  store i64 %12, ptr @DynAddressMathCount, align 8
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 %0
  %14 = load i64, ptr @DynMemReadCount, align 8
  %15 = add i64 %14, 1
  store i64 %15, ptr @DynMemReadCount, align 8
  %16 = load i64, ptr @heap_requested, align 8, !tbaa !13
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
  store i64 %35, ptr @heap_requested, align 8, !tbaa !13
  %41 = load i64, ptr @DynMemReadCount, align 8
  %42 = add i64 %41, 1
  store i64 %42, ptr @DynMemReadCount, align 8
  %43 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
  store ptr %38, ptr @heap_ptr, align 8, !tbaa !23
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
define dso_local ptr @calloc_beebs(i64 noundef %0, i64 noundef %1) local_unnamed_addr #14 {
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
  %14 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
  %15 = load i64, ptr @DynAddressMathCount, align 8
  %16 = add i64 %15, 1
  store i64 %16, ptr @DynAddressMathCount, align 8
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 %5
  %18 = load i64, ptr @DynMemReadCount, align 8
  %19 = add i64 %18, 1
  store i64 %19, ptr @DynMemReadCount, align 8
  %20 = load i64, ptr @heap_requested, align 8, !tbaa !13
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
  store i64 %39, ptr @heap_requested, align 8, !tbaa !13
  %45 = load i64, ptr @DynMemReadCount, align 8
  %46 = add i64 %45, 1
  store i64 %46, ptr @DynMemReadCount, align 8
  %47 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
  store ptr %42, ptr @heap_ptr, align 8, !tbaa !23
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

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr writeonly captures(none), i8, i64, i1 immarg) #15

; Function Attrs: nofree norecurse nosync nounwind sspstrong memory(readwrite, inaccessiblemem: none, target_mem0: none, target_mem1: none) uwtable
define dso_local ptr @realloc_beebs(ptr noundef readonly captures(address_is_null) %0, i64 noundef %1) local_unnamed_addr #3 {
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
  %20 = load ptr, ptr @heap_ptr, align 8, !tbaa !23
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
  %29 = load i64, ptr @heap_requested, align 8, !tbaa !13
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
  store i64 %48, ptr @heap_requested, align 8, !tbaa !13
  %54 = load i64, ptr @DynMemReadCount, align 8
  %55 = add i64 %54, 1
  store i64 %55, ptr @DynMemReadCount, align 8
  %56 = load ptr, ptr @heap_end, align 8, !tbaa !23
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
  store ptr %51, ptr @heap_ptr, align 8, !tbaa !23
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
  %110 = load <16 x i8>, ptr %104, align 1, !tbaa !25
  %111 = load i64, ptr @DynMemReadCount, align 8
  %112 = add i64 %111, 1
  store i64 %112, ptr @DynMemReadCount, align 8
  %113 = load <16 x i8>, ptr %107, align 1, !tbaa !25
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
  store <16 x i8> %110, ptr %116, align 1, !tbaa !25
  %122 = load i64, ptr @DynMemWriteCount, align 8
  %123 = add i64 %122, 1
  store i64 %123, ptr @DynMemWriteCount, align 8
  store <16 x i8> %113, ptr %119, align 1, !tbaa !25
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
  br i1 %129, label %132, label %100, !llvm.loop !26

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
  br i1 %141, label %178, label %144, !prof !29

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
  %158 = load <4 x i8>, ptr %155, align 1, !tbaa !25
  %159 = load i64, ptr @DynAddressMathCount, align 8
  %160 = add i64 %159, 1
  store i64 %160, ptr @DynAddressMathCount, align 8
  %161 = getelementptr inbounds nuw i8, ptr %20, i64 %152
  %162 = load i64, ptr @DynMemWriteCount, align 8
  %163 = add i64 %162, 1
  store i64 %163, ptr @DynMemWriteCount, align 8
  store <4 x i8> %158, ptr %161, align 1, !tbaa !25
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
  br i1 %169, label %172, label %151, !llvm.loop !30

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
  %196 = load i8, ptr %193, align 1, !tbaa !25
  %197 = load i64, ptr @DynAddressMathCount, align 8
  %198 = add i64 %197, 1
  store i64 %198, ptr @DynAddressMathCount, align 8
  %199 = getelementptr inbounds nuw i8, ptr %20, i64 %189
  %200 = load i64, ptr @DynMemWriteCount, align 8
  %201 = add i64 %200, 1
  store i64 %201, ptr @DynMemWriteCount, align 8
  store i8 %196, ptr %199, align 1, !tbaa !25
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
  br i1 %210, label %213, label %188, !llvm.loop !31

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
  %230 = load i8, ptr %227, align 1, !tbaa !25
  %231 = load i64, ptr @DynAddressMathCount, align 8
  %232 = add i64 %231, 1
  store i64 %232, ptr @DynAddressMathCount, align 8
  %233 = getelementptr inbounds nuw i8, ptr %20, i64 %224
  %234 = load i64, ptr @DynMemWriteCount, align 8
  %235 = add i64 %234, 1
  store i64 %235, ptr @DynMemWriteCount, align 8
  store i8 %230, ptr %233, align 1, !tbaa !25
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
  %244 = load i8, ptr %241, align 1, !tbaa !25
  %245 = load i64, ptr @DynAddressMathCount, align 8
  %246 = add i64 %245, 1
  store i64 %246, ptr @DynAddressMathCount, align 8
  %247 = getelementptr inbounds nuw i8, ptr %20, i64 %238
  %248 = load i64, ptr @DynMemWriteCount, align 8
  %249 = add i64 %248, 1
  store i64 %249, ptr @DynMemWriteCount, align 8
  store i8 %244, ptr %247, align 1, !tbaa !25
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
  %258 = load i8, ptr %255, align 1, !tbaa !25
  %259 = load i64, ptr @DynAddressMathCount, align 8
  %260 = add i64 %259, 1
  store i64 %260, ptr @DynAddressMathCount, align 8
  %261 = getelementptr inbounds nuw i8, ptr %20, i64 %252
  %262 = load i64, ptr @DynMemWriteCount, align 8
  %263 = add i64 %262, 1
  store i64 %263, ptr @DynMemWriteCount, align 8
  store i8 %258, ptr %261, align 1, !tbaa !25
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
  %272 = load i8, ptr %269, align 1, !tbaa !25
  %273 = load i64, ptr @DynAddressMathCount, align 8
  %274 = add i64 %273, 1
  store i64 %274, ptr @DynAddressMathCount, align 8
  %275 = getelementptr inbounds nuw i8, ptr %20, i64 %266
  %276 = load i64, ptr @DynMemWriteCount, align 8
  %277 = add i64 %276, 1
  store i64 %277, ptr @DynMemWriteCount, align 8
  store i8 %272, ptr %275, align 1, !tbaa !25
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
  br i1 %283, label %286, label %223, !llvm.loop !33

286:                                              ; preds = %223, %213, %172, %132, %62, %17, %2
  %287 = phi ptr [ null, %2 ], [ null, %17 ], [ null, %62 ], [ %20, %132 ], [ %20, %172 ], [ %20, %223 ], [ %20, %213 ]
  %288 = load i64, ptr @DynControlFlowCount, align 8
  %289 = add i64 %288, 1
  store i64 %289, ptr @DynControlFlowCount, align 8
  ret ptr %287
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
