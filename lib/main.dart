

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/notify_sevices.dart';

import 'package:waseem/shared/shared%20network/local/cache_helper.dart';
import 'package:waseem/shared/shared%20network/local/cache_key.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';
import 'package:waseem/shared/shared%20network/remote/dio_helper.dart';

import 'package:waseem/shared/shared%20style/colors.dart';

import 'component/id.dart';
import 'cubit/death/death_file_cubit.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'modules/modules/floor/floor_screen.dart';
import 'modules/modules/login/login_screen.dart';
import 'modules/modules/splash/splash_screen.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

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
}


