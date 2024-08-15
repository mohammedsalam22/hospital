import 'dart:convert';

import 'package:http/http.dart' as http;

class addmedicalexamsApi {
  static Future<String> createaddmedicalexams(
      String askExaminations,
      ) async {
    try{
      var response = await http.post(

        Uri.parse("http://192.168.43.74:3000/api/examinations/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': ".eyJpZCI6MywidXNlcklEIjo2LCJ0eXBlIjoib2JqZWN0Iiwic3BlY2lhbGlzdCI6ImdlbmVyYWwiLCJpYXQiOjE3MjIzMzY1MzZ9.RqjzVpZhPDafrY6vUOlEV2AUMGMUoqjYctAx0ThBxF8",

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