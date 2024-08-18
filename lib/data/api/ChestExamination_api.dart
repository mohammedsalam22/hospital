import 'dart:convert';
import 'package:http/http.dart' as http;

class ChestExaminationApi {
  static Future createChestExamination({
    required String? Compressions,
    required String? respiratorySounds,
    required bool sideRounded,
    required bool gynecomastia,
    required bool orange_skinnedBreast,
    required bool spiderVeins,
    required bool barrelChest,
    required bool sternalPit,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.43.74:3000/api/clinical/chest/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMsInVzZXJJRCI6MzMsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzgzMjYxNX0.yZNeEemXlXfMMMI70p3T4B9itIQVBtzf40azRegNQOE",
        },
        body: json.encode({
          "Compressions" : Compressions ,
          "respiratorySounds" : respiratorySounds ,
          "visualExamination" : {
            "sideRounded" : sideRounded ,
            "gynecomastia" : gynecomastia ,
            "orange_skinnedBreast" : orange_skinnedBreast ,
            "spiderVeins" : spiderVeins ,
            "barrelChest" : barrelChest ,
            "sternalPit" : sternalPit
          }
        }),
      );
      if (response.statusCode == 200) {
        print("ppooooooooooooo");
        return response.body;
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}
