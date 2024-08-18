import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/shared network/local/cache_helper.dart';
import '../../shared/shared network/local/cache_key.dart';

class postAddresultApi {

  static Future<String> createpostAddresult(
      String result,


      ) async {
    try{
      var response = await http.post(
        Uri.parse("http://192.168.43.74:3000/api/screeningTest/result/1"),
        headers: {
          'Content-Type': 'application/json',
         // 'token': "${CacheHelper.getData(key: CacheKey.token)}",
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklEIjo0LCJ0eXBlIjoiTnVyc2UiLCJpYXQiOjE3MjIwMDI2MDF9.83kVIJyprU9bXdQOXoRKCs0yf61kP6foZmWu8QV1CoY",

        },
        body: jsonEncode({
          //'final': section,
          'result':result,


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