//postAddresultScreen

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../cubit/ScreeingTest/ScreeingTest_Cubit.dart';
import '../../cubit/ScreeingTest/ScreeingTest_state.dart';
import '../../cubit/postAddresult/postaddresult_cubit.dart';
import '../../cubit/postAddresult/postaddresult_state.dart';

class postAddresultScreen extends StatefulWidget {
  @override
  State<postAddresultScreen> createState() => postAddresultForm();
}

class postAddresultForm extends State<postAddresultScreen> {

  final TextEditingController result = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: Row(
          children: [


            Text(
              'الرد بالنتيجة',
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
            buildTextFieldGroup('result', result),
            SizedBox(height: 24),



            BlocBuilder<postAddresultCubit, postAddresultState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () async {
                    await BlocProvider.of<postAddresultCubit>(context).createpostAddresult(
                      result.text,

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

