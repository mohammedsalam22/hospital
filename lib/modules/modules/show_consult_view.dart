import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/check_cubit/check_cubit.dart';
import 'package:waseem/modules/add_response_view.dart';

import '../../shared/shared style/colors.dart';

class ShowConsultView extends StatefulWidget {
  const ShowConsultView({super.key});

  @override
  State<ShowConsultView> createState() => _ShowConsultViewState();
}

class _ShowConsultViewState extends State<ShowConsultView> {
  @override
  Widget build(BuildContext context) {
    // التأكد من استدعاء fetchPatientTests عند بناء الشاشة
    context.read<CheckCubit>().consults();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
      ),
      body: BlocBuilder<CheckCubit, CheckState>(
        builder: (context, state) {
          print("Current state: $state");

          if (state.checkStatus == CheckStatus.loading) {
            return Center(child: CircularProgressIndicator());
          } else if (state.checkStatus == CheckStatus.failure) {
            return Center(
              child: Text(
                'حدث خطأ: ${state.checkStatus}',
                style: TextStyle(color: Colors.red),
              ),
            );
          } else if (state.checkStatus == CheckStatus.success) {
            List ss = BlocProvider.of<CheckCubit>(context).con ;
            return ListView.builder(
              itemCount: ss.length,
              itemBuilder: (context, index) {
                final test = ss[index];
                // التحقق من وجود اختبارات للعرض
                if (test.tests != null && test.tests!.isNotEmpty) {
                  return Column(
                    children: test.tests!.map((singleTest) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoCard('Ask consult: ${test['consults'] ?? 'N/A'}'),
                            InkWell( onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddResponseView(id: test['id'],),)) ;
                            }, child: _buildInfoCard('Result: ${test['response'] ?? 'null'}')),
                            const Divider(
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
