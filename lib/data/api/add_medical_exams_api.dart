import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/shared network/local/cache_helper.dart';
import '../../shared/shared network/local/cache_key.dart';

class addmedicalexamsApi {
  static Future<String> createaddmedicalexams(
      String askExaminations,
      ) async {
    try{
      var response = await http.post(
//${CacheHelper.getData(key: CacheKey.token)}"
        Uri.parse("http://192.168.43.74:3000/api/examinations/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "${CacheHelper.getData(key: CacheKey.token)}",

        },
        body: jsonEncode({
          //'final': section,
          'askExaminations':askExaminations,


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