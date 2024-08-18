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
import '../api/Vital_api.dart';
import '../api/summary_charge_api.dart';

class VitlaRepo {
  static Future createVital(
      int bodyTemperature,
      int heartRate

      ) async {
    try {
      print("ddddd");

      var response = await VitalApi.createVital(

          bodyTemperature,
          heartRate


      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
