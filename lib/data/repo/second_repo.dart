import 'dart:convert';
import '../api/firstpart_api.dart';
import '../api/secondPart_api.dart';
import '../api/summary_charge_api.dart';

class secondRepo {
  static Future createsecond(
      String currentProblem,
      String allergies,
      String activity,
      String neuro,
      String diet,
      String resp,
      String GL,
      String skin,
      String cardiac,
      String pain,
      String M_S,
      String RUE,
      String RLE,
      String LUE,
      String LLE,
      String GU,
      String voidStatus,
      String lastBM,
      String medicalHistory,
      String recentProcedure,
      String IONote,
      String other,

      ) async {
    try {
      print("ddddd");

      var response = await secondApi.createsecond(
         currentProblem,
         allergies,
         activity,
         neuro,
         diet,
         resp,
         GL,
         skin,
         cardiac,
         pain,
         M_S,
         RUE,
         RLE,
         LUE,
         LLE,
         GU,
         voidStatus,
         lastBM,
         medicalHistory,
         recentProcedure,
         IONote,
         other,

      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
