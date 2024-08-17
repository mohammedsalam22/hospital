import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/cubit/login/login_cubit.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import 'chose_type_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController spController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: CustomTextAppBar(
        context: context,
        title: 'تسجيل الدخول',
      ),
      // padding: EdgeInsets.symmetric(horizontal: 38.w),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 38.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        63.verticalSpace,
                        Text(
                          'تسجيل الدخول',
                          style: AppStyle.Bold(),
                        ),
                        30.verticalSpace,
                        DefaultFormField(
                          controller: passwordController,
                          hintText: "أدخل رمز PIN",
                        ),
                        // 30.verticalSpace,
                        // DefaultFormField(
                        //   controller: typeController,
                        //   hintText: "أدخل رمز type",
                        // ),
                        // 30.verticalSpace,
                        // DefaultFormField(
                        //   controller: spController,
                        //   hintText: "أدخل رمز اختصاصك",
                        // ),
                      ],
                    ),
                    DefaultButton(
                      text: "التالي",
                      onPressed: () {
                        navigateTo(
                          context,
                          ChoseTypeScreen(
                            password: passwordController.text,
                          ),
                        );
                      },
                    ),
                    200.verticalSpace,
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
