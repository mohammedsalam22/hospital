import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/GetRadiograph/GetRadiograph_cubit.dart';
import '../../cubit/GetRadiograph/GetRadiograph_state.dart';


class Getradiograph extends StatelessWidget {
  final String baseUrl = 'http://192.168.43.74:3000/';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetradiographCubit, GetradiographState>(
        builder: (context, state) {
      if (state is GetradiographLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is GetradiographError) {
        return Center(child: Text('حدث خطأ: ${state.error}', style: TextStyle(color: Colors.red)));
      } else if (state is GetradiographSuccess) {
        return ListView.builder(
            itemCount: state.getradiographs.length,
            itemBuilder: (context, index) {
          final getradiograph = state.getradiographs[index];
          return Padding(
              padding: const EdgeInsets.all(8.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    _buildInfoCard('doctorID: ${getradiograph.doctorID }'),
    _buildInfoCard('patientID: ${getradiograph.patientID }'),
    _buildInfoCard('askExaminations: ${getradiograph.askExaminations }'),
    _buildInfoCard('response: ${getradiograph.response ?? 'null'}'),
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
