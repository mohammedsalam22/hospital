import 'dart:convert';
import '../api/ScreeingTest_api.dart';
import '../api/postaddresult_api.dart';
import '../api/summary_charge_api.dart';

class postAddresultRepo {
  static Future createpostAddresult(
      String result,


      ) async {
    try {
      print("ddddd");

      var response = await postAddresultApi.createpostAddresult(

          result
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }}