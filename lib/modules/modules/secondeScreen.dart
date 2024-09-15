import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_cubit.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../cubit/addIntensiveCaretheseconde_Cubit/cubit.addIntensiveCaretheseconde_Cubit.dart';
import '../../cubit/addIntensiveCaretheseconde_Cubit/cubit.addIntensiveCaretheseconde_State.dart';


class secondddddform extends StatefulWidget {
  @override
  State<secondddddform> createState() => seconddddd();
}

class seconddddd extends State<secondddddform> {


  final TextEditingController currentProblem = TextEditingController();
  final TextEditingController allergies = TextEditingController();
  final TextEditingController activity = TextEditingController();
  final TextEditingController neuro = TextEditingController();
  final TextEditingController diet = TextEditingController();
  final TextEditingController resp = TextEditingController();
  final TextEditingController GL = TextEditingController();
  final TextEditingController skin = TextEditingController();
  final TextEditingController cardiac = TextEditingController();
  final TextEditingController pain = TextEditingController();
  final TextEditingController M_S = TextEditingController();
  final TextEditingController RUE = TextEditingController();
  final TextEditingController RLE = TextEditingController();
  final TextEditingController LUE = TextEditingController();
  final TextEditingController LLE = TextEditingController();
  final TextEditingController GU = TextEditingController();
  final TextEditingController voidStatus = TextEditingController();
  final TextEditingController lastBM = TextEditingController();
  final TextEditingController medicalHistory = TextEditingController();
  final TextEditingController recentProcedure = TextEditingController();
  final TextEditingController IONote = TextEditingController();
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
      body: Container(
        color: Color(0xFFF1F8FF),
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // الصف الأول
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Current Problem', currentProblem)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Allergies', allergies)),
              ],
            ),
            SizedBox(height: 24),

// الصف الثاني
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Activity', activity)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Neuro', neuro)),
              ],
            ),
            SizedBox(height: 24),

// الصف الثالث
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Diet', diet)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Resp', resp)),
              ],
            ),
            SizedBox(height: 24),

// الصف الرابع
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('GL', GL)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Skin', skin)),
              ],
            ),
            SizedBox(height: 24),

// الصف الخامس
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Cardiac', cardiac)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Pain', pain)),
              ],
            ),
            SizedBox(height: 24),

// الصف السادس
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('M_S', M_S)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('RUE', RUE)),
              ],
            ),
            SizedBox(height: 24),

// الصف السابع
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('RLE', RLE)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('LUE', LUE)),
              ],
            ),
            SizedBox(height: 24),

// الصف الثامن
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('LLE', LLE)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('GU', GU)),
              ],
            ),
            SizedBox(height: 24),

// الصف التاسع
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Void Status', voidStatus)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Last BM', lastBM)),
              ],
            ),
            SizedBox(height: 24),

// الصف العاشر
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('Medical History', medicalHistory)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Recent Procedure', recentProcedure)),
              ],
            ),
            SizedBox(height: 24),

// الصف الحادي عشر
            Row(
              children: [
                Expanded(child: buildTextFieldGroup('IO Note', IONote)),
                SizedBox(width: 25),
                Expanded(child: buildTextFieldGroup('Other', other)),
              ],
            ),
            SizedBox(height: 24),

            BlocConsumer<SecondpartCubit, SecondpartState>(
              listener: (context, state) {
                if (state.status == SecondpartStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done '))) ;
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {


                    await BlocProvider.of<SecondpartCubit>(context).createSecondpart(
                      currentProblem.text,
                      allergies.text,
                      activity.text,
                      neuro.text,
                      diet.text,
                      resp.text,
                      GL.text,
                      skin.text,
                      cardiac.text,
                      pain.text,
                      M_S.text,
                      RUE.text,
                      RLE.text,
                      LUE.text,
                      LLE.text,
                      GU.text,
                      voidStatus.text,
                      lastBM.text,
                      medicalHistory.text,
                      recentProcedure.text,
                      IONote.text,
                      other.text,
                    );
                    currentProblem.clear();
                    allergies.clear();
                    activity.clear();
                    neuro.clear();
                    diet.clear();
                    resp.clear();
                    GL.clear();
                    skin.clear();
                    cardiac.clear();
                    pain.clear();
                    M_S.clear();
                    RUE.clear();
                    RLE.clear();
                    LUE.clear();
                    LLE.clear();
                    GU.clear();
                    voidStatus.clear();
                    lastBM.clear();
                    medicalHistory.clear();
                    recentProcedure.clear();
                    IONote.clear();
                    other.clear();
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

