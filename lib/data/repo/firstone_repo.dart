import 'dart:convert';
import '../api/firstpart_api.dart';
import '../api/summary_charge_api.dart';

class firstoneRepo {
  static Future createfirstone(
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
    try {
      print("ddddd");

      var response = await firstoneApi.createfirstone(
           RoomID,
           ptInitial,
           POA,
           code,
           HT,
           WT,
           isolation,
           admitDate,
           meds,
           RN,
           Instructor,
           accucheck,
           restraints

      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
