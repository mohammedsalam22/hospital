/*
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class LoginApi {
  static Future<String> login({
    required String password,
    required String type,
    int? specialist,
  }) async {
    try {
      Map<String, dynamic> body = {
        "password": password,
        "type": type,
      };
      if (specialist != null) {
        body.addEntries({"specialist": specialist}.entries);
      }
      var response = await http.post(
        Uri.parse(ApiConstant.login),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
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

  static Future<String> getSpeciality() async {
    try {
      var response = await http.get(
        Uri.parse(ApiConstant.specialists),
        headers: {
          'Content-Type': 'application/json',
        },
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
*/
/*
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class LoginApi {
  /// يقوم بإرسال طلب تسجيل الدخول إلى الخادم.
  /// [password] كلمة المرور.
  /// [type] نوع المستخدم (مثل: دكتور، ممرض).
  /// [specialist] (اختياري) معرّف التخصص إذا كان موجوداً.
  static Future<String> login({
    required String password,
    required String type,
    int? specialist,
  }) async {
    try {
      // إعداد البيانات لإرسالها في الطلب
      Map<String, dynamic> body = {
        "password": password,
        "type": type,
      };

      // إضافة معرّف التخصص إذا كان موجوداً
      if (specialist != null) {
        body['specialist'] = specialist;
      }

      // إرسال الطلب POST
      var response = await http.post(
        Uri.parse(ApiConstant.login),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body), // ترميز البيانات إلى JSON
      );

      // التحقق من حالة الاستجابة
      if (response.statusCode != 200) {
        print("Error: ${response.body}");
        throw Exception('An Error Occurred');
      }
      else {
        print("Error: ${response.body}");
        throw Exception('An Error Occurred: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception: $e");
      rethrow;
    }
  }

  /// يقوم بإرسال طلب للحصول على التخصصات.
  static Future<String> getSpeciality() async {
    try {
      // إرسال الطلب GET
      var response = await http.get(
        Uri.parse(ApiConstant.specialists),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      // التحقق من حالة الاستجابة
      if (response.statusCode == 200) {
        print("Specialities fetched successfully: ${response.body}");
        return response.body;
      } else {
        print("Error: ${response.body}");
        throw Exception('An Error Occurred: ${response.statusCode}');
      }
    } catch (e) {
      print("Exception: $e");
      rethrow;
    }
  }
}
*/
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class LoginApi {
  static Future<String> login({
    required String password,
    required String type,
    int? specialist,
  }) async {
    try {
      Map<String, dynamic> body = {
        "password": password,
        "type": type,
      };
      if (specialist != null) {
        body["specialist"] = specialist ?? 0;
      }

      print('Sending request with body: ${json.encode(body)}');
      var response = await http.post(
        Uri.parse(ApiConstant.login),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(body),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        print("Response received successfully");
        return response.body;
      } else {
        // Print error details if available
        var errorResponse = json.decode(response.body);
        print('Error message from server: ${errorResponse["message"]}');
        throw Exception('An Error Occurred: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }

  static Future<String> getSpeciality() async {
    try {
      var response = await http.get(
        Uri.parse(ApiConstant.specialists),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        print("Response received successfully");
        return response.body;
      } else {
        throw Exception('An Error Occurred: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      rethrow;
    }
  }
}

