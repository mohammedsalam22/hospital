import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/AddMedicalExamsPage/add_medical_exams_cubit.dart';
import '../../cubit/AddMedicalExamsPage/add_medical_exams_states.dart';
import '../../cubit/addVital/addVital_state.dart';
import '../../cubit/addVital/addvital_cubit.dart';
import '../../cubit/radiograph/radio_graph_cubit.dart';
import '../../cubit/radiograph/radio_graph_state.dart';
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddMedicalExamsPage(),
    );
  }
}*/

class addVital extends StatelessWidget {
  final TextEditingController bodyTemperature = TextEditingController();
  final TextEditingController heartRate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: Center(child: Text('إضافة حيوية' , style: TextStyle(fontFamily: 'RobotoCondensed'),)),
        toolbarHeight: 82.62,
        titleTextStyle: TextStyle(
          fontSize: 20, // حجم الخط يمكن تعديله حسب الحاجة
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Container(
        color: Color(0xFFF1F8FF),
        padding: EdgeInsets.symmetric(horizontal: 57, vertical: 9),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight, // محاذاة الأيقونة والنص إلى اليمين
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [

                  Text(
                    'رسالة',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Color(0xFF41638E),
                    ),
                  ),
                  SizedBox(width: 8), // المسافة بين الأيقونة والنص

                  Icon(
                    Icons.message,
                    size: 25,
                    color: Color(0xFF41638E),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16), // المسافة بين النص ومربع النص
            Expanded(
              child: TextField(
                controller: bodyTemperature,

                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TextField(
                controller: heartRate,

                maxLines: null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
            ),
            SizedBox(height: 10),
            BlocBuilder<addVitalCubit, addVitalState>(
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF41638E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final text = bodyTemperature.text.trim(); // إزالة المسافات الزائدة
                    final text2 = heartRate.text.trim(); // إزالة المسافات الزائدة

                    if (text.isEmpty || text2.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('يرجى إدخال القيم في جميع الحقول')),
                      );
                      return;
                    }

                    try {
                      final int parsedBodyTemperature = int.parse(text);
                      final int parsedHeartRate = int.parse(text2);

                      await BlocProvider.of<addVitalCubit>(context).createaddVital(
                        parsedBodyTemperature,
                        parsedHeartRate,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('يرجى إدخال أرقام صحيحة فقط')),
                      );
                    }
                  },
                  child: const Text('إرسال', style: TextStyle(color: Colors.white)),
                );
              },
            )

            /*      SizedBox(
              width: 108,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF41638E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  // Logic for sending the medical exams data
                },
                child: Text(
                  'إرسال',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
