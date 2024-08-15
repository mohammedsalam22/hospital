import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../cubit/ScreeingTest/ScreeingTest_Cubit.dart';
import '../../cubit/ScreeingTest/ScreeingTest_state.dart';

class ScreeingTestForm extends StatefulWidget {
  @override
  State<ScreeingTestForm> createState() => PatientDischargeForm();
}

class PatientDischargeForm extends State<ScreeingTestForm> {

  final TextEditingController askTest = TextEditingController();


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
            buildTextFieldGroup('askTest', askTest),
            SizedBox(height: 24),



            BlocBuilder<ScreeingTestCubit, ScreeingTestState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    await BlocProvider.of<ScreeingTestCubit>(context).createScreeingTest(
                        askTest.text,

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

