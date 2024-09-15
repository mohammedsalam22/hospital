import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/id.dart';
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class finalApi {

  static Future<String> createfinal(
      int HR,
      int BP,
      int Rr,
      int Temp,
      int SPO2,
      String other,

      ) async {
    try{
      var response = await http.post(
        Uri.parse("${ApiConstant.baseUrl}/intensiveCare/Intensive_Care_vitals/${Id.id2}"),
        headers: {
          'Content-Type': 'application/json',
          'token': Token.token,

        },
        body: jsonEncode({
          //'final': section,
          //  'specialistDoctor':specialistDoctor,
           'HR':HR,
           'BP':BP,
           'Rr':Rr,
           'Temp':Temp,
           'SPO2':SPO2,
           'other':other,

        }),
      );

      print(response.body) ;
      if (response.statusCode == 200) {
        print("donnnnnnnnnnne") ;
        return response.body ;
      }else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow ;

    }
  }
}