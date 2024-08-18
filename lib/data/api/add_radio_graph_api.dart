import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../shared/shared network/local/cache_helper.dart';
import '../../shared/shared network/local/cache_key.dart';

class addradiographApi {
  static Future<String> createradiograph(
      String askRadiographs,
      ) async {
    try{
      var response = await http.post(
//http://localhost:3000/api/examinations/radiograph/4
      //http://localhost:3000/api/examinations/radiograph/4
        Uri.parse("http://192.168.43.74:3000/api/examinations/radiograph/5"),
        headers: {
          'Content-Type': 'application/json',
          'token':'${CacheHelper.getData(key: CacheKey.token)}'

        },
        body: jsonEncode({
          //'final': section,
          'askRadiographs':askRadiographs,


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