import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/abdomenarea_screen.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/excretory_screen.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/heead_screen.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/neck_screen.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/other_screen.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../../../shared/sharedComponent/component2.dart';

class OtherSystemScreen extends StatelessWidget {
  const OtherSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color color =
        AppCubit.get(context).state.clinicalFormModel!.otherSystem == null
            ? AppColors.c1
            : AppColors.primary;
    return Scaffold(
      appBar: CustomTextAppBar(context: context, title: " بقية الأجهزة"),
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                      DefaultButton2(
                        text: "الرأس",
                        color: color,
                        fontColor: AppColors.black,
                        width: 120,
                        radius: 20,
                        onPressed: () {
                          navigateTo(context, const HeeadScreen());
                        },
                      ),
                      29.verticalSpace,
                      DefaultButton2(
                        radius: 20,
                        text: "العنق",
                        width: 120,
                        color: color,
                        fontColor: AppColors.black,
                        onPressed: () {
                          navigateTo(context, const NeckScreen());
                        },
                      ),
                      29.verticalSpace,
                      DefaultButton2(
                        radius: 20,
                        color: color,
                        fontColor: AppColors.black,
                        text: "الصدر",
                        width: 120,
                        onPressed: () {
                          // navigateTo(context, const PatientHistoryScreen());
                        },
                      ),
                      29.verticalSpace,
                      DefaultButton2(
                        radius: 20,
                        color: color,
                        fontColor: AppColors.black,
                        text: "البطن",
                        width: 120,
                        onPressed: () {
                          navigateTo(context, const AbdomenareaScreen());
                        },
                      ),
                      29.verticalSpace,
                      DefaultButton2(
                        radius: 20,
                        color: color,
                        fontColor: AppColors.black,
                        text: "بولي",
                        width: 120,
                        onPressed: () {
                          navigateTo(context, const ExcretoryScreen());
                        },
                      ),
                      29.verticalSpace,
                      DefaultButton2(
                        radius: 20,
                        color: color,
                        fontColor: AppColors.black,
                        text: "أخرى",
                        width: 120,
                        onPressed: () {
                          navigateTo(context, const OtherScreen());
                        },
                      ),
                      29.verticalSpace,
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
