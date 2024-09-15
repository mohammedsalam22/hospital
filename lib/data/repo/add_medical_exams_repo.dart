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
import '../api/add_medical_exams_api.dart';
import '../api/summary_charge_api.dart';

class addmedicalexamsRepo {
  static Future createaddmedicalexams(
    String askExaminations,
  ) async {
    try {
      print("ddddd");

      var response = await addmedicalexamsApi.createaddmedicalexams(
        askExaminations,
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future createConsult(
      String askExaminations,
      ) async {
    try {
      print("ddddd");

      var response = await addmedicalexamsApi.createConsult(
        askExaminations,
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
