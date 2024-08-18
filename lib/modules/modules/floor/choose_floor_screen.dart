
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/cubit/floor/floor_cubit.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import 'floor_screen.dart';

class ChooseFloorScreen extends StatelessWidget {
  const ChooseFloorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: "اختيار الطابق",
      ),
      backgroundColor: AppColors.back,
      body: BlocProvider(
        create: (context) => FloorCubit()..getFloors(),
        child: BlocBuilder<FloorCubit, FloorState>(
          builder: (context, state) {
            if (state.status.isSuccess) {
              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: Container(
                      // width: double.infinity,
                      // height: constraints.maxHeight,
                      width: double.infinity,
                      constraints: constraints.copyWith(
                        minHeight: constraints.maxHeight,
                        // -(widget.padding.top + widget.padding.bottom),
                        maxHeight: double.infinity,
                      ),
                      child: IntrinsicHeight(
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
                              DefaultButton(
                                text: "الطابق الثاني",
                                width: double.infinity,
                                onPressed: () {
                                  navigateTo(
                                    context,
                                    FloorScreen(
                                      title: "الطابق الثاني",
                                      rooms: state.floors
                                          .firstWhere(
                                            (element) => element.floorID == 2,
                                          )
                                          .rooms,
                                    ),
                                  );
                                },
                              ),
                              46.verticalSpace,
                              DefaultButton(
                                text: "الطابق الثالث",
                                width: double.infinity,
                                onPressed: () => navigateTo(
                                  context,
                                  FloorScreen(
                                    title: "الطابق الثالث",
                                    rooms: state.floors
                                        .firstWhere(
                                          (element) => element.floorID == 3,
                                        )
                                        .rooms,
                                  ),
                                ),
                              ),
                              46.verticalSpace,
                              DefaultButton(
                                text: "الطابق الرابع",
                                width: double.infinity,
                                onPressed: () => navigateTo(
                                  context,
                                  FloorScreen(
                                    title: "الطابق الرابع",
                                    rooms: state.floors
                                        .firstWhere(
                                          (element) => element.floorID == 4,
                                        )
                                        .rooms,
                                  ),
                                ),
                              ),
                              46.verticalSpace,
                              DefaultButton(
                                text: "الطابق الخامس",
                                width: double.infinity,
                                onPressed: () => navigateTo(
                                  context,
                                  FloorScreen(
                                    title: "الطابق الخامس",
                                    rooms: state.floors
                                        .firstWhere(
                                          (element) => element.floorID == 5,
                                        )
                                        .rooms,
                                  ),
                                ),
                              ),
                              46.verticalSpace,
                              DefaultButton(
                                text: "الطابق السادس",
                                width: double.infinity,
                                onPressed: () => navigateTo(
                                  context,
                                  FloorScreen(
                                    title: "الطابق السادس",
                                    rooms: state.floors
                                        .firstWhere(
                                          (element) => element.floorID == 6,
                                        )
                                        .rooms,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
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

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/cubit/floor/floor_cubit.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import 'floor_screen.dart';

class ChooseFloorScreen extends StatelessWidget {
  const ChooseFloorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTextAppBar(
        context: context,
        title: "اختيار الطابق",
      ),
      backgroundColor: AppColors.back,
      body: BlocProvider(
        create: (context) => FloorCubit()..getFloors(),
        child: BlocBuilder<FloorCubit, FloorState>(
          builder: (context, state) {
            if (state.status.isSuccess) {
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
                          ...state.floors.map((floor) {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 46.h),
                              child: DefaultButton(
                                text: "الطابق ${floor.floorID}",
                                onPressed: () => navigateTo(
                                  context,
                                  FloorScreen(
                                    title: "الطابق ${floor.floorID}",
                                    rooms: floor.rooms,
                                  ),
                                ),
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
*/
