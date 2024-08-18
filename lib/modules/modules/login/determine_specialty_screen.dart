import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/cubit/login/login_cubit.dart';

import 'package:waseem/shared/shared%20network/local/cache_helper.dart';
import 'package:waseem/shared/shared%20network/local/cache_key.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_component/hide_above_line_border.dart';
import 'package:waseem/shared/sharedComponent/custom_component/hide_under_line_input_border.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../../Models/speciality_model.dart';
import '../floor/choose_floor_screen.dart';

class DetermineSpecialtyScreen extends StatefulWidget {
  const DetermineSpecialtyScreen({
    super.key,
    required this.password,
    //required  this.specialist2,
  });
  final String password;
  //final int specialist2;
  @override
  State<DetermineSpecialtyScreen> createState() =>
      _DetermineSpecialtyScreenState();
}

class _DetermineSpecialtyScreenState extends State<DetermineSpecialtyScreen> {
  final TextEditingController specialityController = TextEditingController();

  bool _isDropdownOpen = true;

  int i = 0 ;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit()..getSpeciality(),
      child: Scaffold(
        appBar: CustomTextAppBar(
          context: context,
          title: 'تحديد الاختصاص',
        ),
        backgroundColor: AppColors.back,
        body: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            if (state.statusGetSpeciality.isSuccess) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                        minWidth: double.infinity,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                63.verticalSpace,
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 7.w),
                                  child: Text(
                                    'اختصاص الدكتور',
                                    style: AppStyle.Bold(),
                                  ),
                                ),
                                33.verticalSpace,
                                ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownMenu<int>(
                                    controller: specialityController,
                                    dropdownMenuEntries: state.speciality
                                        .map<DropdownMenuEntry<int>>(
                                          (e) => DropdownMenuEntry(
                                        style: const ButtonStyle(
                                          backgroundColor: WidgetStatePropertyAll(
                                            AppColors.white,
                                          ),
                                        ),
                                        value: e.id,
                                        label: e.name,
                                        labelWidget: Text(
                                          e.name,
                                          style: AppStyle.labs(),
                                        ),
                                      ),
                                    )
                                        .toList(),
                                    onSelected: (index) {
                                      setState(() {
                                        i = index! ;
                                      });
                                    },
                                    enableSearch: false,
                                    hintText: "تحديد الاختصاص",
                                    textStyle: AppStyle.Small(),
                                    inputDecorationTheme: InputDecorationTheme(
                                      filled: true,
                                      fillColor: AppColors.white,
                                      enabledBorder: _isDropdownOpen
                                          ? OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                      )
                                          : HideUnderlineInputBorder(
                                        borderRadius: BorderRadius.circular(10.r),
                                      ),
                                    ),
                                    menuStyle: MenuStyle(
                                      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                                      elevation: const WidgetStatePropertyAll(0),
                                      fixedSize: WidgetStatePropertyAll(
                                        Size(100.w, 434.h),
                                      ),
                                      shape: const WidgetStatePropertyAll(
                                        HideAbovelineBorder(),
                                      ),
                                    ),
                                  ),
                                ) ,
                                // CustomDropdown(
                                //   speciality: state.speciality,
                                //   specialityController: specialityController,
                                // ),
                              ],
                            ),
                            BlocConsumer<LoginCubit, LoginState>(
                              listener: (context, state) {
                                if (state.status.isError) {
                                  // TODO:
                                  //   Show Tost
                                }
                                if (state.status.isSuccess) {
                                  CacheHelper.saveData(
                                          key: CacheKey.token,
                                          value: state.user!.token)
                                      .then(
                                    (value) {
                                      navigateAndRemove(
                                        context,
                                        const ChooseFloorScreen(),
                                      );
                                    },
                                  );
                                }
                              },
                              builder: (context, state) {
                                return DefaultButton(
                                  isLoading: state.status.isLoading,
                                  text: "التالي",
                                  onPressed: () {
                                    final s = state.speciality.firstWhere(
                                      (element) =>
                                          element.name ==
                                          specialityController.text,
                                    );
                                    LoginCubit.get(context).login(
                                      password: widget.password,
                                      type: "Doctor",
                                      specialist: i,
                                    );
                                  },
                                );
                              },
                            ),
                            67.verticalSpace,
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.speciality,
    required this.specialityController,
  });
  final List<SpecialityModel> speciality;
  final TextEditingController specialityController;
  @override
  CustomDropdownState createState() => CustomDropdownState();
}

class CustomDropdownState extends State<CustomDropdown> {
  bool _isDropdownOpen = true;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      alignedDropdown: true,
      child: DropdownMenu<int>(
        controller: widget.specialityController,
        dropdownMenuEntries: widget.speciality
            .map<DropdownMenuEntry<int>>(
              (e) => DropdownMenuEntry(
                style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.white,
                  ),
                ),
                value: e.id,
                label: e.name,
                labelWidget: Text(
                  e.name,
                  style: AppStyle.labs(),
                ),
              ),
            )
            .toList(),
        onSelected: (i) {
          print(i) ;
        },
        enableSearch: false,
        hintText: "تحديد الاختصاص",
        textStyle: AppStyle.Small(),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColors.white,
          enabledBorder: _isDropdownOpen
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                )
              : HideUnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
        ),
        menuStyle: MenuStyle(
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          elevation: const WidgetStatePropertyAll(0),
          fixedSize: WidgetStatePropertyAll(
            Size(100.w, 434.h),
          ),
          shape: const WidgetStatePropertyAll(
            HideAbovelineBorder(),
          ),
        ),
      ),
    );
  }
}
