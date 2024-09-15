import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/patient_room/patient_cubit.dart';
import 'package:waseem/shared/shared%20style/colors.dart';

class ShowIntensiveView extends StatefulWidget {
  const ShowIntensiveView({super.key});

  @override
  State<ShowIntensiveView> createState() => _ShowIntensiveViewState();
}

class _ShowIntensiveViewState extends State<ShowIntensiveView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<PatientCubit>(context).getss();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.back,
      appBar: AppBar(
        backgroundColor: AppColors.primary,

      ),
      body: SafeArea(
          child: BlocBuilder<PatientCubit, PatientState>(
            builder: (context, state) {
              if (state.patientStatus == PatientStatus.loading) {
                return CircularProgressIndicator(color: AppColors.primary,) ;
              }
              if (BlocProvider.of<PatientCubit>(context).patients == null ) {
                return CircularProgressIndicator(color: AppColors.primary,) ;
              }
              List ss = BlocProvider.of<PatientCubit>(context).patients ;
              print(ss) ;
              return ListView.builder(
                itemCount: ss.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Room ID: ${ss[index]['roomID'] ?? 'null'}',
                              style: const TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'ptInitial: ${ss[index]['ptInitial'] ?? 'null'}',
                              style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'POA: ${ss[index]['POA'] ?? 'null'}',
                              style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'code: ${ss[index]['code'] ?? 'null'}',
                              style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'admitDate: ${ss[index]['admitDate'] ?? 'null'}',
                              style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'meds: ${ss[index]['meds'] ?? 'null'}',
                              style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF41638E),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              'Instructor: ${ss[index]['Instructor'] ?? 'null'}',
                              style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
                            ),
                          ),
                        ),
                      ),


                      Divider(
                        color: Colors.grey,       // لون الخط
                        thickness: 2.0,           // تحديد سماكة الخط (يمكنك تغيير القيمة لتناسب احتياجاتك)
                        indent: 16.0,             // مسافة من الجانب الأيسر (يمكنك تغيير القيمة لتتناسب مع التصميم)
                        endIndent: 16.0,          // مسافة من الجانب الأيمن (يمكنك تغيير القيمة لتتناسب مع التصميم)
                      ),

                    ],
                  );
                },
              );
            },
          )),
    );
  }
}
