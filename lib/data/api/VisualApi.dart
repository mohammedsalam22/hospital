import 'dart:convert';
import 'package:http/http.dart' as http;

class VisualApi {
  static Future<String> createVisual(
      bool goodCondition,
      bool? cachecticPatient,
      String conscience,
      int gcs,
      ) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.137.216:3000/api/clinical/visual/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsInVzZXJJRCI6MzAsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzY3OTA3NH0.KsYGF5n-wYX2D0jtuZJdNG0J3tTF5h2xhKmlL9Pj538",
        },
        body: jsonEncode({
          'goodCondition': goodCondition,
          'cachecticPatient': cachecticPatient,
          'conscience': conscience,
          'gcs': gcs,
        }),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}
