import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waseem/Models/params/other_system_params.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/component2.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

class HeeadScreen extends StatefulWidget {
  const HeeadScreen({super.key});

  @override
  State<HeeadScreen> createState() => _HeeadScreenState();
}

class _HeeadScreenState extends State<HeeadScreen> {
  TextEditingController detailsController = TextEditingController();
  TextEditingController otherController = TextEditingController();
  List<int> selected = List.generate(5, (index) => 0);
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
      selected[0] = c!.head!.headache;
      selected[1] = c.head!.vision;
      selected[2] = c.head!.earBuzz;
      selected[3] = c.head!.rotor;
      selected[4] = c.head!.plaid;
      detailsController.text = c.head!.details;
      otherController.text = c.head!.other.toString();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(context: context, title: "الرأس"),
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
                  "الصداع",
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
                  "تشويش الرؤية",
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
                  "طنين الأذنين",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () {
                    chang(3);
                  },
                  isChecked: selected[3] == 1,
                ),
                title: Text(
                  "الدوار",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              ListTile(
                leading: CustomCheckbox(
                  onChanged: () {
                    chang(4);
                  },
                  isChecked: selected[4] == 1,
                ),
                title: Text(
                  "ألم بلعوم",
                  style: AppStyle.BOLDmid(color: AppColors.black),
                ),
              ),
              DefaultFormField2(
                controller: detailsController,
                maxLines: 5,
                hintText: "التفاصيل",
                hintStyle: AppStyle.Small(),
              ),
              DefaultFormField2(
                controller: otherController,
                maxLines: 5,
                hintText: "أخرى",
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
                        var p = OtherSystemParams(
                          heead: Heead(
                            headache: selected[0],
                            vision: selected[1],
                            earBuzz: selected[2],
                            rotor: selected[3],
                            plaid: selected[4],
                            details: detailsController.text,
                            other: otherController.text,
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

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.isChecked,
    this.onChanged,
  });

  final bool isChecked;
  final void Function()? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: isChecked
          ? SvgPicture.asset(
              Assets.checkboxTrue,
              width: 37.w,
              height: 37.h,
            )
          : SvgPicture.asset(
              Assets.checkboxFasle,
              width: 37.w,
              height: 37.h,
            ),
    );
  }
}
