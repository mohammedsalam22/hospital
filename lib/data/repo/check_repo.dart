import 'dart:convert';

import '../api/check_api.dart';

class CheckRepo {
  static Future getDoctorDetails(int id , int patientId) async {
    try {
      var response = await CheckApi.checkIn(id , patientId);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future checkOut(int id ) async {
    try {
      var response = await CheckApi.checkOut(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future consults( ) async {
    try {
      var response = await CheckApi.consults();
      return jsonDecode(response)['consults'];
    } catch (e) {
      rethrow ;
    }
  }
}