import 'dart:convert';

import 'package:waseem/data/api/floor_api.dart';
import 'package:waseem/data/api/login_api.dart';

class FloorRepo {
  static Future getFloor() async {
    try {
      print("ddddd");
      var response = await FloorApi.getFloor();
      var d = jsonDecode(response);
      return d["rooms"];
    } catch (e) {
      rethrow;
    }
  }

  static Future getRoom(int id) async {
    try {
      print("ddddd");
      var response = await FloorApi.getRoom(id);
      var d = jsonDecode(response);
      return d['rooms'];
    } catch (e) {
      rethrow;
    }
  }

  static Future getPatientByRoom(int roomId) async {
    try {
      print("ddddd");
      var response = await FloorApi.getPatientByRoom(roomId);
      var d = jsonDecode(response);
      return d["patient"]["patientID"];
    } catch (e) {
      rethrow;
    }
  }
}
