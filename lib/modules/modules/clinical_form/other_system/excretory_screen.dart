import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/Models/params/other_system_params.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/modules/modules/clinical_form/other_system/heead_screen.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component2.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

class ExcretoryScreen extends StatefulWidget {
  const ExcretoryScreen({super.key});

  @override
  State<ExcretoryScreen> createState() => _ExcretoryScreenState();
}

class _ExcretoryScreenState extends State<ExcretoryScreen> {
  List<int> selected = List.generate(4, (index) => 0);
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
      selected[0] = c!.excretorie!.dysuria;
      selected[1] = c.excretorie!.urethralStricture;
      selected[2] = c.excretorie!.urinaryIncontinence;
      selected[3] = c.excretorie!.overactiveBladder;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(context: context, title: "بولي"),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 48.h),
          child: Column(
            children: [
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () => chang(0),
                  isChecked: selected[0] == 1,
                ),
                title: Text(
                  "حرقة بولية",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () => chang(1),
                  isChecked: selected[1] == 1,
                ),
                title: Text(
                  "عسر تبول",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () => chang(2),
                  isChecked: selected[2] == 1,
                ),
                title: Text(
                  "إلحاح بولي",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () => chang(3),
                  isChecked: selected[3] == 1,
                ),
                title: Text(
                  "بيلة ليلية",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
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
                    return DefaultButton2(
                      isLoading: state.otherSystemStatus.isLoading,
                      text: "حفظ",
                      onPressed: () {
                        var p = OtherSystemParams(
                          excretory: Excretory(
                            dysuria: selected[0],
                            urethralStricture: selected[1],
                            urinaryIncontinence: selected[2],
                            overactiveBladder: selected[3],
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
            ].addSpaces(height: 50).toList(),
          ),
        ),
      ),
    );
  }
}
