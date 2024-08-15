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
import '../api/add_radio_graph_api.dart';


class addradiographRepo {
  static Future createaddradiograph(

      String askRadiographs,

      ) async {
    try {
      print("ddddd");

      var response = await addradiographApi.createradiograph(
        askRadiographs,


      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
