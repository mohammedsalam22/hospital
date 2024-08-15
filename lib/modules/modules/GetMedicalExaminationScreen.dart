import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/getMedicalExamination/getMedicalExamination_cubit.dart';
import '../../cubit/getMedicalExamination/getMedicalExamination_state.dart';




class GetMedicalExaminationScreen extends StatelessWidget {
  final String baseUrl = 'http://192.168.43.74:3000/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMedicalExaminationCubit, GetMedicalExaminationState>(
      builder: (context, state) {
        if (state is GetMedicalExaminationInitial) {
          return Center(child: CircularProgressIndicator());
        } else if (state is GetMedicalExaminationError) {
          return Center(child: Text('حدث خطأ: ${state.error}', style: TextStyle(color: Colors.red)));
        } else if (state is GetMedicalExaminationSuccess) {
          print("Medical Examinations: ${state.getMedicalExaminations}");
          return ListView.builder(
            itemCount: state.getMedicalExaminations.length,
            itemBuilder: (context, index) {
              final medicalExamination = state.getMedicalExaminations[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoCard('doctorID: ${medicalExamination.doctorID}'),
                    _buildInfoCard('patientID: ${medicalExamination.patientID}'),
                    _buildInfoCard('askExaminations: ${medicalExamination.askExaminations}'),
                    _buildInfoCard('response: ${medicalExamination.response ?? 'null'}'),
                    Divider(
                      color: Colors.grey,
                      thickness: 2.0,
                      indent: 16.0,
                      endIndent: 16.0,
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
