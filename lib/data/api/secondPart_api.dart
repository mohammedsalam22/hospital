import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/id.dart';
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class secondApi {

  static Future<String> createsecond(
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
    try{
      var response = await http.post(
        Uri.parse("${ApiConstant.baseUrl}/intensiveCare/Intensive_Care_constants/${Id.id2}"),
        headers: {
          'Content-Type': 'application/json',
          'token': Token.token,

        },
        body: jsonEncode({
          //'final': section,
          //  'specialistDoctor':specialistDoctor,
          'currentProblem': currentProblem,
          'allergies': allergies,
          'activity': activity,
          'neuro': neuro,
          'diet': diet,
          'resp': resp,
          'GL': GL,
          'skin': skin,
          'cardiac': cardiac,
          'pain': pain,
          'M_S': M_S,
          'RUE': RUE,
          'RLE': RLE,
          'LUE': LUE,
          'LLE': LLE,
          'GU': GU,
          'voidStatus': voidStatus,
          'lastBM': lastBM,
          'medicalHistory': medicalHistory,
          'recentProcedure': recentProcedure,
          'IONote': IONote,
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