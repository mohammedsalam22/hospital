import 'dart:convert';

import 'package:http/http.dart' as http;

class VitalApi {

  static Future<String> createVital(
      int bodyTempreture,
       int heartRate

      ) async {
    try{
      var response = await http.post(
        Uri.parse("http://192.168.137.216:3000/api/clinical/vital/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTYsInVzZXJJRCI6MjIsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMjcxNzg1OH0.CjpNMjA83zTEOnxbi9KFTehwSpcxNG4aLFWP041lWm0",
          'Content-Type': 'application/json; charset=UTF-8',

        },
        body: jsonEncode({
          //'final': section,
          'bodyTempreture':bodyTempreture,
          'heartRate':heartRate,


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