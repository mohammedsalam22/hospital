import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_cubit.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../cubit/Intensive Care vitals final part_Cubit/Intensive Care vitals final part_Cubit.dart';
import '../../cubit/Intensive Care vitals final part_Cubit/Intensive Care vitals final part_State.dart';

class firstoneform extends StatefulWidget {
  @override
  State<firstoneform> createState() => firstone();
}

class firstone extends State<firstoneform> {
  final TextEditingController HR = TextEditingController();
  final TextEditingController BP = TextEditingController();
  final TextEditingController Rr = TextEditingController();
  final TextEditingController Temp = TextEditingController();
  final TextEditingController SPO2 = TextEditingController();
  final TextEditingController other = TextEditingController();

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

      /*  Row(
        children: [
          Expanded(child: buildTextFieldGroup('تاريخ POA', POA)),
          SizedBox(width: 25),
          Expanded(child: buildTextFieldGroup('code ', code)),
        ],
      ),
      */

      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFF1F8FF),
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: buildTextFieldGroup('HR ', HR)),
                  SizedBox(width: 25),
                  Expanded(child: buildTextFieldGroup('BP ', BP)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: buildTextFieldGroup('Rr ', Rr)),
                  SizedBox(width: 25),
                  Expanded(child: buildTextFieldGroup('Temp ', Temp)),
                ],
              ),
              Row(
                children: [
                  Expanded(child: buildTextFieldGroup('SPO2 ', SPO2)),
                  SizedBox(width: 25),
                  Expanded(child: buildTextFieldGroup('other ', other)),
                ],
              ),
              BlocConsumer<finalSectionCubit, finalSectionState>(
                listener: (context, state) {
                  if (state.status == finalSectionStatus.success) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done')));
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

                      int? HRValue = parseInt(HR.text);
                      int? BPValue = parseInt(BP.text);
                      int? RrValue = parseInt(Rr.text);
                      int? TempValue = parseInt(Temp.text);
                      int? SPO2Value = parseInt(SPO2.text);

                      await BlocProvider.of<finalSectionCubit>(context)
                          .createfinalSection(
                        HRValue ?? 0,
                        BPValue ?? 0,
                        RrValue ?? 0,
                        (TempValue ?? 0),
                        (SPO2Value ?? 0),
                        other.text,
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
            style: const TextStyle(
              color: Colors.black,
            ),
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
