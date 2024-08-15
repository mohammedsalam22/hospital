import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:waseem/shared/shared%20network/local/cache_helper.dart';
import 'package:waseem/shared/shared%20network/local/cache_key.dart';
import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/sharedComponent/component.dart';

import '../floor/choose_floor_screen.dart';
import '../login/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 3000))
          .then((_) => navigator());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: SvgPicture.asset(Assets.logo),
      ),
    );
  }

  navigator() {
    final token = CacheHelper.getData(key: CacheKey.token);

    if (token == null) {
      navigateAndRemove(context, const LoginScreen());
    } else {
      navigateAndRemove(context, const ChooseFloorScreen());
    }
  }
}
