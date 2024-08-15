import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/getsummarychagemodel.dart';
import '../../cubit/getsummarychage/getsummarychage_cubit.dart';
import '../../cubit/getsummarychage/getsummarychage_state.dart';

class getsummarychargeItem extends StatelessWidget {
  final String baseUrl = 'http://192.168.43.74:3000/';
  late final SummaryDischarge summaryDischarge;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<getsummarychargeCubit, getsummarychargeState>(
      builder: (context, state) {
        if (state is getsummarychargeLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is getsummarychargeError) {
          return Center(child: Text('حدث خطأ: ${state.error}', style: TextStyle(color: Colors.red)));
        } else if (state is getsummarychargeSuccess) {
          print("fffffffffffffffffffffffffffffff");
          return ListView.builder(
            itemCount: state.summaryDischarge.length,
            itemBuilder: (context, index) {
              final summaryDischarge = state.summaryDischarge[index];
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
                          'In Charge Doctor: ${summaryDischarge.inChargeDoctor ?? 'null'}',
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
                          'Final Diagnosis: ${summaryDischarge.finalDiagnosis ?? 'null'}',
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
                          'Entry Reason: ${summaryDischarge.entryReason ?? 'null'}',
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
                          'Summary Story: ${summaryDischarge.summaryStory ?? 'null'}',
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
                          'Tests: ${summaryDischarge.tests ?? 'null'}',
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
                          'Procedures: ${summaryDischarge.procedures ?? 'null'}',
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
                          'Surgeons: ${summaryDischarge.surgeons ?? 'null'}',
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
                          'Treatments: ${summaryDischarge.treatments ?? 'null'}',
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
                          'Final Situation: ${summaryDischarge.finalSituation ?? 'null'}',
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
                          'Guidelines: ${summaryDischarge.guidelines ?? 'null'}',
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
        }
        return Center(child: Text('لا توجد بيانات.'));
      },
    );
  }
}
