import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class SummaryChargeApi {

  static Future<String> createSummaryCharge(
  String specialistDoctor,
  String inChargeDoctor,
  String finall,
  String entryReason,
  String summaryStory,
  String finalSituation,
  String guidelines,
  String guidelines1,
  String guidelines2,
  String guidelines3,
  String guidelines4,

      ) async {
try{
    var response = await http.post(
      Uri.parse("${ApiConstant.baseUrl}/information/summaryCharge/${PatientId.patientID}"),
      headers: {
        'Content-Type': 'application/json',
        'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsInVzZXJJRCI6MjIsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMjcxNzg1OH0.CjpNMjA83zTEOnxbi9KFTehwSpcxNG4aLFWP041lWm0",

      },
      body: jsonEncode({
        //'final': section,
      'specialistDoctor':specialistDoctor,
        'inChargeDoctor':inChargeDoctor,
        'final':finall,
        'entryReason':entryReason,
        'summaryStory':summaryStory,
        'finalSituation':finalSituation,
        'guidelines':guidelines ,
        "tests" : guidelines1 ,
        "procedures" : guidelines2 ,
        "surgeons" : guidelines3 ,
        "treatments" : guidelines4 ,

      }),
    );

    print(response.body) ;
    if (response.statusCode == 200) {
      print("donnnnnnnnnnne") ;
      return response.body ;
    }else {
      throw Exception('an Error Occurred');
    }
  } catch (e) {
  rethrow ;

  }
}
}