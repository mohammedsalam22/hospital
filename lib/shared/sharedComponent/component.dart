import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );
void navigateAndRemove(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => true,
    );

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      style: AppStyle.Regular(color: AppColors.black),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: AppStyle.NOTE(),
      ),
    );
  }
}

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    this.color = AppColors.primary,
    this.fontColor = AppColors.back,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width = 160,
  });
  final Color color;
  final String text;
  final Color fontColor;
  final void Function()? onPressed;
  final bool isLoading;
  final double width;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      disabledColor: color,
      onPressed: onPressed,
      minWidth: width.w,
      height: 40.h,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: fontColor,
              ),
            )
          : Text(
              text,
              style: AppStyle.Regular(color: fontColor),
            ),
    );
  }
}
