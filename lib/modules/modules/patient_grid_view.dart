import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/shared/shared%20style/colors.dart';

import '../../cubit/check_cubit/check_cubit.dart';
import '../../cubit/view-patient_cubit/view_patient_cubit.dart';


class PatientGridView extends StatefulWidget {
  const PatientGridView({super.key, required this.roomID});

  final int roomID;

  @override
  State<PatientGridView> createState() => _PatientGridViewState();
}

class _PatientGridViewState extends State<PatientGridView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<ViewPatientCubit>(context).getPatientIn();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColors.primary,),
      backgroundColor: AppColors.back,
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            BlocBuilder<ViewPatientCubit, View_Patient_State>(
              builder: (context, state) {
                if (state.view_patient_status == View_Patient_Status.loading) {
                  return const CircularProgressIndicator(color: AppColors.primary);
                }
                if (BlocProvider.of<ViewPatientCubit>(context).rr3 == null) {
                  return const CircularProgressIndicator(color: AppColors.primary);
                }
                List nurse = BlocProvider.of<ViewPatientCubit>(context).rr3;
                return Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns
                        mainAxisExtent: 100,
                        crossAxisSpacing: 50,
                        mainAxisSpacing: 20),
                    itemCount: nurse.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  title: Text(
                                    'تاكيد دخول المريض',
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  actions: [
                                    BlocListener<CheckCubit, CheckState>(
                                      listener: (context, state) {
                                        if (state.checkStatus == CheckStatus.success) {
                                          Navigator.of(context).pop() ;
                                          Navigator.of(context).pop() ;
                                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('check in successfully'))) ;
                                        }
                                      },
                                      child: TextButton(
                                        onPressed: () async {
                                          await BlocProvider.of<CheckCubit>(context).checkIn(widget.roomID, nurse[index]['id']) ;
                                        },
                                        child: const Text(
                                          'تاكيد',
                                          style:
                                          TextStyle( color: AppColors.primary,),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'الغاء',
                                        style: TextStyle( color: AppColors.primary,),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Container(
                          width: width / 7,
                          height: height / 10,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            color: Colors.white,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(
                                'assets/images/img_1.png',
                                height: height / 7,
                                width: width / 7,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    nurse[index]['fullName'],
                                    style: const TextStyle(fontSize: 18 , color: Colors.black),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
