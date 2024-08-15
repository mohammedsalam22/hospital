import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/getMedicalExamination.dart';

class getMedicalExaminationApi {
  static final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsInVzZXJJRCI6MzAsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzMxNzU4NH0.ZFJr4q0D_mxsWxgcyDRNvhybVhomP35SQTo-xkb9h48';
  static final String baseUrl = 'http://192.168.43.74:3000/';


  static Future<List<Examination>> fetchgetMedicalExamination() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${baseUrl}api/examinations'),
      headers: {
        'token': token,
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("done");
      final data = jsonDecode(response.body);

      // استخدم المفتاح الصحيح "Examinations" بدلاً من "Examination"
      final getMedicalExaminations = (data['Examinations'] as List? ?? [])
          .map((json) => Examination.fromJson(json))
          .toList();

      print("Parsed Examinations: $getMedicalExaminations");

      return getMedicalExaminations;
    }
    else {
      throw Exception('Failed to load getMedicalExamination');
    }

  }
}