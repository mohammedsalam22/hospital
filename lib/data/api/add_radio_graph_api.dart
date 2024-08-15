import 'dart:convert';

import 'package:http/http.dart' as http;

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
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjAsInVzZXJJRCI6MjksInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzIxMDA4OH0.8e__JOH9Kso23aLhs2gjUPkL5_XyZ3Xve5_RoWpx6x0",

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