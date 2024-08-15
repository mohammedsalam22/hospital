import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/shared/shared%20style/colors.dart';

abstract class AppStyle {
  static TextStyle? BOLDmid() => TextStyle(
        color: AppColors.back,
        fontFamily: "AlmaraiBold",
        fontSize: 18.sp,
      );

  static TextStyle? Bold() => TextStyle(
        fontFamily: "AlmaraiBold",
        fontSize: 20.sp,
        color: AppColors.black,
      );

  static TextStyle? Regular({Color color = AppColors.white}) => TextStyle(
        fontSize: 20.sp,
        color: color,
        fontFamily: "AlmaraiRegular",
      );
  static TextStyle? NOTE() => TextStyle(
        fontSize: 14.sp,
        color: AppColors.note,
        fontFamily: "AlmaraiRegular",
      );
  static TextStyle? labs() => TextStyle(
        fontSize: 16.sp,
        fontFamily: "AlmaraiRegular",
        fontWeight: FontWeight.w300,
        color: AppColors.black,
      );
  static TextStyle? Small() => TextStyle(
        fontSize: 16.sp,
        fontFamily: "AlmaraiRegular",
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      );
}
