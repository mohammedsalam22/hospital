import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getradiographModel.dart';
import '../../Models/getsummarychagemodel.dart';

class GetradiographApi {
  //http://localhost:3000/api/information/summaryCharge/1
  static final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsInVzZXJJRCI6MzAsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzMxNzU4NH0.ZFJr4q0D_mxsWxgcyDRNvhybVhomP35SQTo-xkb9h48';
  static final String baseUrl = 'http://192.168.43.74:3000/';

  static Future<List<Radiograph>> fetchRadiograph() async {
    final response = await http.get(
      Uri.parse('${baseUrl}api/examinations/radiograph'),
      headers: {
        'token': token,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      if (data['Examinations'] != null) {
        final getRadiograph = (data['Examinations'] as List)
            .map((json) => Radiograph.fromJson(json))
            .toList();
        return getRadiograph;
      } else {
        return []; // إذا لم يكن هناك بيانات
      }
    } else {
      throw Exception('Failed to load Radiographs');
    }
  }
}