import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class firstoneApi {

  static Future<String> createfirstone(
      int RoomID,
      String ptInitial,
      String POA,
      String code,
      String HT,
      String WT,
      String isolation,
      String admitDate,
      String meds,
      String RN,
      String Instructor,
      bool accucheck,
      bool restraints

      ) async {
    try{
      var response = await http.post(
        Uri.parse("${ApiConstant.baseUrl}/intensiveCare/Intensive_Care/${PatientId.patientID}"),
        headers: {
          'Content-Type': 'application/json',
          'token': Token.token,

        },
        body: jsonEncode({
          //'final': section,
        //  'specialistDoctor':specialistDoctor,
          'RoomID' :RoomID,
          'ptInitial':ptInitial,
          'POA':POA,
          'code':code,
          'HT':HT,
          'WT':WT,
          'isolation':isolation,
          'admitDate':admitDate,
          'meds':meds,
          'RN':RN,
          'Instructor':Instructor,
          'accucheck':accucheck,
          'restraints':restraints

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