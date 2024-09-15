import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';

void navigateTo2(context, widget) => Navigator.push(
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

class DefaultFormField2 extends StatelessWidget {
  const DefaultFormField2({
    super.key,
    required this.controller,
    this.hintText,
    this.maxLines = 2,
    this.textAlign = TextAlign.start,
    this.radius = 20,
    this.onTap,
    this.hintStyle,
    this.prefix,
  });
  final TextEditingController controller;
  final String? hintText;
  final int? maxLines;
  final TextAlign textAlign;
  final double radius;
  final void Function()? onTap;
  final TextStyle? hintStyle;
  final Widget? prefix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      readOnly: onTap != null,
      controller: controller,
      // textAlign: textAlign,
      style: AppStyle.Regular(color: AppColors.black),
      maxLines: maxLines,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius.r),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        prefixIcon: prefix == null
            ? null
            : Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          child: prefix,
        ),
        hintStyle: hintStyle ?? AppStyle.NOTE(),
      ),
    );
  }
}

class DefaultButton2 extends StatelessWidget {
  const DefaultButton2({
    super.key,
    this.color = AppColors.primary,
    this.fontColor = AppColors.back,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.width = 160,
    this.radius = 10,
  });
  final Color color;
  final String text;
  final Color fontColor;
  final void Function()? onPressed;
  final bool isLoading;
  final double width;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius.r),
      ),
      disabledColor: color,
      onPressed: onPressed,
      minWidth: width.w,
      height: 40.h,
      child: isLoading
          ? SizedBox(
        width: width.w,
        child: Center(
          child: CircularProgressIndicator(
            color: fontColor,
          ),
        ),
      )
          : Text(
        text,
        style: AppStyle.Regular(color: fontColor),
      ),
    );
  }
}

extension IterableExtensions on Iterable<Widget> {
  Iterable<Widget> expanded(List<int> element) sync* {
    assert(element.length == length, 'flexible list must be good dummy');
    final iterator = this.iterator;
    int elementCount = 0;
    while (iterator.moveNext()) {
      yield Expanded(flex: element[elementCount], child: iterator.current);
      elementCount++;
    }
  }

  Iterable<Widget> addSpaces({double? height, double? width}) sync* {
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      yield iterator.current;
      while (iterator.moveNext()) {
        yield RSizedBox(
          height: height,
          width: width,
        );
        yield iterator.current;
      }
    }
  }
}
