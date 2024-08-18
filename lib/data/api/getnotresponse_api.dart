import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/getnotresponseModel.dart';

class GetnotresponseApi {
  static final String baseUrl = 'http://192.168.43.74:3000/';

  static Future<Getnotresponse> fetchgetnotresponse() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${baseUrl}api/screeningTest'),
      headers: {
        'Content-Type': 'application/json',
        'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwidXNlcklEIjo1LCJ0eXBlIjoib2JqZWN0Iiwic3BlY2lhbGlzdCI6ImdlbmVyYWwiLCJpYXQiOjE3MjIwMDI0MzF9.9l0iM-1pza3Ko_LRQPPxdeY9g0UN4n8jcHuTo3ixDzI",
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      print("Request successful");

      final data = jsonDecode(response.body);

      // تحويل البيانات إلى كائن Getnotresponse
      return Getnotresponse.fromJson(data);
    } else {
      throw Exception('Failed to load tests');
    }
  }
}
