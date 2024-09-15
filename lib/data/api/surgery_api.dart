import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class SurgeryApi {
  static Future postSurgery(
    String injuryType,
    String ASA,
    String surgerySituation,
    String surgeryDuration,
    bool antipathetic,
    String surgeonName,
    String helperSurgeonName,
    String nurseName,
    String surgeryName,
    String helperNurse,
    int surgeonRoomNumber,
    String antipatheticStartDate,
    String antipatheticStopDate,
  ) async {
    try {
      print('jkjkj');
      var response = await http.post(
        Uri.parse("${ApiConstant.baseUrl}/surgeryFile/${PatientId.patientID}"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          "token": Token.token,
        },
        body: json.encode({
          "otherInfos":{
            "injuryType": injuryType,
            "ASA": ASA,
            "surgerySituation": surgerySituation,
            "surgeryDuration": surgeryDuration,
            "antipathetic": antipathetic,
            "antipatheticStartDate": antipatheticStartDate,
            "antipatheticStopDate": antipatheticStopDate
          } ,
          "medicalCrewInfos": {
            "surgeonName": surgeonName,
            "helperSurgeonName": helperSurgeonName,
            "nurseName": nurseName,
            "surgeonRoomNumber": surgeonRoomNumber,
            "surgeryName": surgeryName,
            "helperNurse": helperNurse
          }
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
