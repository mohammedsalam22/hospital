import 'dart:convert';

import 'package:waseem/data/api/patient_room_api.dart';

class PatientRoomRepo {
  static Future getPatient(int roomId) async {
    try {
      var response = await PatientRoomApi.getPatient(roomId) ;
      return jsonDecode(response)['patient'] ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future getd() async {
    try {
      var response = await PatientRoomApi.getclinicalForm() ;
      return jsonDecode(response)['patientCare'] ;
    } catch (e) {
      rethrow ;
    }
  }
}