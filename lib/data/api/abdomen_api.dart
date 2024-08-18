import 'dart:convert';
import 'package:http/http.dart' as http;

class abdomenapi {
  static Future createabdomen({
    required String? macBrownie,
    required String? murphy,
    required bool rooftopping,
    required String? milia,
    required String? myoclonus,
    required String? distendedAbdomen,
    required bool Umbilical_Fold_Disappearance,
    required String? abdominalRespiration,
    required bool hernia,
    required bool sideRounded,
    required String? surgicalScar,
    required String? rashes,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.43.74:3000/api/clinical/abdomen/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMsInVzZXJJRCI6MzMsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzgzMjYxNX0.yZNeEemXlXfMMMI70p3T4B9itIQVBtzf40azRegNQOE",
        },
        body: json.encode({
          "Palpation" : {
            "macBrownie" : macBrownie ,
            "murphy" : murphy ,
            "rooftopping" : rooftopping ,
            "milia" : milia ,
            "myoclonus" : myoclonus
          } ,
          "VisualAbdomen" : {
            "distendedAbdomen" : distendedAbdomen ,
            "Umbilical_Fold_Disappearance" : Umbilical_Fold_Disappearance ,
            "abdominalRespiration" : abdominalRespiration ,
            "hernia" : hernia ,
            "sideRounded" : sideRounded ,
            "rashes" : rashes ,
            "surgicalScar" : surgicalScar
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
