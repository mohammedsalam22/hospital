import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../drawer/drawer.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({
    super.key,
    required this.title,
    required this.isAvailable,
  });
  final String title;
  final bool isAvailable;

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.back,
      endDrawer: DefaultDrawer(
        context: context,
      ),
      endDrawerEnableOpenDragGesture: true,
      appBar: CustomTextAppBar(
        context: context,
        title: widget.title,
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () => scaffoldKey.currentState!.openEndDrawer(),
            child: SvgPicture.asset(
              Assets.menu,
            ),
          ),
          20.horizontalSpace,
        ],
      ),
      body: widget.isAvailable
          ? LayoutBuilder(
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
                              text: "المعلومات الشخصية",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "استمارة الفحص السريري",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "استمارة العناية المركزة",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "التحاليل الدورية",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "التحاليل المخبرية",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            //
                            40.verticalSpace,
                            DefaultButton(
                              text: "الصور الشعاعية",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "طلب استشارة",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "طلب تحاليل مخبرية",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "طلب صورة شعاعية",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "استمارة الخروج",
                              width: double.infinity,
                              onPressed: () {},
                            ),
                            40.verticalSpace,
                            DefaultButton(
                              text: "استمارة الوفاة",
                              width: double.infinity,
                              onPressed: () {},
                            ),

                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            )
          : Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.search,
                  ),
                  Text(
                    "الغرفة فارغة ",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w800,
                      fontFamily: "AlmaraiRegular",
                      color: AppColors.black,
                      // fontFamily: "AlmaraiBold",
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
