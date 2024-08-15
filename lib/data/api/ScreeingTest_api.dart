import 'dart:convert';

import 'package:http/http.dart' as http;

class ScreeingTestApi {

  static Future<String> createSceeingTest(
      String askTest,


      ) async {
    try{
      var response = await http.post(
        Uri.parse("http://192.168.43.74:3000/api/screeningTest/patient/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsInVzZXJJRCI6MjIsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMjcxNzg1OH0.CjpNMjA83zTEOnxbi9KFTehwSpcxNG4aLFWP041lWm0",

        },
        body: jsonEncode({
          //'final': section,
          'askTest':askTest,


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