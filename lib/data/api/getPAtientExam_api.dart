import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';
import '../../Models/getPatientExamModel.dart';
import '../../Models/getPatientRadioModel.dart';

class getPAtientExamApi {
  static Future<List<Examinations>> fetchgetPAtientExam() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse(
          '${ApiConstant.baseUrl}/examinations/patient/${PatientId.patientID}'),
      headers: {
        'token': Token.token,
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body);

      // التحقق من أن المفتاح موجود وأن قيمته قائمة قبل محاولة تحويله
      if (data['Examinations'] != null && data['Examinations'] is List) {
        final getPatientExam = (data['Examinations'] as List)
            .map((json) => Examinations.fromJson(json))
            .toList();
        return getPatientExam;
      } else {
        throw Exception(
            'Invalid data format: expected a list for getPatientExams');
      }
    } else {
      throw Exception('Failed to load getPatientExam');
    }
  }

  static Future getc() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${ApiConstant.baseUrl}/screeningTest'),
      headers: {
        'token': Token.token,
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    print(response.body);
    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body);

      return data;
    }
  }
}
