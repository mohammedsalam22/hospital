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
import '../api/ScreeingTest_api.dart';
import '../api/summary_charge_api.dart';

class ScreeingTestRepo {
  static Future createScreeingTest(
      String askTest,


      ) async {
    try {
      print("ddddd");

      var response = await ScreeingTestApi.createSceeingTest(

          askTest
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
