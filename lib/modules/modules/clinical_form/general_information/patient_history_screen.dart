import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/Models/params/patient_history_params.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component2.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

class PatientHistoryScreen extends StatefulWidget {
  const PatientHistoryScreen({super.key});

  @override
  State<PatientHistoryScreen> createState() => _PatientHistoryScreenState();
}

class _PatientHistoryScreenState extends State<PatientHistoryScreen> {
  TextEditingController smokingController = TextEditingController();
  TextEditingController alcaholController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  bool isEdit = false;
  @override
  void initState() {
    var c = AppCubit.get(context).state.clinicalFormModel!.patientsHistorys;
    isEdit = c != null;
    print(c);
    if (isEdit) {
      smokingController.text = c!.smoking;
      alcaholController.text = c.alcahol;
      otherController.text = c.other;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: 'تاريخ المريض',
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: double.infinity,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 64, horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "التدخين",
                          style: AppStyle.Bold(),
                        ),
                        24.verticalSpace,
                        DefaultFormField2(
                          controller: smokingController,
                          maxLines: 3,
                        ),
                        32.verticalSpace,
                        Text(
                          "الكحول",
                          style: AppStyle.Bold(),
                        ),
                        24.verticalSpace,
                        DefaultFormField2(
                          controller: alcaholController,
                          maxLines: 3,
                        ),
                        32.verticalSpace,
                        Text(
                          "أخرى",
                          style: AppStyle.Bold(),
                        ),
                        24.verticalSpace,
                        DefaultFormField2(
                          controller: otherController,
                          maxLines: 3,
                        ),
                        32.verticalSpace,
                      ],
                    ),
                    BlocProvider(
                      create: (context) => ClinicalFormCubit(),
                      child: BlocConsumer<ClinicalFormCubit, ClinicalFormState>(
                        buildWhen: (p, c) =>
                            p.patientHistoryStatus != c.patientHistoryStatus,
                        listenWhen: (p, c) =>
                            p.patientHistoryStatus != c.patientHistoryStatus,
                        listener: (context, state) {
                          print(state.patientHistoryStatus);
                          if (state.patientHistoryStatus.isSuccess) {
                            // if (isEdit) {
                            final cunit = AppCubit.get(context).state;
                            AppCubit.get(context).getclinicalForm(
                                cunit.formId!, cunit.patientId!);
                            // }
                            Navigator.pop(context);
                          }
                        },
                        builder: (context, state) {
                          return DefaultButton2(
                            text: "حفظ",
                            isLoading: state.patientHistoryStatus.isLoading,
                            onPressed: () {
                              ClinicalFormCubit.get(context).addPatientHistory(
                                PatientHistoryParams(
                                  smoking: smokingController.text,
                                  alcahol: alcaholController.text,
                                  other: otherController.text,
                                ),
                                AppCubit.get(context).state.patientId!,
                                isEdit,
                              );
                            },
                          );
                        },
                      ),
                    )
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
