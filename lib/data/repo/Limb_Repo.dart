import 'dart:convert';
import '../api/Limb_api.dart';

class LimbRepo {
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
      var response = await LimbApi.createLimb(
          inguinalLymphadenopathyPalpation:inguinalLymphadenopathyPalpation,
          venousLegUlcers:venousLegUlcers,
           oedemaAssessment:oedemaAssessment,
          palmarErythema:palmarErythema,
          purpura:purpura,
          acrocyanosis:acrocyanosis,
           myatrophy:myatrophy,
           neurological:neurological,
           xanthonychia:xanthonychia,
          leukonychia:leukonychia,
          punctateLeukonychia:punctateLeukonychia,
          capillaryDilation:capillaryDilation,
           periorbitalCyanosis:periorbitalCyanosis,
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
