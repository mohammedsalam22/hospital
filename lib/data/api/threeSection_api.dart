import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/id.dart';
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class threeApi {

  static Future<String> createthree(
      String shift,
      int PIV,
      int CVC,
      int PICC,
      String site,
      int fluidRate,
      String other,

      ) async {
    try{
      var response = await http.post(
        Uri.parse("${ApiConstant.baseUrl}/intensiveCare/Intensive_Care_changables/${Id.id2}"),
        headers: {
          'Content-Type': 'application/json',
          'token': Token.token,

        },
        body: jsonEncode({
          'shift': shift,
          'PIV': PIV,
          'CVC': CVC,
          'PICC': PICC,
          'site': site,
          'fluidRate': fluidRate,
          'other': other,


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