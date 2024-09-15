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

  static Future<String> getRoom(int id) async {
    try {
      var response = await http.get(
        Uri.parse('${ApiConstant.baseUrl}/nonSpecialists/rooms/$id'),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> getPatientByRoom(int roomId) async {
    try {
      var response = await http.get(
        Uri.parse(ApiConstant.getPatientByRoom(roomId)),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}
