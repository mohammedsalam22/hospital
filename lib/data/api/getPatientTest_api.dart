import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import '../../Models/GetPatientTest Model.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';
import '../../Models/getPatientRadioModel.dart';

class GetpatientTestApi {
  static Future fetchGetpatientTest() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${ApiConstant.baseUrl}/screeningTest/patient/${PatientId.patientID}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("donnnnnnnnnnne");

      final data = jsonDecode(response.body);
      return data; // Wrap in GetPatientTest instance
    } else {
      throw Exception('Failed to load radiographs');
    }
  }


}
