import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/modules/modules/clinical_form/general_information/details_attachments_complaint/details_companion_complaint_screen.dart';
import 'package:waseem/modules/modules/clinical_form/general_information/past_history_screen.dart';
import 'package:waseem/modules/modules/clinical_form/general_information/patient_history_screen.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

class GeneralInformationScreen extends StatelessWidget {
  const GeneralInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: "معلومات عامة",
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
                        text: "تاريخ المريض",
                        width: double.infinity,
                        onPressed: () {
                          navigateTo(context, const PatientHistoryScreen());
                        },
                      ),
                      49.verticalSpace,
                      DefaultButton(
                        text: "تفاصيل ومرافقات الشكاية",
                        width: double.infinity,
                        onPressed: () {
                          navigateTo(
                              context, const DetailsCompanionComplaintScreen());
                        },
                      ),
                      49.verticalSpace,
                      DefaultButton(
                        text: "السوابق المرضية",
                        width: double.infinity,
                        onPressed: () {
                          navigateTo(context, const PastHistoryScreen());
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
