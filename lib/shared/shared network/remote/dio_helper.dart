
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.43.74:3000/api/',
        receiveDataWhenStatusError: true,
        validateStatus: (status) {
          return status! == 200 || status == 400;
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'Authorization': "Bearer $token",
    };
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklEIjo1LCJ0eXBlIjoib2JqZWN0Iiwic3BlY2lhbGlzdCI6ImdlbmVyYWwiLCJpYXQiOjE3MjI2MDQ4ODF9.XVN3YD9TrPXd43tkig7oAogtQo3ckR7iQmPwgtVeZ0c",
    };
    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      // 'lang': lang,
      'Authorization': "Bearer $token",
    };
    return dio!.put(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

