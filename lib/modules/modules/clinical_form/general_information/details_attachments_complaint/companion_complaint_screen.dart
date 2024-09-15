import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/Models/params/companions_complents_params.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../../../../shared/sharedComponent/component2.dart';

class CompanionComplaintScreen extends StatefulWidget {
  const CompanionComplaintScreen({super.key});

  @override
  State<CompanionComplaintScreen> createState() =>
      _CompanionComplaintScreenState();
}

class _CompanionComplaintScreenState extends State<CompanionComplaintScreen> {
  TextEditingController timeSituationController = TextEditingController();
  TextEditingController catalystRemediesController = TextEditingController();
  TextEditingController frequencyImprovmentController = TextEditingController();
  TextEditingController otherController = TextEditingController();

  bool isEdit = false;
  @override
  void initState() {
    super.initState();

    var c = AppCubit.get(context).state.clinicalFormModel!.complentDetail;
    if (c != null) {
      isEdit = c.companionComplent != null;
    }

    if (isEdit) {
      // DateTime parsedDate = DateTime.parse(c.startTime);
      //
      // String formattedDateString = DateFormat('yyyy-MM-dd','en').format(parsedDate);
      String formattedDateString = c!.startTime.split('T')[0];

      timeSituationController.text = c.companionComplent![0].timeSituation;
      catalystRemediesController.text =
          c.companionComplent![0].catalystRemedies;
      frequencyImprovmentController.text =
          c.companionComplent![0].frequencyImprovment;
      otherController.text = c.companionComplent![0].other;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: "مرافقات الشكاية",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'زمن وظروف البدء',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: timeSituationController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'المحرضات والمخففات ',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: catalystRemediesController,
                  ),
                  12.verticalSpace,
                  Text(
                    'التواتر والتطور',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: frequencyImprovmentController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'أخرى',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: otherController,
                    maxLines: 2,
                  ),
                ],
              ),
              40.verticalSpace,
              BlocProvider(
                create: (context) => ClinicalFormCubit(),
                child: BlocConsumer<ClinicalFormCubit, ClinicalFormState>(
                  listener: (context, state) {
                    if (state.companionsComplentsStatus.isLoading) {
                      // if (isEdit) {
                      final cunit = AppCubit.get(context).state;
                      AppCubit.get(context)
                          .getclinicalForm(cunit.formId!, cunit.patientId!);
                      // }
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return DefaultButton(
                      isLoading: state.companionsComplentsStatus.isLoading,
                      text: "حفظ",
                      onPressed: () {
                        ClinicalFormCubit.get(context).companionsComplents(
                          CompanionsComplentsParams(
                            timeSituation: timeSituationController.text,
                            catalystRemedies: catalystRemediesController.text,
                            frequencyImprovment:
                                frequencyImprovmentController.text,
                            other: otherController.text,
                          ),
                          AppCubit.get(context).state.patientId!,
                          isEdit,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
