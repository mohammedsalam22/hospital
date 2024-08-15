
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/getPatientExamModel.dart';
import '../../Models/getPatientRadioModel.dart';

class getPAtientExamApi {
  static final String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsInVzZXJJRCI6MzAsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzMxNzU4NH0.ZFJr4q0D_mxsWxgcyDRNvhybVhomP35SQTo-xkb9h48';
  static final String baseUrl = 'http://192.168.43.74:3000/';

  static Future<List<Examinations>> fetchgetPAtientExam() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${baseUrl}api/examinations/patient/1'),
      headers: {
        'token': token,
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("donnnnnnnnnnne");
      final data = jsonDecode(response.body);

      // التحقق من أن المفتاح موجود وأن قيمته قائمة قبل محاولة تحويله
      if (data['Examinations'] != null && data['Examinations'] is List) {
        final getPatientExam = (data['Examinations'] as List)
            .map((json) => Examinations.fromJson(json))
            .toList();
        return getPatientExam;
      } else {
        throw Exception('Invalid data format: expected a list for getPatientExams');
      }
    } else {
      throw Exception('Failed to load getPatientExam');
    }
  }
}
