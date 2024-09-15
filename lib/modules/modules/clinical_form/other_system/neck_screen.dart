import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/Models/params/other_system_params.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/heead_screen.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/component2.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

class NeckScreen extends StatefulWidget {
  const NeckScreen({super.key});

  @override
  State<NeckScreen> createState() => _NeckScreenState();
}

class _NeckScreenState extends State<NeckScreen> {
  TextEditingController detailsController = TextEditingController();
  List<int> selected = List.generate(3, (index) => 0);
  void chang(int index) {
    selected[index] = selected[index] == 0 ? 1 : 0;
    setState(() {});
  }

  bool isEdit = false;
  @override
  void initState() {
    var c = AppCubit.get(context).state.clinicalFormModel!.otherSystem;
    isEdit = c != null;
    if (isEdit) {
      selected[0] = c!.neck!.difficultySwallowing;
      selected[1] = c.neck!.senseOfBulging;
      selected[2] = c.neck!.hoarseness;
      detailsController.text = c.neck!.details;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(context: context, title: "العنق"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 48.h),
          child: Column(
            children: [
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () {
                    chang(0);
                  },
                  isChecked: selected[0] == 1,
                ),
                title: Text(
                  "صعوبة البلع",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () {
                    chang(1);
                  },
                  isChecked: selected[1] == 1,
                ),
                title: Text(
                  "حس انتفاخ",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () {
                    chang(2);
                  },
                  isChecked: selected[2] == 1,
                ),
                title: Text(
                  "بحة في الصوت",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              DefaultFormField2(
                controller: detailsController,
                maxLines: 5,
                hintText: "التفاصيل",
                hintStyle: AppStyle.Small(),
              ),
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
                    return DefaultButton(
                      isLoading: state.otherSystemStatus.isLoading,
                      text: "حفظ",
                      onPressed: () {
                        ClinicalFormCubit.get(context).addOtherSystem(
                          OtherSystemParams(
                            neck: Neck(
                              difficultySwallowing: selected[0],
                              senseOfBulging: selected[1],
                              hoarseness: selected[2],
                              details: detailsController.text,
                            ),
                          ),
                          AppCubit.get(context).state.patientId!,
                          isEdit,
                        );
                      },
                    );
                  },
                ),
              ),
            ].addSpaces(height: 50).toList(),
          ),
        ),
      ),
    );
  }
}
