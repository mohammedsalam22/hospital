/*
import 'dart:convert';

import 'package:waseem/data/api/login_api.dart';

class LoginRepo {
  static Future login({
    required String password,
    required String type,
    int? specialist,
  }) async {
    try {
      print("ddddd");
      var response = await LoginApi.login(
        password: password,
        type: type,
        specialist: specialist,
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }

  static Future getSpeciality() async {
    try {
      print("ddddd");
      var response = await LoginApi.getSpeciality();
      final d = jsonDecode(response);
      return d['specialists'];
    } catch (e) {
      rethrow;
    }
  }
}
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

import '../api/login_api.dart';

class LoginRepo {
  static Future login({
    required String password,
    required String type,
    int? specialist,
  }) async {
    try {
      // طباعة القيم التي سيتم إرسالها
      print("LoginRepo login parameters:");
      print("Password: $password");
      print("Type: $type");
      print("Specialist: $specialist");

      var response = await LoginApi.login(
        password: password,
        type: type,
        specialist: specialist,
      );

      // طباعة الاستجابة المستلمة
      print("LoginRepo response:");
      print(response);

      return jsonDecode(response);
    } catch (e) {
      print("LoginRepo error: $e");
      rethrow;
    }
  }

  static Future getSpeciality() async {
    try {
      var response = await LoginApi.getSpeciality();

      // طباعة الاستجابة المستلمة
      print("LoginRepo getSpeciality response:");
      print(response);

      final d = jsonDecode(response);
      return d['specialists'];
    } catch (e) {
      print("LoginRepo error: $e");
      rethrow;
    }
  }
}
