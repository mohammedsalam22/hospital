import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/Models/params/other_system_params.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/heead_screen.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../../../shared/sharedComponent/component2.dart';

class AbdomenareaScreen extends StatefulWidget {
  const AbdomenareaScreen({super.key});

  @override
  State<AbdomenareaScreen> createState() => _AbdomenareaScreenState();
}

class _AbdomenareaScreenState extends State<AbdomenareaScreen> {
  TextEditingController nausea_quantityController = TextEditingController();
  TextEditingController nausea_frequencyController = TextEditingController();
  TextEditingController nausea_comfortableController = TextEditingController();
  TextEditingController nausea_qualitiesController = TextEditingController();
  TextEditingController nausea_lmsqaController = TextEditingController();
  //
  TextEditingController diarrheal_quantityController = TextEditingController();
  TextEditingController diarrheal_frequencyController = TextEditingController();
  TextEditingController diarrheal_smellController = TextEditingController();
  TextEditingController diarrheal_qualitiesController = TextEditingController();
  TextEditingController diarrheal_lmsqaController = TextEditingController();
//
  TextEditingController constipation_frequencyController =
      TextEditingController();
  TextEditingController constipation_colorController = TextEditingController();
  TextEditingController constipation_painController = TextEditingController();
  TextEditingController constipation_mandatoryController =
      TextEditingController();
  TextEditingController constipation_zahirController = TextEditingController();
  TextEditingController constipation_lmsqaController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    var c = AppCubit.get(context).state.clinicalFormModel!.otherSystem;
    isEdit = c != null;
    if (isEdit) {
      nausea_quantityController.text = c!.abdomenArea!.nausea!.quantity;
      nausea_frequencyController.text = c.abdomenArea!.nausea!.frequency;
      nausea_comfortableController.text = c.abdomenArea!.nausea!.comfortable;
      nausea_qualitiesController.text = c.abdomenArea!.nausea!.qualities;
      nausea_lmsqaController.text = c.abdomenArea!.nausea!.lmsqa;

      diarrheal_quantityController.text = c.abdomenArea!.diarrheal!.quantity;
      diarrheal_frequencyController.text = c.abdomenArea!.diarrheal!.frequency;
      diarrheal_smellController.text = c.abdomenArea!.diarrheal!.smell;
      diarrheal_qualitiesController.text = c.abdomenArea!.diarrheal!.qualities;
      diarrheal_lmsqaController.text = c.abdomenArea!.diarrheal!.lmsqa;

      constipation_frequencyController.text =
          c.abdomenArea!.constipation!.frequency;
      constipation_colorController.text = c.abdomenArea!.constipation!.color;
      constipation_painController.text = c.abdomenArea!.constipation!.pain;
      constipation_mandatoryController.text =
          c.abdomenArea!.constipation!.mandatory;
      constipation_zahirController.text = c.abdomenArea!.constipation!.zahir;
      constipation_lmsqaController.text = c.abdomenArea!.constipation!.lmsqa;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(context: context, title: "البطن"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: Column(
            children: [
              ListTile(
                leading: const CustomCheckbox(
                  isChecked: true,
                ),
                title: Text(
                  "الغثيان والإقياء:",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    DefaultFormField2(
                      maxLines: null,
                      controller: nausea_quantityController,
                      prefix: Text(
                        "كميته",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: nausea_frequencyController,
                      prefix: Text(
                        "مريح؟",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: nausea_comfortableController,
                      prefix: Text(
                        "تواتره",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: nausea_qualitiesController,
                      prefix: Text(
                        "صفاته",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: nausea_lmsqaController,
                      prefix: Text(
                        "LMSQA",
                        style: AppStyle.Small(),
                      ),
                    ),
                  ].addSpaces(height: 16).toList(),
                ),
              ),

              //
              ListTile(
                leading: const CustomCheckbox(
                  isChecked: true,
                ),
                title: Text(
                  "الإسهال:",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    DefaultFormField2(
                      maxLines: null,
                      controller: diarrheal_quantityController,
                      prefix: Text(
                        "كميته",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: diarrheal_frequencyController,
                      prefix: Text(
                        "تواتره",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: diarrheal_smellController,
                      prefix: Text(
                        "رائحته",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: diarrheal_qualitiesController,
                      prefix: Text(
                        "صفاته",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: diarrheal_lmsqaController,
                      prefix: Text(
                        "LMSQA",
                        style: AppStyle.Small(),
                      ),
                    ),
                  ].addSpaces(height: 16).toList(),
                ),
              ),
              //
              ListTile(
                leading: const CustomCheckbox(
                  isChecked: true,
                ),
                title: Text(
                  "الإمساك",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  children: [
                    DefaultFormField2(
                      maxLines: null,
                      controller: constipation_frequencyController,
                      prefix: Text(
                        "التواتر",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: constipation_colorController,
                      prefix: Text(
                        "اللون",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: constipation_painController,
                      prefix: Text(
                        "الألم",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: constipation_mandatoryController,
                      prefix: Text(
                        "مدمى",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: constipation_zahirController,
                      prefix: Text(
                        "زحير",
                        style: AppStyle.Small(),
                      ),
                    ),
                    DefaultFormField2(
                      maxLines: null,
                      controller: constipation_lmsqaController,
                      prefix: Text(
                        "LMSQA",
                        style: AppStyle.Small(),
                      ),
                    ),
                  ].addSpaces(height: 16).toList(),
                ),
              ),
              50.verticalSpace,
              BlocProvider(
                create: (context) => ClinicalFormCubit(),
                child: BlocConsumer<ClinicalFormCubit, ClinicalFormState>(
                  listener: (context, state) {
                    if (state.otherSystemStatus.isSuccess) {
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
                      isLoading: state.otherSystemStatus.isLoading,
                      text: "حفظ",
                      onPressed: () {
                        var p = OtherSystemParams(
                          abdomenArea: AbdomenArea(
                            nausea: Nausea(
                              quantity: nausea_quantityController.text,
                              frequency: nausea_frequencyController.text,
                              comfortable: nausea_comfortableController.text,
                              qualities: nausea_qualitiesController.text,
                              lmsqa: nausea_lmsqaController.text,
                            ),
                            diarrheal: Diarrheal(
                              quantity: diarrheal_quantityController.text,
                              frequency: diarrheal_frequencyController.text,
                              smell: diarrheal_smellController.text,
                              qualities: diarrheal_qualitiesController.text,
                              lmsqa: diarrheal_lmsqaController.text,
                            ),
                            constipation: Constipation(
                              frequency: constipation_frequencyController.text,
                              color: constipation_colorController.text,
                              pain: constipation_painController.text,
                              mandatory: constipation_mandatoryController.text,
                              zahir: constipation_zahirController.text,
                              lmsqa: constipation_lmsqaController.text,
                            ),
                          ),
                        );
                        ClinicalFormCubit.get(context).addOtherSystem(
                          p,
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
