import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/cubit/app/app_cubit.dart';
import 'package:waseem/cubit/clinical_form/clinical_form_cubit.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

class PastHistoryScreen extends StatelessWidget {
  const PastHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(context: context, title: "السوابق المرضية"),
      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 36.h),
      //     child: Column(
      //       children: [
      //         const DefaultButton(
      //           text: "الأمراض الداخلية",
      //           width: 202,
      //           color: AppColors.c1,
      //           radius: 20,
      //         ),
      //         36.verticalSpace,
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //
      //             Text(
      //               'أخرى',
      //               style: AppStyle.Bold(),
      //             ),
      //             18.verticalSpace,
      //             DefaultFormField(
      //               controller: remediesEditingController,
      //               maxLines: 2,
      //             ),
      //             //
      //             12.verticalSpace,
      //             Text(
      //               'زمن البدء',
      //               style: AppStyle.Bold(),
      //             ),
      //             18.verticalSpace,
      //             DefaultFormField(
      //               // TODO:TIME
      //               controller: complentsFrequencyEditingController,
      //             ),
      //             12.verticalSpace,
      //             Text(
      //               'حساسية من الادوية',
      //               style: AppStyle.Bold(),
      //             ),
      //             18.verticalSpace,
      //             DefaultFormField(
      //               controller: complentsImprovmentEditingController,
      //               maxLines: 2,
      //             ),
      //           ],
      //         ),
      //         40.verticalSpace,
      //         const DefaultButton(
      //           text: "السوابق الجراحية",
      //           width: 202,
      //           color: AppColors.c1,
      //           radius: 20,
      //         ),
      //         40.verticalSpace,
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Text(
      //               'الجراحة',
      //               style: AppStyle.Bold(),
      //             ),
      //             18.verticalSpace,
      //             DefaultFormField(
      //               controller: locationEditingController,
      //               maxLines: 2,
      //             ),
      //             12.verticalSpace,
      //             Text(
      //               'التاريخ',
      //               style: AppStyle.Bold(),
      //             ),
      //             18.verticalSpace,
      //             DefaultFormField(
      //               controller: severityEditingController,
      //               maxLines: 2,
      //             ),
      //             12.verticalSpace,
      //             Text(
      //               'الاختلاطات',
      //               style: AppStyle.Bold(),
      //             ),
      //             18.verticalSpace,
      //             DefaultFormField(
      //               controller: movementsEditingController,
      //               maxLines: 2,
      //             ),
      //
      //           ],
      //         ),
      //         BlocProvider(
      //           create: (context) => ClinicalFormCubit(),
      //           child: BlocConsumer<ClinicalFormCubit, ClinicalFormState>(
      //             listener: (context, state) {
      //               if (state..isLoading) {
      //                 Navigator.pop(context);
      //               }
      //             },
      //             builder: (context, state) {
      //               return DefaultButton(
      //                 isLoading: state..isLoading,
      //                 text: "حفظ",
      //                 onPressed: () {
      //                   ClinicalFormCubit.get(context).(
      //                     ,
      //                     AppCubit.get(context).state.patientId!,
      //                   );
      //                 },
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
