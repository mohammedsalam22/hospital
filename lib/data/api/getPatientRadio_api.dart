/*

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/getPatientRadioModel.dart';
String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsInVzZXJJRCI6MzAsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzMxNzU4NH0.ZFJr4q0D_mxsWxgcyDRNvhybVhomP35SQTo-xkb9h48';
String baseUrl = 'http://192.168.43.74:3000/';


*/
/*
String pdfUrl = 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf';
var response = await http.get(Uri.parse(pdfUrl));

if (response.statusCode == 200) {
var dir = await getTemporaryDirectory();
File file = File("${dir.path}/downloaded_file.pdf");
await file.writeAsBytes(response.bodyBytes);
emit(PdfLoaded(file.path));
*//*

class RadiographService {

  static Future<List<Radiograph>> fetchRadiographs() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${baseUrl}api/examinations/patient/radio/1'),
      headers: {
        'token': token,
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final radiographs = (data['Radiographs'] as List)
          .map((json) => Radiograph.fromJson(json))
          .toList();
      return radiographs;
    } else {
      throw Exception('Failed to load radiographs');
    }
  }

}

*/
// radiograph_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';
import '../../Models/getPatientRadioModel.dart';

class GetpatientradioApi {
  static  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjQsInVzZXJJRCI6MzQsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzkzNTM5NX0.ZbzRRcJQgv-EQiB0sp5x-hsUoqsEmu97kOXSfaRGWxU';
  static   final String baseUrl = 'http://192.168.43.74:3000/';

  static  Future<List<GetPatientRadio>> fetchRadiographs() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${ApiConstant.baseUrl}/examinations/patient/radio/${PatientId.patientID}'),
      headers: {
        'token': token,
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("donnnnnnnnnnne") ;

      final data = jsonDecode(response.body);
      final radiographs = (data['Radiographs'] as List)
          .map((json) => GetPatientRadio.fromJson(json))
          .toList();
      return radiographs;
    } else {
      throw Exception('Failed to load radiographs');
    }
  }
}
