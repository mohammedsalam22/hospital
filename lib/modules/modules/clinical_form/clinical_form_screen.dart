import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/modules/modules/clinical_form/clinical_examination/clinical_examination_screen.dart';
import 'package:waseem/modules/modules/clinical_form/general_information/general_information_screen.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/other_system_screen.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

class ClinicalFormScreen extends StatelessWidget {
  const ClinicalFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: "استمارة الفحص السريري",
      ),
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
                      DefaultButton(
                        text: "معلومات عامة",
                        width: double.infinity,
                        onPressed: () {
                          navigateTo(context, const GeneralInformationScreen());
                        },
                      ),
                      49.verticalSpace,
                      DefaultButton(
                        text: "بقية الأجهزة",
                        width: double.infinity,
                        onPressed: () {
                          navigateTo(context, const OtherSystemScreen());
                        },
                      ),
                      49.verticalSpace,
                      DefaultButton(
                        text: "الفحص السريري",
                        width: double.infinity,
                        onPressed: () {
                          navigateTo(
                              context, const ClinicalExaminationScreen());
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
      ),
    );
  }
}
