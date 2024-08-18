import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/GetPatientTestDoctor/GetPatientTest_Cubit.dart';
import '../../cubit/GetPatientTestDoctor/GetPatientTest_State.dart';
import '../../cubit/getnotresponsetest/getnotresponse_State.dart';
import '../../cubit/getnotresponsetest/getnotresponse_cubit.dart';

class getnotresponseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // التأكد من استدعاء fetchTests عند بناء الشاشة
    context.read<getnotresponseCubit>().fetchTests();

    return Scaffold(
      body: BlocBuilder<getnotresponseCubit, getnotresponseState>(
        builder: (context, state) {
          print("Current state: $state");

          if (state is getnotresponseLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is getnotresponseError) {
            return Center(
              child: Text(
                'حدث خطأ: ${state.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state is getnotresponseSuccess) {
            final response = state.patientTests.first;  // استخدم أول عنصر في القائمة
            return ListView.builder(
              itemCount: response.tests?.length ?? 0,
              itemBuilder: (context, index) {
                final singleTest = response.tests?[index];
                if (singleTest != null) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoCard('Patient ID: ${singleTest.patientID ?? 'N/A'}'),
                        _buildInfoCard('Ask Test: ${singleTest.askTest ?? 'N/A'}'),
                        _buildInfoCard('Result: ${singleTest.result ?? 'null'}'),
                        Divider(
                          color: Colors.grey,
                          thickness: 2.0,
                          indent: 16.0,
                          endIndent: 16.0,
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: Text('No tests available'));
                }
              },
            );
          }
          return Container(); // Return an empty container for any other state
        },
      ),
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
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontFamily: 'Poppins'),
          ),
        ),
      ),
    );
  }
}
