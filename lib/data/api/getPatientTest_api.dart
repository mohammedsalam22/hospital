import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/GetPatientTest Model.dart';
import '../../Models/getPatientRadioModel.dart';

class GetpatientTestApi {
  static  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsInVzZXJJRCI6MzQsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzkzNTM5NX0.ZbzRRcJQgv-EQiB0sp5x-hsUoqsEmu97kOXSfaRGWxU';
  static   final String baseUrl = 'http://192.168.43.74:3000/';
  static Future<List<GetPatientTest>> fetchGetpatientTest() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${baseUrl}api/screeningTest/patient/1'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("donnnnnnnnnnne");

      final data = jsonDecode(response.body);
      final testsList = (data['tests'] as List)
          .map((json) => Tests.fromJson(json))
          .toList();
//
      return [GetPatientTest(tests: testsList)]; // Wrap in GetPatientTest instance
    } else {
      throw Exception('Failed to load radiographs');
    }
  }


}
