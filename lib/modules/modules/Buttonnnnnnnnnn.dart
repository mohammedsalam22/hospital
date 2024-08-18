import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../cubit/ButtonNurse/Button_Cubit.dart';
import '../../cubit/ButtonNurse/Button_State.dart';
import '../../shared/sharedComponent/constant.dart';

class ChooseButtonScreen extends StatelessWidget {
  const ChooseButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: "اختيار",
      ),
      backgroundColor: AppColors.back,
      body: BlocProvider(
        create: (context) => ButtonCubit()..loadButtons(),
        child: BlocBuilder<ButtonCubit, ButtonState>(
          builder: (context, state) {
            if (state.status == RequestState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.status == RequestState.error) {
              return const Center(
                child: Text('حدث خطأ أثناء تحميل البيانات'),
              );
            } else if (state.status == RequestState.success) {
              if (state.buttons.isEmpty) {
                return const Center(
                  child: Text('لا توجد أزرار للعرض'),
                );
              }
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
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
                          ...state.buttons.map((button) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 46.h),
                              child: DefaultButton(
                                text: button.text,
                                width: double.infinity,
                                onPressed: () {
                                  // Define your onPressed action here
                                },
                              ),
                            );
                          }).toList(),
                          const Spacer(),
                        ],
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
