import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/notification_cubit/notification_cubit.dart';
import 'package:waseem/cubit/notification_cubit/notification_cubit.dart';
import 'package:waseem/shared/shared%20style/colors.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<NotificationCubit>(context).getPatientByRoom();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('الاشعارات', style: TextStyle(color: AppColors.white),),
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state.notificationStatus == NotificationStatus.loading) {
            return CircularProgressIndicator(color: AppColors.primary,) ;
          }
          if (BlocProvider.of<NotificationCubit>(context).not == null) {
            return CircularProgressIndicator(color: AppColors.primary,) ;
          }
          List not = BlocProvider.of<NotificationCubit>(context).not ;
          return ListView.builder(
            itemCount: not.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(15),
                margin: const EdgeInsets.all(15),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      not[index]['message'],
                      style: const TextStyle(
                          color: AppColors.primary,
                          fontSize: 18
                      ),
                    ),
                    not[index]['read_at'] == null ? Container(
                      width: 15,
                      height: 15,
                      decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle
                      ),
                    ):Container(),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
