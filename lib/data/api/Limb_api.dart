import 'dart:convert';
import 'package:http/http.dart' as http;

class LimbApi{
  static Future createLimb({
    required String? inguinalLymphadenopathyPalpation,
    required bool venousLegUlcers,
    required  String? oedemaAssessment,
    required bool palmarErythema,
    required String? purpura,
    required bool acrocyanosis,
    required  String? myatrophy,
    required  String? neurological,
    required  String? xanthonychia,
    required bool leukonychia,
    required String? punctateLeukonychia,
    required bool capillaryDilation,
    required  String? periorbitalCyanosis,
  }) async {
    try {
      var response = await http.post(
        Uri.parse("http://192.168.43.74:3000/api/clinical/limb/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMsInVzZXJJRCI6MzMsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzgzMjYxNX0.yZNeEemXlXfMMMI70p3T4B9itIQVBtzf40azRegNQOE",
        },
        body: json.encode({
          "LowerLimb" : {
            "inguinal_Lymphadenopathy_Palpation" : inguinalLymphadenopathyPalpation ,
            "Venous_Leg_Ulcers" : venousLegUlcers ,
            "oedema_Assessment" : oedemaAssessment
          } ,
          "Manu" : {
            "palmarErythema" : palmarErythema ,
            "purpura" : purpura ,
            "acrocyanosis" : acrocyanosis ,
            "myatrophy" : myatrophy
          } ,
          "ArticulationUnguisv" : {
            "neurological" : neurological ,
            "xanthonychia" : xanthonychia ,
            "leukonychia" : leukonychia ,
            "punctateLeukonychia" : punctateLeukonychia ,
            "capillaryDilation" : capillaryDilation ,
            "periorbitalCyanosis" : periorbitalCyanosis
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
