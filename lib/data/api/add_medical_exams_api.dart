import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

import '../../shared/shared network/local/cache_helper.dart';
import '../../shared/shared network/local/cache_key.dart';

class addmedicalexamsApi {
  static Future<String> createaddmedicalexams(
    String askExaminations,
  ) async {
    try {
      var response = await http.post(
//${CacheHelper.getData(key: CacheKey.token)}"
        Uri.parse("${ApiConstant.baseUrl}/examinations/${PatientId.patientID}"),
        headers: {
          'Content-Type': 'application/json',
          'token': "${CacheHelper.getData(key: CacheKey.token)}",
        },
        body: jsonEncode({
          //'final': section,
          'askExaminations': askExaminations,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print("donnnnnnnnnnne");
        return response.body;
      } else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> createConsult(
      String askExaminations,
      ) async {
    try {
      var response = await http.post(
//${CacheHelper.getData(key: CacheKey.token)}"
        Uri.parse("${ApiConstant.baseUrl}/consults/${PatientId.patientID}"),
        headers: {
          'Content-Type': 'application/json',
          'token': "${CacheHelper.getData(key: CacheKey.token)}",
        },
        body: jsonEncode({
          //'final': section,
          'consults': askExaminations,
        }),
      );

      print(response.body);
      if (response.statusCode == 200) {
        print("donnnnnnnnnnne");
        return response.body;
      } else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}
