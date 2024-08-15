import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';

class CustomTextAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomTextAppBar({
    super.key,
    required this.context,
    required this.title,
    this.actions,
    this.centerTitle = false,
  });
  final String title;
  final BuildContext context;
  final List<Widget>? actions;
  final bool centerTitle;
  @override
  State<CustomTextAppBar> createState() => _CustomTextAppBarState();

  @override
  Size get preferredSize =>
      PreferredAppBarSize(kToolbarHeight, MediaQuery.paddingOf(context).top);
}

class _CustomTextAppBarState extends State<CustomTextAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: Text(
        widget.title,
        style: AppStyle.BOLDmid(),
      ),
      leading: const BackButtonForAppBar(),
      centerTitle: widget.centerTitle,
      actions: widget.actions,
      //   arrow_back_ios_outlined
    );
  }
}

class BackButtonForAppBar extends StatelessWidget {
  const BackButtonForAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.flip(
      flipX: true,
      child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
            color: AppColors.white,
            size: 35,
          )
          // Assets.images.backButton.svg(),
          ),
    );
  }
}

class PreferredAppBarSize extends Size {
  PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight));

  final double? toolbarHeight;
  final double? bottomHeight;
}
