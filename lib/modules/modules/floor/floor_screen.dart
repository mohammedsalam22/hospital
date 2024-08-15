import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waseem/modules/modules/floor/room_screen.dart';

import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../../Models/room_model.dart';
import '../drawer/drawer.dart';

class FloorScreen extends StatefulWidget {
  const FloorScreen({
    super.key,
    required this.title,
    required this.rooms,
  });
  final String title;
  final List<Room> rooms;

  @override
  State<FloorScreen> createState() => _FloorScreenState();
}

class _FloorScreenState extends State<FloorScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      endDrawer: DefaultDrawer(
        context: context,
      ),
      endDrawerEnableOpenDragGesture: true,
      appBar: CustomTextAppBar(
        context: context,
        title: widget.title,
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 64.h),
        child: GridView.builder(
          itemCount: widget.rooms.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 21.w,
            mainAxisSpacing: 65.h,
          ),
          itemBuilder: (context, index) {
            final room = widget.rooms[index];
            return Card(
              color:
                  !room.isAvailable ? AppColors.online_2 : AppColors.offline_2,
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () => navigateTo(
                  context,
                  RoomScreen(
                    title: room.roomNumber.toString(),
                    isAvailable: !room.isAvailable,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    5.verticalSpace,
                    SvgPicture.asset(
                      Assets.room,
                      color: !room.isAvailable
                          ? AppColors.online_1
                          : AppColors.offline_1,
                    ),
                    5.verticalSpace,
                    Text(
                      widget.rooms[index].roomNumber.toString(),
                      style: TextStyle(
                        color: !room.isAvailable
                            ? AppColors.online_1
                            : AppColors.offline_1,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
