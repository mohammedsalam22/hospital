import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../Models/getdeathfileModel.dart';
//http://192.168.43.74:3000/api/information/deathFile/6
class GetDeathFileApi{
  static  final String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjEsInVzZXJJRCI6MzAsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzQxNzcxMH0.hD082tBUXf7uiO8rfYeQzKVZnTRw0FK6MTfmV_gOFHY';
  static   final String baseUrl = 'http://192.168.43.74:3000/';
//http://192.168.43.74:3000/api/information/deathFile/6
  static  Future<List<DeathFileModel>> fetchGetDeathFile() async {
    print("Sending request to API...");
    final response = await http.get(
      Uri.parse('${baseUrl}api/information/deathFile/6'),
      headers: {
      //  'token': token,
        'Content-Type': 'application/json',
      },
    );
    print("Received response with status code: ${response.statusCode}");

    if (response.statusCode == 200) {

      print("donnnnnnnnnnne") ;

      // استلام البيانات من API وتحويلها إلى JSON
      final data = jsonDecode(response.body);

// الوصول إلى الـ 'deathFile' ثم إلى التفاصيل الداخلية 'deathFile' نفسها
      final deathFileData = data['deathFile']['deathFile'];

// استخراج قوائم 'mannerOfDeath' و 'deathSigns' و 'deathReasons'
      final mannerOfDeath = data['deathFile']['mannerOfDeath'] as List;
      final deathSigns = data['deathFile']['deathSigns'] as List;
      final deathReasons = data['deathFile']['deathReasons'] as List;

// تحويل البيانات المستخرجة إلى نموذج DeathFileModel
      final deathFileModel = DeathFileModel(
        deathFile: DeathFile.fromJson(deathFileData), // تحويل بيانات 'deathFile' إلى النموذج الخاص بها
        mannerOfDeath: mannerOfDeath.map((json) => MannerOfDeath.fromJson(json)).toList(), // تحويل قائمة 'mannerOfDeath' إلى قائمة من النماذج
        deathSigns: deathSigns.map((json) => DeathSigns.fromJson(json)).toList(), // تحويل قائمة 'deathSigns' إلى قائمة من النماذج
        deathReasons: deathReasons.map((json) => DeathReasons.fromJson(json)).toList(), // تحويل قائمة 'deathReasons' إلى قائمة من النماذج
      );

// إرجاع النموذج داخل قائمة
      return [deathFileModel];


    } else {
      throw Exception('Failed to load radiographs');
    }
  }
}

