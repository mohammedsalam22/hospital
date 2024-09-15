import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/AddMedicalExamsPage/add_medical_exams_cubit.dart';
import '../cubit/AddMedicalExamsPage/add_medical_exams_states.dart';

class ConsultView extends StatelessWidget {
  final TextEditingController askExaminations = TextEditingController();

  ConsultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF41638E),
        title: Center(child: Text('إضافة استشارات' , style: TextStyle(fontFamily: 'RobotoCondensed'),)),
        toolbarHeight: 82.62,
        titleTextStyle: TextStyle(
          fontSize: 20, // حجم الخط يمكن تعديله حسب الحاجة
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: BlocProvider(
  create: (context) => addmedicalexamsCubit(),
  child: Container(
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
                controller: askExaminations,
                style: TextStyle(color: Colors.black),
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
            BlocConsumer<addmedicalexamsCubit, addmedicalexamsState>(
              listener: (context, state) {
                if (state.status == addmedicalexamsStatus.success) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('done successfully'))) ;
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF41638E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    final text = askExaminations.text.trim(); // إزالة المسافات الزائدة

                    if (text.isEmpty) {
                      // يمكنك عرض رسالة خطأ للمستخدم هنا
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('يرجى إدخال نص في مربع النص')),
                      );
                      return;
                    }
                    await BlocProvider.of<addmedicalexamsCubit>(context).createConsult(
                      askExaminations.text,
                    );
                  },
                  child: const Text('إرسال',
                    style: TextStyle(color: Colors.white),),
                );
              },
            ),
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
),
    );
  }
}