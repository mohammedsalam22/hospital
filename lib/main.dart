/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/ChestExamination/chestExamination_Cubit.dart';
import 'cubit/add_neck_examination/add_neck_examination_Cubit.dart';
import 'cubit/head/head_Cubit.dart';
import 'modules/modules/ChestExaminationScreen.dart';
import 'modules/modules/HeadScreen.dart';
import 'modules/modules/addNeckExamScreen.dart';
void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ChestExaminationCubit>(
          create: (context) => ChestExaminationCubit(),
        ),
        // يمكنك إضافة مزودين آخرين هنا إذا لزم الأمر
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChestExaminationForm(),
    );
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/ChestExamination/chestExamination_Cubit.dart';
import 'cubit/add_neck_examination/add_neck_examination_Cubit.dart';
import 'cubit/getnotresponsetest/getnotresponse_cubit.dart';
import 'data/api/addNeckExam_api.dart';
import 'modules/modules/ChestExaminationScreen.dart';
import 'modules/modules/addNeckExamScreen.dart';
import 'modules/modules/getnotresponseScreen.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ChestExaminationCubit(),
        child: ChestExaminationForm(),
      ),
    );
  }
}
*/

/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // DioHelper.init();
  // await CacheHelper.init();
  NotifyServices().initNotify() ;
  IO.Socket socket = IO.io(ApiConstant.base, <String, dynamic>{
    'transports': ['websocket'],
    'autoConnect': true,
  });

  socket.on('connect', (_) {
    print('connected');
    socket.emit('join', Id.id);
  });

  socket.on('disconnect', (_) => print('disconnected'));

  socket.on('consult', (data) {
    NotifyServices().showNotification
      (id: 1, title: 'notification' ,body: data['message']) ;
    print('Received notification: $data');
  });

  socket.connect();

  runApp(BlocProvider(
    create: (context) => DeathFileCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.back,
          ),
          supportedLocales: const [
            Locale('ar', ''), // دعم اللغة العربية فقط
          ],
          locale: Locale('ar'), // Set default locale to Arabic
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}*/
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:waseem/cubit/Intensive%20Care%20vitals%20final%20part_Cubit/Intensive%20Care%20vitals%20final%20part_Cubit.dart';
// import 'package:waseem/cubit/app/app_cubit.dart';
// import 'package:waseem/cubit/check_cubit/check_cubit.dart';
// import 'package:waseem/cubit/floor/floor_cubit.dart';
// import 'package:waseem/cubit/getPAtientExam/getPAtientExam_cubit.dart';
// import 'package:waseem/cubit/notification_cubit/notification_cubit.dart';
// import 'package:waseem/cubit/patient_room/patient_cubit.dart';
// import 'package:waseem/cubit/radiograph/radio_graph_cubit.dart';
// import 'package:waseem/cubit/summaryCharge/summary_charge_cubit.dart';
// import 'package:waseem/cubit/surgery_cubit/surgery_cubit.dart';
// import 'package:waseem/cubit/view-patient_cubit/view_patient_cubit.dart';
//
// import 'package:waseem/shared/shared%20network/local/cache_helper.dart';
// import 'package:waseem/shared/shared%20network/local/cache_key.dart';
// import 'package:waseem/shared/shared%20network/remote/dio_helper.dart';
// import 'package:waseem/shared/shared%20style/app_routes.dart';
//
// import 'package:waseem/shared/shared%20style/colors.dart';
//
import 'cubit/Intensive Care vitals final part_Cubit/Intensive Care vitals final part_Cubit.dart';
import 'cubit/IntensiveCarechangablesththirdpart_Cubit/cubit.IntensiveCarechangablesththirdpart_Cubit.dart';
import 'cubit/ScreeingTest/ScreeingTest_Cubit.dart';
import 'cubit/addIntensiveCaretheseconde_Cubit/cubit.addIntensiveCaretheseconde_Cubit.dart';
import 'cubit/check_cubit/check_cubit.dart';
import 'cubit/death/death_file_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubit/floor/floor_cubit.dart';
import 'cubit/getPAtientExam/getPAtientExam_cubit.dart';
import 'cubit/get_all_surgery_cubit/getallsurgerycubit_cubit.dart';
import 'cubit/get_sugery_details_cubit/getsurgerydetails_cubit.dart';
import 'cubit/notification_cubit/notification_cubit.dart';
import 'cubit/summaryCharge/summary_charge_cubit.dart';
import 'cubit/surgery_cubit/surgery_cubit.dart';
import 'cubit/the_first_part_Cubit/the first part_Cubit.dart';
import 'cubit/view-patient_cubit/view_patient_cubit.dart';
import 'modules/modules/getPatientRadio.dart';
import 'modules/modules/getpatientTestScreen.dart';
import 'modules/modules/splash/splash_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   DioHelper.init();
//   await CacheHelper.init();
//
//   runApp(MultiBlocProvider(
//     providers: [
//       BlocProvider(
//         create: (context) => PatientCubit(),
//       ),
//       BlocProvider(
//         create: (context) => DeathFileCubit(),
//       ),
//       BlocProvider(
//         create: (context) => summaryChargeCubit(),
//       ),
//       BlocProvider(
//         create: (context) => NotificationCubit(),
//       ),
//       BlocProvider(
//         create: (context) => finalSectionCubit(),
//       ),
//       BlocProvider(
//         create: (context) => firstpartCubit(),
//       ),
//       BlocProvider(
//         create: (context) => threeSectionCubit(),
//       ),
//       BlocProvider(
//         create: (context) => SecondpartCubit(),
//       ),BlocProvider(
//         create: (context) => ViewPatientCubit(),
//       ),BlocProvider(
//         create: (context) => CheckCubit(),
//       ),BlocProvider(
//         create: (context) => SurgeryCubit(),
//       ),BlocProvider(
//         create: (context) => GetallsurgerycubitCubit(),
//       ),BlocProvider(
//         create: (context) => FloorCubit(),
//       ),BlocProvider(
//         create: (context) => GetsurgerydetailsCubit(),
//       ),
//       BlocProvider(
//         create: (context) => getPAtientExamCubit(),
//       ),
//       BlocProvider(
//         create: (context) => addradiographCubit(),
//       ),BlocProvider(
//         create: (context) => AppCubit(),
//       ),
//     ],
//     child: MyApp(appRouter: appRouter),
//   ));
// }
//
// class MyApp extends StatelessWidget {
//   final GoRouter appRouter;
//
//   const MyApp({required this.appRouter, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(360, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (_, child) {
//         return MaterialApp.router(
//           debugShowCheckedModeBanner: false,
//           title: 'Tour Valve',
//           theme: ThemeData(
//             datePickerTheme: DatePickerThemeData(
//                 headerHeadlineStyle: TextStyle(
//               fontSize: 16,
//             )),
//
//             // textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
//             colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
//             useMaterial3: true,
//             scaffoldBackgroundColor: AppColors.back,
//           ),
//           routerConfig: appRouter,
//           supportedLocales: const [
//             Locale('ar', ''), // دعم اللغة العربية فقط
//           ],
//           locale: const Locale('ar'),
//           // تعيين اللغة الافتراضية للعربية
//           localizationsDelegates: const [
//             GlobalMaterialLocalizations.delegate,
//             GlobalWidgetsLocalizations.delegate,
//             GlobalCupertinoLocalizations.delegate,
//           ],
//         );
//       },
//       child: const SplashScreen(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/cubit/app/app_cubit.dart';

import 'package:waseem/shared/shared%20network/local/cache_helper.dart';
import 'package:waseem/shared/shared%20network/local/cache_key.dart';
import 'package:waseem/shared/shared%20network/remote/dio_helper.dart';

import 'package:waseem/shared/shared%20style/colors.dart';

import 'cubit/death/death_file_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'cubit/patient_room/patient_cubit.dart';
import 'cubit/radiograph/radio_graph_cubit.dart';
import 'modules/modules/floor/floor_screen.dart';
import 'modules/modules/login/login_screen.dart';
import 'modules/modules/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => PatientCubit(),
      ),
      BlocProvider(
        create: (context) => DeathFileCubit(),
      ),
      BlocProvider(
        create: (context) => summaryChargeCubit(),
      ),
      BlocProvider(
        create: (context) => NotificationCubit(),
      ),
      BlocProvider(
        create: (context) => finalSectionCubit(),
      ),
      BlocProvider(
        create: (context) => firstpartCubit(),
      ),
      BlocProvider(
        create: (context) => threeSectionCubit(),
      ),
      BlocProvider(
        create: (context) => SecondpartCubit(),
      ),BlocProvider(
        create: (context) => ViewPatientCubit(),
      ),BlocProvider(
        create: (context) => CheckCubit(),
      ),BlocProvider(
        create: (context) => SurgeryCubit(),
      ),BlocProvider(
        create: (context) => GetallsurgerycubitCubit(),
      ),BlocProvider(
        create: (context) => FloorCubit(),
      ),BlocProvider(
        create: (context) => GetsurgerydetailsCubit(),
      ),BlocProvider(
        create: (context) => ScreeingTestCubit(),
      ),
      BlocProvider(
        create: (context) => getPAtientExamCubit(),
      ),
      BlocProvider(
        create: (context) => addradiographCubit(),
      ),BlocProvider(
        create: (context) => AppCubit(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.back,
            ),
            supportedLocales: const [
              Locale('ar', ''), // دعم اللغة العربية فقط
            ],
            locale: Locale('ar'),
            // Set default locale to Arabic
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            home: child,
          );
        },
        child: const SplashScreen(),
      ),
    );
  }
}
