import 'package:http/http.dart' as http;

import '../../component/token.dart';
import '../../shared/shared network/remote/api_constant.dart';

class CheckApi {
  static Future checkIn(int id , int patientId) async {
    try {
      var response = await http.post(
        Uri.parse("${ApiConstant.baseUrl}/intensiveCare/$patientId/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future checkOut(int id) async {
    try {
      var response = await http.post(
        Uri.parse("${ApiConstant.baseUrl}/intensiveCare/IntensiveCarecheckout/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future consults () async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}/consults"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

}