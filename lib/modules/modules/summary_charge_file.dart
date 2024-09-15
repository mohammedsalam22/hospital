/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_cubit.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

class summarychargeForm extends StatefulWidget {
  @override
  State<summarychargeForm> createState() => PatientDischargeForm();
}

class PatientDischargeForm extends State<summarychargeForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Action for back button
              },
            ),
            Spacer(),
            Text(
              'استمارة خروج المريض',
              style: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 18,
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF1F8FF),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildTextFieldGroup('القسم'),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('تاريخ الدخول')),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('تاريخ الخروج')),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('الطبيب الاختصاصي')),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('الطبيب المقيم')),
              ],
            ),
            SizedBox(height: 24),
            buildTextFieldGroup('التشخيص النهائي'),
            SizedBox(height: 24),
            buildTextFieldGroup('سبب الإدخال'),
            SizedBox(height: 24),
            buildTextFieldGroup('ملخص السيرة المرضية والفحص السريري'),
            SizedBox(height: 24),
            buildTextFieldGroup('الفحوص المخبرية والشعاعية'),
            SizedBox(height: 24),
            buildTextFieldGroup('الاجراءات والتداخلات'),
            SizedBox(height: 24),
            buildTextFieldGroup('العمليات الجراحية ان وجدت'),
            SizedBox(height: 24),
            buildTextFieldGroup('العلاجات والأدوية والتطورات'),
            SizedBox(height: 24),
            buildTextFieldGroup('الأدوية الموصوفة والارشادات للمتابعة'),
          ],
        ),
      ),
    );
  }
}
  Widget buildTextFieldGroup(String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Container(
          color: Colors.white,
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            maxLines: null, // Allows the text field to expand vertically
          ),
        ),
        SizedBox(height: 16),



      ],
    );
  }


*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_cubit.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

class SummaryChargeForm extends StatefulWidget {
  @override
  State<SummaryChargeForm> createState() => PatientDischargeForm();
}

class PatientDischargeForm extends State<SummaryChargeForm> {
  /* specialistDoctor,
  inChargeDoctor, // Add this line
  finall,
  entryReason,
  finalSituation,
  guidelines// A*/
  final TextEditingController specialistDoctor = TextEditingController();
  final TextEditingController inChargeDoctor = TextEditingController();
  final TextEditingController finall = TextEditingController();
  final TextEditingController entryReason = TextEditingController();
  final TextEditingController finalSituation = TextEditingController();
  final TextEditingController guidelines = TextEditingController();
  final TextEditingController guidelines1 = TextEditingController();
  final TextEditingController guidelines2 = TextEditingController();
  final TextEditingController guidelines3 = TextEditingController();
  final TextEditingController guidelines4 = TextEditingController();
  final TextEditingController summaryStory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: const Row(
          children: [
            Text(
              'استمارة خروج المريض',
              style: TextStyle(
                fontFamily: 'Almarai',
                fontSize: 18,
              ),
            ),
            SizedBox(width: 20),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFF1F8FF),
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextFieldGroup('القسم', specialistDoctor),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                      child:
                          buildTextFieldGroup('تاريخ الدخول', inChargeDoctor)),
                  SizedBox(width: 25),
                  Expanded(child: buildTextFieldGroup('تاريخ الخروج', finall)),
                ],
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                      child:
                          buildTextFieldGroup('الطبيب الاختصاصي', entryReason)),
                  SizedBox(width: 25),
                  Expanded(
                      child:
                          buildTextFieldGroup('الطبيب المقيم', finalSituation)),
                ],
              ),
              SizedBox(height: 24),
              buildTextFieldGroup('الاختبارات', guidelines1),
              SizedBox(height: 24),
              buildTextFieldGroup('التبعيات', guidelines2),
              SizedBox(height: 24),
              buildTextFieldGroup('الاعمال الجراحية', guidelines3),
              SizedBox(height: 24),
              buildTextFieldGroup('العناية', guidelines4),
              SizedBox(height: 24),
              buildTextFieldGroup('التشخيص النهائي', summaryStory),
              SizedBox(height: 24),
              buildTextFieldGroup('القواعد الازمة', guidelines),
              BlocConsumer<summaryChargeCubit, summaryChargeState>(
                listener: (context, state) {
                  if (state.status == summaryChargeStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('done successfully')));
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: () async {
                      await BlocProvider.of<summaryChargeCubit>(context)
                          .createsummaryCharge(
                              specialistDoctor.text,
                              inChargeDoctor.text,
                              finall.text,
                              entryReason.text,
                              summaryStory.text,
                              finalSituation.text,
                              guidelines.text ,
                              guidelines1.text ,
                              guidelines2.text ,
                              guidelines3.text ,
                              guidelines4.text,
                              );
                    },
                    child: const Text('Submit'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldGroup(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Container(
          color: Colors.white,
          child: TextField(
            style: TextStyle(color: Colors.black),
            textAlign: TextAlign.right,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            maxLines: null, // Allows the text field to expand vertically
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
