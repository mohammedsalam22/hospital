import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/add_neck_examination/add_neck_examination_Cubit.dart';
import '../../cubit/add_neck_examination/add_neck_examination_State.dart';

class AddNeckExamScreen extends StatelessWidget {
  // Enum dropdown options
  //listening', 'testing')
  //pulsation', 'distention')
  final List<String> carotidArteryOptions = ['listening', 'testing'];
  final List<String> jugularVeinOptions = ['pulsation', 'distention'];

  // Controllers for TextFields
  final TextEditingController lymphNodesController = TextEditingController();

  // State variables for dropdowns and checkboxes
  String? selectedCarotidArtery;
  String? selectedJugularVein;
  bool neckStiffness = false;
  bool pembertonsSign = false;
  bool thyroidGlandTesting = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: Center(
          child: Text(
            'إضافة فحص العنق',
            style: TextStyle(fontFamily: 'RobotoCondensed'),
          ),
        ),
        toolbarHeight: 82.62,
        titleTextStyle: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        color: Color(0xFFF1F8FF),
        padding: EdgeInsets.symmetric(horizontal: 57, vertical: 9),
        child: Column(
          children: [
            // Dropdown for Carotid Artery
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Carotid Artery',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              value: selectedCarotidArtery,
              onChanged: (value) {
                selectedCarotidArtery = value;
              },
              items: carotidArteryOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 10),

            // Dropdown for Jugular Vein
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Jugular Vein',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              value: selectedJugularVein,
              onChanged: (value) {
                selectedJugularVein = value;
              },
              items: jugularVeinOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            SizedBox(height: 10),

            // TextField for Lymph Nodes
            TextField(
              controller: lymphNodesController,
              decoration: InputDecoration(
                labelText: 'Lymph Nodes',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),

            // Checkbox for Neck Stiffness
            CheckboxListTile(
              title: Text('Neck Stiffness'),
              value: neckStiffness,
              onChanged: (bool? value) {
                neckStiffness = value ?? false;
              },
            ),

            // Checkbox for Pemberton's Sign
            CheckboxListTile(
              title: Text("Pemberton's Sign"),
              value: pembertonsSign,
              onChanged: (bool? value) {
                pembertonsSign = value ?? false;
              },
            ),

            // Checkbox for Thyroid Gland Testing
            CheckboxListTile(
              title: Text('Thyroid Gland Testing'),
              value: thyroidGlandTesting,
              onChanged: (bool? value) {
                thyroidGlandTesting = value ?? false;
              },
            ),
            SizedBox(height: 10),

            BlocBuilder<addNeckExamCubit, addNeckExamState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF41638E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final carotidArtery = selectedCarotidArtery;
                    final jugularVein = selectedJugularVein;
                    final lymphNodes = lymphNodesController.text.trim();

                    if (carotidArtery == null || jugularVein == null || lymphNodes.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('يرجى إدخال القيم في جميع الحقول')),
                      );
                      return;
                    }

                    await BlocProvider.of<addNeckExamCubit>(context).createaddNeckExam(
                      carotidArtery,
                      jugularVein,
                      lymphNodes,
                      neckStiffness,
                      pembertonsSign,
                      thyroidGlandTesting,
                    );
                  },
                  child: const Text('إرسال', style: TextStyle(color: Colors.white)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
