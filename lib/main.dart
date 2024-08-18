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

import 'cubit/ButtonNurse/Button_Cubit.dart';

import 'cubit/postAddresult/postaddresult_cubit.dart';
import 'modules/modules/Buttonnnnnnnnnn.dart';
import 'modules/modules/postAddresultScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => postAddresultCubit(),
        child: postAddresultScreen(),
      ),
    );
  }
}

*/



/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

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



import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:waseem/shared/shared%20network/local/cache_helper.dart';
import 'package:waseem/shared/shared%20network/local/cache_key.dart';
import 'package:waseem/shared/shared%20network/remote/dio_helper.dart';
import 'package:waseem/shared/shared%20style/app_routes.dart';

import 'package:waseem/shared/shared%20style/colors.dart';

import 'cubit/death/death_file_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/modules/getPatientRadio.dart';
import 'modules/modules/getpatientTestScreen.dart';
import 'modules/modules/splash/splash_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  // استخدام GoRouter المعد مسبقاً في RoutesName
  runApp(BlocProvider(
    create: (context) => DeathFileCubit(),
    child: MyApp(appRouter: appRouter), // استخدام appRouter الموجود في RoutesName
  ));
}

class MyApp extends StatelessWidget {
  final GoRouter appRouter;

  const MyApp({required this.appRouter, super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Tour Valve',
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.back,
          ),
          routerConfig: appRouter,
          supportedLocales: const [
            Locale('ar', ''), // دعم اللغة العربية فقط
          ],
          locale: const Locale('ar'), // تعيين اللغة الافتراضية للعربية
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
        );
      },
      child: const SplashScreen(),
    );
  }
}




