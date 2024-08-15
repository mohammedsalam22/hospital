import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Models/getPatientExamModel.dart';
import '../../Models/getPatientExamModel.dart';
import '../../cubit/getPAtientExam/getPAtientExam_cubit.dart';
import '../../cubit/getPAtientExam/getPAtientExam_state.dart';


class getPatientExamScreen extends StatelessWidget {
  final String baseUrl = 'http://192.168.202.16:3000/';
  late final Examinations getPatientExam;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<getPAtientExamCubit, getPAtientExamState>(
      builder: (context, state) {
        if (state is getPAtientExamLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is getPAtientExamError) {
          return Center(child: Text('حدث خطأ: ${state.error}', style: TextStyle(color: Colors.red)));
        } else if (state is getPAtientExamSuccess) {
          return ListView.builder(
            itemCount: state.getpatientexam.length,
            itemBuilder: (context, index) {
              final Getpatientexam = state.getpatientexam[index];

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoCard('doctorID: ${Getpatientexam.doctorID }'),
                    _buildInfoCard('patientID: ${Getpatientexam.patientID }'),
                    _buildInfoCard('askExaminations: ${Getpatientexam.askExaminations }'),
                    _buildInfoCard('response: ${Getpatientexam.response ?? 'null'}'),
                    Divider(
                      color: Colors.grey,       // لون الخط
                      thickness: 2.0,           // تحديد سماكة الخط (يمكنك تغيير القيمة لتناسب احتياجاتك)
                      indent: 16.0,             // مسافة من الجانب الأيسر (يمكنك تغيير القيمة لتتناسب مع التصميم)
                      endIndent: 16.0,          // مسافة من الجانب الأيمن (يمكنك تغيير القيمة لتتناسب مع التصميم)
                    ),
                  ],
                ),
              );
            },
          );
        }
        return Container(); // Return an empty container for any other state
      },
    );
  }

  Widget _buildInfoCard(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF41638E),
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}
