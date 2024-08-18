

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waseem/cubit/login/login_cubit.dart';
import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/sharedComponent/component.dart';

import '../../../shared/shared network/local/cache_helper.dart';
import '../../../shared/shared network/local/cache_key.dart';
import '../floor/choose_floor_screen.dart';
import 'determine_specialty_screen.dart';

class ChoseTypeScreen extends StatelessWidget {
  const ChoseTypeScreen({
    super.key,
    required this.password,
  });

  final String password;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                142.verticalSpace,
                Flexible(
                  child: SvgPicture.asset(
                    Assets.doctors,
                    width: 321.w,
                    height: 277.h,
                  ),
                ),
                100.verticalSpace,
                Flexible(
                  child: DefaultButton(
                    text: 'دكتور',
                    color: AppColors.back,
                    fontColor: AppColors.primary,
                    onPressed: () => navigateTo(
                      context,
                      DetermineSpecialtyScreen(password: password),
                    ),
                  ),
                ),
                26.verticalSpace,
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    if (state.status.isError) {
                      // TODO:
                      //   Show Tost
                    }
                    if (state.status.isSuccess) {
                      CacheHelper.saveData(
                          key: CacheKey.token, value: state.user!.token)
                          .then(
                            (value) {
                          navigateAndRemove(
                            context,
                            const ChooseFloorScreen(),
                          );
                        },
                      );
                      print("aaaaaaaaaaaaaaaaaaaaaaaaaaaa${CacheHelper.getData(key: CacheKey.token)}");

                    }
                  },
                  builder: (context, state) {
                    return Flexible(
                      child: DefaultButton(
                        isLoading: state.status.isLoading,
                        text: 'ممرض',
                        color: AppColors.back,
                        fontColor: AppColors.primary,
                        onPressed: () {
                          LoginCubit.get(context).login(
                            password: password,
                            type: "Nurse",
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

