import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

import '../../shared/shared network/local/cache_helper.dart';
import '../../shared/shared network/local/cache_key.dart';

class addradiographApi {
  static Future<String> createradiograph(
    String askRadiographs,
  ) async {
    try {
      var response = await http.post(
        Uri.parse(
            "${ApiConstant.baseUrl}/examinations/radiograph/${PatientId.patientID}"),
        headers: {
          'Content-Type': 'application/json',
          'token': '${CacheHelper.getData(key: CacheKey.token)}'
        },
        body: jsonEncode({
          //'final': section,
          'askRadiographs': askRadiographs,
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

  static Future<String> cc(
      String askRadiographs,
      int id,
      ) async {
    try {
      var response = await http.post(
        Uri.parse(
            "${ApiConstant.baseUrl}/consults/response/${id}"),
        headers: {
          'Content-Type': 'application/json',
          'token': Token.token
        },
        body: jsonEncode({
          //'final': section,
          'response': askRadiographs,
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

  static Future<String> cc2(
      String askRadiographs,
      int id,
      ) async {
    try {
      var response = await http.post(
        Uri.parse(
            "${ApiConstant.baseUrl}/screeningTest/result/$id"),
        headers: {
          'Content-Type': 'application/json',
          'token': Token.token
        },
        body: jsonEncode({
          //'final': section,
          'result': askRadiographs,
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
