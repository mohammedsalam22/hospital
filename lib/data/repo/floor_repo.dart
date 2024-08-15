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
}
