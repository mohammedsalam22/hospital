import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/GetPatientTestDoctor/GetPatientTest_Cubit.dart';
import '../../cubit/GetPatientTestDoctor/GetPatientTest_State.dart';

class GetPatientTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // التأكد من استدعاء fetchPatientTests عند بناء الشاشة
    context.read<GetPatientTestDoctorCubit>().fetchPatientTests();

    return Scaffold(

      body: BlocBuilder<GetPatientTestDoctorCubit, GetPatientTestDoctorState>(
        builder: (context, state) {
          print("Current state: $state");

          if (state is GetPatientTestLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetPatientTestError) {
            return Center(
              child: Text(
                'حدث خطأ: ${state.error}',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state is GetPatientTestSuccess) {
            return ListView.builder(
              itemCount: state.patientTests.length,
              itemBuilder: (context, index) {
                final test = state.patientTests[index];
                // التحقق من وجود اختبارات للعرض
                if (test.tests != null && test.tests!.isNotEmpty) {
                  return Column(
                    children: test.tests!.map((singleTest) {
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
                    }).toList(),
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
