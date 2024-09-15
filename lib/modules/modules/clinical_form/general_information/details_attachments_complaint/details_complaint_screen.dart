import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:waseem/Models/params/details_complaint_params.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../../../../shared/sharedComponent/component2.dart';

class DetailsComplaintScreen extends StatefulWidget {
  const DetailsComplaintScreen({super.key});

  @override
  State<DetailsComplaintScreen> createState() => _DetailsComplaintScreenState();
}

class _DetailsComplaintScreenState extends State<DetailsComplaintScreen> {
  TextEditingController storyEditingController = TextEditingController();
  TextEditingController startTimeEditingController = TextEditingController();
  TextEditingController startSituationEditingController =
      TextEditingController();
  TextEditingController catalystEditingController = TextEditingController();
  TextEditingController remediesEditingController = TextEditingController();
  TextEditingController complentsFrequencyEditingController =
      TextEditingController();
  TextEditingController complentsImprovmentEditingController =
      TextEditingController();
  TextEditingController locationEditingController = TextEditingController();
  TextEditingController severityEditingController = TextEditingController();
  TextEditingController movementsEditingController = TextEditingController();
  TextEditingController qualityEditingController = TextEditingController();
  TextEditingController associationEditingController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    var c = AppCubit.get(context).state.clinicalFormModel!.complentDetail;
    isEdit = c != null;
    if (isEdit) {
      // DateTime parsedDate = DateTime.parse(c.startTime);
      //
      // String formattedDateString = DateFormat('yyyy-MM-dd','en').format(parsedDate);
      String formattedDateString = c!.startTime.split('T')[0];

      storyEditingController.text = c.story;
      startTimeEditingController.text = formattedDateString;
      startSituationEditingController.text = c.startSituation;
      catalystEditingController.text = c.catalyst;
      remediesEditingController.text = c.remedies;
      complentsFrequencyEditingController.text = c.complentsFrequency;
      complentsImprovmentEditingController.text = c.complentsImprovment;
      locationEditingController.text = c.lmsqa!.location;
      severityEditingController.text = c.lmsqa!.severity;
      movementsEditingController.text = c.lmsqa!.movements;
      qualityEditingController.text = c.lmsqa!.quality;
      associationEditingController.text = c.lmsqa!.association;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: "تفاصيل الشكاية",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
          child: Column(
            children: [
              const DefaultButton2(
                text: "تفاصيل الشكوى",
                width: 202,
                color: AppColors.c1,
                radius: 20,
              ),
              36.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'القصة المرضية',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: storyEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'زمن البدء',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    onTap: () =>
                        selectDate(context, startTimeEditingController),
                    maxLines: null,
                    controller: startTimeEditingController,
                  ),
                  12.verticalSpace,
                  Text(
                    'ظروف البدء',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: startSituationEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'المحرضات',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: catalystEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'المخففات',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: remediesEditingController,
                    maxLines: 2,
                  ),
                  //
                  12.verticalSpace,
                  Text(
                    'تواتر الشكاية',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: complentsFrequencyEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'تطور الشكاية',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: complentsImprovmentEditingController,
                    maxLines: 2,
                  ),
                ],
              ),
              40.verticalSpace,
              const DefaultButton2(
                text: "تفاصيل الألم",
                width: 202,
                color: AppColors.c1,
                radius: 20,
              ),
              40.verticalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'المكان',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: locationEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'الشدة',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: severityEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'الانتشارات',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: movementsEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'النوعية',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: qualityEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                  Text(
                    'المرافقات',
                    style: AppStyle.Bold(),
                  ),
                  18.verticalSpace,
                  DefaultFormField2(
                    controller: associationEditingController,
                    maxLines: 2,
                  ),
                  12.verticalSpace,
                ],
              ),
              BlocProvider(
                create: (context) => ClinicalFormCubit(),
                child: BlocConsumer<ClinicalFormCubit, ClinicalFormState>(
                  listener: (context, state) {
                    if (state.complentStatus.isLoading) {
                      // if (isEdit) {
                      final cunit = AppCubit.get(context).state;
                      AppCubit.get(context)
                          .getclinicalForm(cunit.formId!, cunit.patientId!);
                      // }
                      Navigator.pop(context);
                    }
                  },
                  builder: (context, state) {
                    return DefaultButton2(
                      isLoading: state.complentStatus.isLoading,
                      text: "حفظ",
                      onPressed: () {
                        ClinicalFormCubit.get(context).addcomplent(
                            DetailsComplaintParams(
                              story: storyEditingController.text,
                              startTime: startTimeEditingController.text,
                              startSituation:
                                  startSituationEditingController.text,
                              catalyst: catalystEditingController.text,
                              remedies: remediesEditingController.text,
                              complentsFrequency:
                                  complentsFrequencyEditingController.text,
                              complentsImprovment:
                                  complentsImprovmentEditingController.text,
                              location: locationEditingController.text,
                              severity: severityEditingController.text,
                              movements: movementsEditingController.text,
                              quality: qualityEditingController.text,
                              association: associationEditingController.text,
                            ),
                            AppCubit.get(context).state.patientId!,
                            isEdit);
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

Future<void> selectDate(
    BuildContext context, TextEditingController controller) async {
  DateTime? picked = await showDatePicker(
    context: context,
    firstDate: DateTime(1500),
    lastDate: DateTime(2050),
    initialDate: DateTime.now(),
    builder: (context, child) {
      return Localizations.override(
        context: context,
        // locale: AppLocale.englishLocale,
        child: Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              secondary: AppColors.primary,
            ),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child!,
          ),
        ),
      );
    },
  );
  if (picked != null) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd', "en");
    controller.text = formatter.format(picked);
  }
}
