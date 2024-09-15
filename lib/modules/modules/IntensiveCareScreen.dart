import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:waseem/modules/modules/finalScreen.dart';
import 'package:waseem/modules/modules/secondeScreen.dart';
import 'package:waseem/modules/modules/threeSection.dart';
import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import 'drawer/drawer.dart';
import 'firstoneScreen.dart';

class IntensiveCareScreen extends StatefulWidget {
  const IntensiveCareScreen({
    super.key,
    required this.title,
    required this.isAvailable,
  });
  final String title;
  final bool isAvailable;

  @override
  State<IntensiveCareScreen> createState() => _IntensiveCareScreenState();
}

class _IntensiveCareScreenState extends State<IntensiveCareScreen> {
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
              width: double.infinity,
              constraints: constraints.copyWith(
                minHeight: constraints.maxHeight,
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
                        text: "عناية مشددة 1",
                        width: double.infinity,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => firstoneform1())) ;
                        },
                      ),
                      40.verticalSpace,
                      DefaultButton(
                        text: "عناية مشددة 2",
                        width: double.infinity,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => secondddddform())) ;
                        },
                      ),
                      40.verticalSpace,
                      DefaultButton(
                        text: "عناية مشددة 3",
                        width: double.infinity,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => threeform())) ;
                        },
                      ),
                      40.verticalSpace,
                      DefaultButton(
                        text: "عناية مشددة 4",
                        width: double.infinity,
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => firstoneform())) ;
                        },
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
