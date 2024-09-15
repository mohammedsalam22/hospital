import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/modules/add_response_view.dart';
import 'package:waseem/modules/add_result_test_screen.dart';

import '../../cubit/getPAtientExam/getPAtientExam_cubit.dart';
import '../../cubit/getPAtientExam/getPAtientExam_state.dart';

class ScreenTestNurseView extends StatefulWidget {
  const ScreenTestNurseView({super.key});

  @override
  State<ScreenTestNurseView> createState() => _ScreenTestNurseViewState();
}

class _ScreenTestNurseViewState extends State<ScreenTestNurseView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await BlocProvider.of<getPAtientExamCubit>(context).getc();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('التحاليل المخبرية'),
      ),
      body: BlocBuilder<getPAtientExamCubit, getPAtientExamState>(
        builder: (context, state) {
          if (state is getPAtientExamLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is getPAtientExamError) {
            return Center(
                child: Text('حدث خطأ: ${state.error}',
                    style: TextStyle(color: Colors.red)));
          } else if (state is getPAtientExamSuccess) {
            var tt = BlocProvider.of<getPAtientExamCubit>(context).r['tests'];
            print(tt);
            return ListView.builder(
              itemCount: tt.length,
              itemBuilder: (context, index) {
                final r = tt[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoCard('ask : ${r['askTest']}'),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddResultTestScreen(id: r['id']))) ;
                          },
                          child: _buildInfoCard(
                              'result: ${r['result'] ?? 'null'}')),
                      const Divider(
                        color: Colors.grey,
                        // لون الخط
                        thickness: 2.0,
                        // تحديد سماكة الخط (يمكنك تغيير القيمة لتناسب احتياجاتك)
                        indent: 16.0,
                        // مسافة من الجانب الأيسر (يمكنك تغيير القيمة لتتناسب مع التصميم)
                        endIndent:
                            16.0, // مسافة من الجانب الأيمن (يمكنك تغيير القيمة لتتناسب مع التصميم)
                      ),
                    ],
                  ),
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
