import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_cubit.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../cubit/IntensiveCarechangablesththirdpart_Cubit/cubit.IntensiveCarechangablesththirdpart_Cubit.dart';
import '../../cubit/IntensiveCarechangablesththirdpart_Cubit/cubit.IntensiveCarechangablesththirdpart_State.dart';

class threeform extends StatefulWidget {
  @override
  State<threeform> createState() => three();
}

class three extends State<threeform> {
  final TextEditingController shift = TextEditingController();
  final TextEditingController site = TextEditingController();
  final TextEditingController other = TextEditingController();
  final TextEditingController PIVController = TextEditingController();
  final TextEditingController CVCController = TextEditingController();
  final TextEditingController PICCController = TextEditingController();
  final TextEditingController fluidRateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: Text(
          'عناية 1',
          style: TextStyle(
            fontFamily: 'Almarai',
            fontSize: 18,
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFF1F8FF),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // الصف الأول
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Shift', shift, TextInputType.text)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Site', site, TextInputType.text)),
              ],
            ),
            SizedBox(height: 24),

            // الصف الثاني
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Other', other, TextInputType.text)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('PIV', PIVController, TextInputType.number)),
              ],
            ),
            SizedBox(height: 24),

            // الصف الثالث
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('CVC', CVCController, TextInputType.number)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('PICC', PICCController, TextInputType.number)),
              ],
            ),
            SizedBox(height: 24),

            // الصف الرابع
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Fluid Rate', fluidRateController, TextInputType.number)),
              ],
            ),
            SizedBox(height: 24),

            BlocConsumer<threeSectionCubit, threeSectionState>(
              listener: (context, state) {
                if (state.status == threeSectionStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done'))) ;
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    int? parseInt(String value) {
                      try {
                        return int.parse(value);
                      } catch (e) {
                        print('خطأ في تحويل النص إلى عدد صحيح: $e');
                        return null; // أو يمكنك التعامل مع القيمة الافتراضية
                      }
                    }

                    // تحويل النصوص إلى أعداد صحيحة
                    int? PIV = parseInt(PIVController.text);
                    int? CVC = parseInt(CVCController.text);
                    int? PICC = parseInt(PICCController.text);
                    int? fluidRate = parseInt(fluidRateController.text);

                    await BlocProvider.of<threeSectionCubit>(context).createthreeSection(
                      shift.text, // قيمة نصية
                      PIV ?? 0, // عدد صحيح (مع تعيين قيمة افتراضية في حالة أن التحويل فشل)
                      CVC ?? 0, // عدد صحيح (مع تعيين قيمة افتراضية في حالة أن التحويل فشل)
                      PICC ?? 0, // عدد صحيح (مع تعيين قيمة افتراضية في حالة أن التحويل فشل)
                      site.text, // قيمة نصية
                      fluidRate ?? 0, // عدد صحيح (مع تعيين قيمة افتراضية في حالة أن التحويل فشل)
                      other.text, // قيمة نصية
                    );
                  },
                  child: const Text('Submit'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFieldGroup(String label, TextEditingController controller, TextInputType keyboardType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 12),
        Container(
          color: Colors.white,
          child: TextField(
            style: const TextStyle(color: Colors.black),
            textAlign: TextAlign.right,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
            ),
            maxLines: null, // Allows the text field to expand vertically
            keyboardType: keyboardType, // Use the passed keyboard type
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
