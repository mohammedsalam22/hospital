/*
import 'dart:convert';

import '../api/summary_charge_api.dart';

class SummaryChargeRepo {
  static Future createsummaryCharge(

      ) async {


    try {
      print("ddddd") ;

      var response = await SummaryChargeApi.createSummaryCharge();
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

}*/
import 'dart:convert';
import '../api/summary_charge_api.dart';

class SummaryChargeRepo {
  static Future createsummaryCharge(
      String specialistDoctor,
      String inChargeDoctor,
      String finall,
      String entryReason,
      String summaryStory,
      String finalSituation,
      String guidelines,

      ) async {
    try {
      print("ddddd");

      var response = await SummaryChargeApi.createSummaryCharge(
          specialistDoctor,
          inChargeDoctor, // Add this line
          finall,
          entryReason,
          summaryStory,
          finalSituation,
          guidelines// A

      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
