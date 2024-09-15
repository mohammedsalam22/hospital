import 'dart:convert';
import '../api/firstpart_api.dart';
import '../api/secondPart_api.dart';
import '../api/summary_charge_api.dart';
import '../api/threeSection_api.dart';

class threeRepo {
  static Future createthree(
      String shift,
      int PIV,
      int CVC,
      int PICC,
      String site,
      int fluidRate,
      String other,

      ) async {
    try {
      print("ddddd");

      var response = await threeApi.createthree(
         shift,
         PIV,
         CVC,
         PICC,
         site,
         fluidRate,
         other,

      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
