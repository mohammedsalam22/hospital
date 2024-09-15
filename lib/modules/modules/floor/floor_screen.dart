import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waseem/cubit/check_cubit/check_cubit.dart';
import 'package:waseem/cubit/floor/floor_cubit.dart';
import 'package:waseem/cubit/floor/floor_cubit.dart';
import 'package:waseem/cubit/patient_room/patient_cubit.dart';
import 'package:waseem/modules/modules/floor/room_screen.dart';
import 'package:waseem/modules/modules/patient_grid_view.dart';

import 'package:waseem/shared/shared%20style/assets.dart';
import 'package:waseem/shared/shared%20style/colors.dart';
import 'package:waseem/shared/shared%20style/styles.dart';
import 'package:waseem/shared/sharedComponent/component.dart';
import 'package:waseem/shared/sharedComponent/constant.dart';
import 'package:waseem/shared/sharedComponent/custom_text_app_bar.dart';

import '../../../Models/room_model.dart';
import '../drawer/drawer.dart';

class FloorScreen extends StatefulWidget {
  const FloorScreen({
    super.key,
    required this.title,
    required this.rooms,
    required this.id,
  });

  final String title;
  final int id;

  final List<Room> rooms;

  @override
  State<FloorScreen> createState() => _FloorScreenState();
}

class _FloorScreenState extends State<FloorScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<FloorCubit>(context).getRoom(widget.id);
    });
    super.initState();
  }

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
      body: BlocBuilder<FloorCubit, FloorState>(
        builder: (context, state) {
          if (state.status == RequestState.loading) {
            return const CircularProgressIndicator(color: AppColors.primary,) ;
          }
          if (BlocProvider.of<FloorCubit>(context).room == null) {
            return const CircularProgressIndicator(color: AppColors.primary,) ;
          }
          List r = BlocProvider.of<FloorCubit>(context).room ;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 64.h),
            child: GridView.builder(
              itemCount: r.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 21.w,
                mainAxisSpacing: 65.h,
              ),
              itemBuilder: (context, index) {
                final room = r[index];
                return Card(
                  color:
                  room['status'] == 'available' ? AppColors.online_2 : AppColors.offline_2,
                  clipBehavior: Clip.hardEdge,
                  child: BlocListener<CheckCubit, CheckState>(
                    listener: (context, state) {
                      if (state.checkStatus == CheckStatus.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('done')));
                      }
                    },
                    child: InkWell(
                      onTap: () async {
                        if (widget.id == 7) {
                          if (room['status'] == 'available') {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    PatientGridView(roomID: room['id'])));
                          } else {
                            await BlocProvider.of<CheckCubit>(context)
                                .checkOut(room['id']);
                          }
                        } else {
                          navigateTo(
                            context,
                            RoomScreen(
                              title: room['roomNumber'].toString(),
                              isAvailable: !(room['status'] == 'available'),
                              roomId: room['id'] ,
                            ),
                          );
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          5.verticalSpace,
                          SvgPicture.asset(
                            Assets.room,
                            color: room['status'] == 'available'
                                ? AppColors.online_1
                                : AppColors.offline_1,
                          ),
                          // 5.verticalSpace,
                          Text(
                            r[index]['roomNumber'].toString(),
                            style: TextStyle(
                              color: room['status'] == 'available'
                                  ? AppColors.online_1
                                  : AppColors.offline_1,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
