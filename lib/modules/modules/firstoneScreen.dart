import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_cubit.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../cubit/the_first_part_Cubit/the first part_Cubit.dart';
import '../../cubit/the_first_part_Cubit/the first part_state.dart';


class firstoneform1 extends StatefulWidget {
  @override
  State<firstoneform1> createState() => firstone();
}

class firstone extends State<firstoneform1> {


/*  int RoomID,
      String ptInitial,
  String POA,
      String code,
  String HT,
      String WT,
  String isolation,
      String admitDate,
  String meds,
      String RN,
  String Instructor,
      bool accucheck,
  bool restraints*/
  final TextEditingController RoomID = TextEditingController();
  final TextEditingController ptInitial = TextEditingController();
  final TextEditingController POA = TextEditingController();
  final TextEditingController code = TextEditingController();
  final TextEditingController HT = TextEditingController();
  final TextEditingController WT = TextEditingController();
  final TextEditingController isolation = TextEditingController();
  final TextEditingController admitDate = TextEditingController();
  final TextEditingController meds = TextEditingController();
  final TextEditingController RN = TextEditingController();
  final TextEditingController Instructor = TextEditingController();

  bool accucheck = false;
  bool restraints = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: const Text(
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
            buildTextFieldGroup(' RoomID', RoomID),

            SizedBox(height: 24),

            buildTextFieldGroup('ptInitial', ptInitial),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('تاريخ POA', POA)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('code ', code)),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('HT ', HT)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('WT ', WT)),
              ],
            ),
            SizedBox(height: 24),
            buildTextFieldGroup(' isolation', isolation),
            SizedBox(height: 24),
            buildTextFieldGroup(' admitDate', admitDate),

            SizedBox(height: 24),
            buildTextFieldGroup(' meds', meds), SizedBox(height: 24),
            buildTextFieldGroup(' RN', RN), SizedBox(height: 24),
            buildTextFieldGroup(' Instructor', Instructor),

            CheckboxListTile(
              title: Text('accucheck'),
              value: accucheck,
              onChanged: (newValue) {
                setState(() {
                  accucheck = newValue ?? false;
                });
              },
            ),   CheckboxListTile(
              title: Text('restraints'),
              value: restraints,
              onChanged: (newValue) {
                setState(() {
                  restraints = newValue ?? false;
                });
              },
            ),

          /*  RoomID,
            ptInitial,
            POA,
            code,
            HT,
            WT,
            isolation,
            admitDate,
            meds,
            RN,
            Instructor,
            accucheck,
            restraints*/

            BlocConsumer<firstpartCubit, firstpartState>(
              listener: (context, state) {
                if (state.status == firstpartStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done successfully'))) ;
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    int? roomID;
                    try {
                      roomID = int.parse(RoomID.text);
                    } catch (e) {
                      print('رقم الغرفة غير صالح');
                      return; // إيقاف التنفيذ إذا كان هناك خطأ
                    }

                    await BlocProvider.of<firstpartCubit>(context).createfirstpart(
                        roomID,
                        ptInitial.text,
                        POA.text,
                        code.text,
                        HT.text,
                        WT.text,
                        isolation.text,
                        admitDate.text,
                        meds.text,
                        RN.text,
                        Instructor.text,
                        accucheck,
                        restraints
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
            style: const TextStyle(color: Colors.black),
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

