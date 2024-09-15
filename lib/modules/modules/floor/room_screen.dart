import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/patient_room/patient_cubit.dart';
import 'package:waseem/cubit/radiograph/radio_graph_cubit.dart';
import 'package:waseem/modules/consult_view.dart';
import 'package:waseem/modules/information_view.dart';
import 'package:waseem/modules/modules/IntensiveCareScreen.dart';
import 'package:waseem/modules/modules/clinical_form/clinical_form_screen.dart';
import 'package:waseem/modules/modules/screen_test_nurse_view.dart';
import 'package:waseem/modules/modules/show_intensive_view.dart';
import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../ScreeingTest.dart';
import '../drawer/drawer.dart';
import '../getallsurgerys.dart';
import '../summary_charge_file.dart';
import '../surgery_view.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({
    super.key,
    required this.title,
    required this.isAvailable,
    required this.roomId,
  });

  final String title;
  final bool isAvailable;
  final int roomId;

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<PatientCubit>(context)
          .getPatientByRoom(widget.roomId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.back,
      endDrawer: DefaultDrawer(
        context: context,
      ),
      endDrawerEnableOpenDragGesture: true,
      appBar: CustomTextAppBar(
        context: context,
        title: widget.title,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => scaffoldKey.currentState!.openEndDrawer(),
            child: SvgPicture.asset(
              Assets.menu,
            ),
          ),
          20.horizontalSpace,
        ],
      ),
      body: widget.isAvailable
          ? BlocConsumer<PatientCubit, PatientState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.patientStatus == PatientStatus.loading) {
                  return const CircularProgressIndicator();
                }
                if (BlocProvider.of<PatientCubit>(context).patient == null) {
                  return const CircularProgressIndicator();
                }
                PatientId.patientID =
                    BlocProvider.of<PatientCubit>(context).patient['id'];
                if (Token.type == 'Doctor') {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      print(PatientId.patientID);
                      return SingleChildScrollView(
                        child: Container(
                          // width: double.infinity,
                          // height: constraints.maxHeight,
                          width: double.infinity,
                          constraints: constraints.copyWith(
                            minHeight: constraints.maxHeight,
                            // -(widget.padding.top + widget.padding.bottom),
                            maxHeight: double.infinity,
                          ),
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 38.w,
                                vertical: 40.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  DefaultButton(
                                    text: "المعلومات الشخصية",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  InformationView(
                                                    details: BlocProvider.of<
                                                                PatientCubit>(
                                                            context)
                                                        .patient,
                                                  )));
                                    },
                                  ),
                                  40.verticalSpace,
                                  BlocListener<AppCubit, AppState>(
                                    listener: (context, state) {},
                                    child: DefaultButton(
                                      text: "استمارة الفحص السريري",
                                      width: double.infinity,
                                      onPressed: () async {
                                        await BlocProvider.of<AppCubit>(context).getPatientByRoom(widget.roomId) ;
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const ClinicalFormScreen()));
                                      },
                                    ),
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "استمارات العناية الخاصة بالمريض",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const ShowIntensiveView()));
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "استمارة العناية المركزة",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const IntensiveCareScreen(
                                                      title: 'عناية مشددة',
                                                      isAvailable: true)));
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "التحاليل الدورية",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreeingTestForm()));
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "عرض اختبارات المريض",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScreeingTestForm()));

                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "التحاليل المخبرية",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => A()));
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "الصور الشعاعية",
                                    width: double.infinity,
                                    onPressed: () {
                                      context.push('/getPatientRadioItem');
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "طلب استشارة",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ConsultView()));
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "طلب تحاليل مخبرية",
                                    width: double.infinity,
                                    onPressed: () {
                                      context.push('/AddMedicalExamsPage');
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "طلب صورة شعاعية",
                                    width: double.infinity,
                                    onPressed: () {
                                      context.push('/addradiograph');
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    text: "استمارة الخروج",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SummaryChargeForm()));
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    //DeathFileForm
                                    text: "استمارة الوفاة",
                                    width: double.infinity,
                                    onPressed: () {
                                      context.push('/DeathFileForm');
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    //DeathFileForm
                                    text: "عرض استمارات الوفاة",
                                    width: double.infinity,
                                    onPressed: () {
                                      context.push('/GetDeathFileItem');
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    //DeathFileForm
                                    text: "عرض استمارات التخريج",
                                    width: double.infinity,
                                    onPressed: () {
                                      context.push('/getsummarychargeItem');
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    //DeathFileForm
                                    text: "اضافة استمارة عمليات",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SurgeryClass()));
                                    },
                                  ),
                                  40.verticalSpace,
                                  DefaultButton(
                                    //DeathFileForm
                                    text: "استمارات العمليات",
                                    width: double.infinity,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  getAllSurgeryScreen()));
                                    },
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
                return LayoutBuilder(
                  builder: (context, constraints) {
                    print(PatientId.patientID);
                    return SingleChildScrollView(
                      child: Container(
                        // width: double.infinity,
                        // height: constraints.maxHeight,
                        width: double.infinity,
                        constraints: constraints.copyWith(
                          minHeight: constraints.maxHeight,
                          // -(widget.padding.top + widget.padding.bottom),
                          maxHeight: double.infinity,
                        ),
                        child: IntrinsicHeight(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 38.w,
                              vertical: 40.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Spacer(),
                                DefaultButton(
                                  text: "المعلومات الشخصية",
                                  width: double.infinity,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InformationView(
                                                  details: BlocProvider.of<
                                                          PatientCubit>(context)
                                                      .patient,
                                                )));
                                  },
                                ),
                                40.verticalSpace,
                                DefaultButton(
                                  text: "عرض التحاليل الدورية",
                                  width: double.infinity,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenTestNurseView()));
                                  },
                                ),
                                40.verticalSpace,
                                DefaultButton(
                                  text: "عرض اختبارات المريض",
                                  width: double.infinity,
                                  onPressed: () {
                                    context.push('/GetPatientTestScreen');
                                  },
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.search,
                  ),
                  Text(
                    "الغرفة فارغة ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: "AlmaraiRegular",
                      color: AppColors.black,
                      // fontFamily: "AlmaraiBold",
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
