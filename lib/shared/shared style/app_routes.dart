import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../cubit/AddMedicalExamsPage/add_medical_exams_cubit.dart';
import '../../cubit/AddVisual/AddVisual_cubit.dart';
import '../../cubit/ChestExamination/chestExamination_Cubit.dart';
import '../../cubit/GetPatientTestDoctor/GetPatientTest_Cubit.dart';
import '../../cubit/GetRadiograph/GetRadiograph_cubit.dart';
import '../../cubit/ScreeingTest/ScreeingTest_Cubit.dart';
import '../../cubit/addVital/addvital_cubit.dart';
import '../../cubit/add_Limbs_Examination/add_Limbs_Examination_Cubit.dart';
import '../../cubit/add_abdomen_examination/add_abdomen_examination_cubit.dart';
import '../../cubit/add_neck_examination/add_neck_examination_Cubit.dart';
import '../../cubit/death/death_file_cubit.dart';
import '../../cubit/getMedicalExamination/getMedicalExamination_cubit.dart';
import '../../cubit/getPAtientExam/getPAtientExam_cubit.dart';
import '../../cubit/getPatientRadio/getPatientRadio_cubit.dart';
import '../../cubit/getdeathfile/getdeathfile_cubit.dart';
import '../../cubit/getsummarychage/getsummarychage_cubit.dart';
import '../../cubit/head/head_Cubit.dart';
import '../../cubit/login/login_cubit.dart';
import '../../cubit/radiograph/radio_graph_cubit.dart';
import '../../cubit/summaryCharge/summary_charge_cubit.dart';
import '../../modules/modules/AddVisual.dart';
import '../../modules/modules/ChestExaminationScreen.dart';
import '../../modules/modules/Death_File.dart';
import '../../modules/modules/GetMedicalExaminationScreen.dart';
import '../../modules/modules/Getradiograph.dart';
import '../../modules/modules/HeadScreen.dart';
import '../../modules/modules/LimbScreen.dart';
import '../../modules/modules/ScreeingTest.dart';
import '../../modules/modules/abdomenScreen.dart';
import '../../modules/modules/addNeckExamScreen.dart';
import '../../modules/modules/addVitalScreen.dart';
import '../../modules/modules/add_medical_exam.dart';
import '../../modules/modules/add_radio_graph.dart';
import '../../modules/modules/getPatientExamScreen.dart';
import '../../modules/modules/getPatientRadio.dart';
import '../../modules/modules/get_death_file.dart';
import '../../modules/modules/getpatientTestScreen.dart';
import '../../modules/modules/getsummarycharge.dart';
import '../../modules/modules/login/login_screen.dart';
import '../../modules/modules/splash/splash_screen.dart';
import '../../modules/modules/summary_charge_file.dart';
import '../shared network/local/cache_helper.dart';
import '../shared network/local/cache_key.dart';

class RoutesName {
  static const splashScreen = '/splashScreen';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const tripDetails = '/tripDetails';
  static const tripActivities = '/tripActivities';

}

final appRouter = GoRouter(
  initialLocation: '/SplashScreen',  // تحديد المسار الافتراضي
// intialRoute  حط فيه الراوت الأولاني
  routes: [ GoRoute(
    path: '/SplashScreen',
    builder: (context, state) => BlocProvider(
      create: (context) => LoginCubit(),
      child: SplashScreen(),
    ),
  ), GoRoute(
    path: '/LoginScreen',
    builder: (context, state) => BlocProvider(
      create: (context) => LoginCubit(),
      child: LoginScreen(),
    ),
  ),
    GoRoute(
      path: '/abdomenScreen',
      builder: (context, state) => BlocProvider(
        create: (context) => abdomenCubit(),
        child: abdomenScreen(),
      ),
    ),
    GoRoute(
      path: '/AddMedicalExamsPage',
      builder: (context, state) => BlocProvider(
        create: (context) => addmedicalexamsCubit(),
        child: AddMedicalExamsPage(),
      ),
    ),
    GoRoute(
      path: '/addradiograph',
      builder: (context, state) => BlocProvider(
        create: (context) => addradiographCubit(),
        child: addradiograph(),
      ),
    ),
    GoRoute(
      path: '/AddNeckExamScreen',
      builder: (context, state) => BlocProvider(
        create: (context) => addNeckExamCubit(),
        child:  AddNeckExamScreen(),
      ),
    ),
    GoRoute(
      path: '/AddVisualPage',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => AddVisualCubit(),
          child: AddVisualPage(

          ),
        );
      },
    ),
  /*  GoRoute(
      path: '/tripActivities',
      builder: (context, state) {
        final tripId = state.extra as int;
        return BlocProvider(
          create: (context) => TripActivitiesCubit(tripId),
          child: ActivitiesScreen(),
        );
      },
    ),*/
    GoRoute(
        path: '/addVital',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => addVitalCubit(),
            child: addVital(),
          );
        }),


    GoRoute(
        path: '/ChestExaminationForm',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ChestExaminationCubit(),
            child: ChestExaminationForm(),
          );
        }),
    GoRoute(
        path: '/DeathFileForm',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => DeathFileCubit(),
            child: DeathFileForm(),
          );
        }) ,

    GoRoute(
        path: '/GetDeathFileItem',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => GetDeathFileCubit()..fetchGetDeathFile( ),
            child: GetDeathFileItem(),
          );
        }) ,GoRoute(
        path: '/GetMedicalExaminationScreen',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => GetMedicalExaminationCubit(),
            child: GetMedicalExaminationScreen(),
          );
        }) ,GoRoute(
        path: '/getPatientExamScreen',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getPAtientExamCubit(),
            child: getPatientExamScreen(),
          );
        }),
    GoRoute(
        path: '/getPatientRadioItem',
        builder: (context, state) {
          String token =           "${CacheHelper.getData(key: CacheKey.token)}";
          return BlocProvider(
            //          'token': "${CacheHelper.getData(key: CacheKey.token)}",

            create: (context) => getPatientRadioCubit()..fetchRadiographs(token),
            child: getPatientRadioItem(),
          );
        }),GoRoute(








        path: '/Getradiograph',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => GetradiographCubit(),
            child: Getradiograph(),
          );
        }),GoRoute(
        path: '/getsummarychargeItem',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => getsummarychargeCubit(),
            child: getsummarychargeItem(),
          );
        }),GoRoute(
        path: '/HeadForm',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => HeadCubit(),
            child: HeadForm(),
          );
        }),GoRoute(
        path: '/LimbForm',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LimbCubit(),
            child: LimbForm(),
          );
        }),GoRoute(
        path: '/ScreeingTestForm',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => ScreeingTestCubit(),
            child: ScreeingTestForm(),
          );
        }),GoRoute(
        path: '/SummaryChargeForm',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => summaryChargeCubit(),
            child: SummaryChargeForm(),
          );
        }),
    GoRoute(
        path: '/GetPatientTestScreen',
        builder: (context, state) {
          return BlocProvider(
            create: (context) => GetPatientTestDoctorCubit(),
            child: GetPatientTestScreen(),
          );
        }),


  ],
);
