import 'dart:convert';
import '../api/final_api.dart';
import '../api/firstpart_api.dart';
import '../api/summary_charge_api.dart';

class finalRepo {
  static Future createfinal(
      int HR,
      int BP,
      int Rr,
      int Temp,
      int SPO2,
      String other,

      ) async {
    try {
      print("ddddd");

      var response = await finalApi.createfinal(
         HR,
         BP,
         Rr,
         Temp,
         SPO2,
         other,


      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
