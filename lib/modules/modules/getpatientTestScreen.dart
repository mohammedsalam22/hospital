import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/modules/add_response_view.dart';
import 'package:waseem/modules/add_result_test_screen.dart';
import 'package:waseem/shared/shared%20style/colors.dart';

import '../../cubit/GetPatientTestDoctor/GetPatientTest_Cubit.dart';
import '../../cubit/GetPatientTestDoctor/GetPatientTest_State.dart';

class GetPatientTestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // التأكد من استدعاء fetchPatientTests عند بناء الشاشة
    context.read<GetPatientTestDoctorCubit>().fetchPatientTests();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: BlocBuilder<GetPatientTestDoctorCubit, GetPatientTestDoctorState>(
        builder: (context, state) {
          print("Current state: $state");

          if (state is GetPatientTestLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetPatientTestError) {
            return Center(
              child: Text(
                'kjkkjjkkjjkkj',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state is GetPatientTestSuccess) {
            var r = BlocProvider.of<GetPatientTestDoctorCubit>(context).rr['tests'] ;
            print(r) ;
            return ListView.builder(
              itemCount: r.length,
              itemBuilder: (context, index) {
                final test = r[index];
                print(test['id']) ;
                // التحقق من وجود اختبارات للعرض
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoCard('Patient ID: ${test['patientID'] ?? 'N/A'}'),
                            _buildInfoCard('Ask Test: ${test['askTest'] ?? 'N/A'}'),
                            InkWell(onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddResultTestScreen(id: test['id']))) ;
                            },child: _buildInfoCard('Result: ${test['result'] ?? 'null'}')),
                            Divider(
                              color: Colors.grey,
                              thickness: 2.0,
                              indent: 16.0,
                              endIndent: 16.0,
                            ),
                          ],
                        ),
                      )
                    ],
                  );
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
