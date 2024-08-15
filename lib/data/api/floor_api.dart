import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class FloorApi {
  static Future<String> getFloor() async {
    try {
      var response = await http.get(
        Uri.parse(ApiConstant.rooms),
        headers: {
          'Content-Type': 'application/json',
        },
      );
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
