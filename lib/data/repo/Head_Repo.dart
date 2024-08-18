import 'dart:convert';

import '../api/head_api.dart';

class HeadRepo {
  static Future createHead({
    required String? skinColor,
    required String? skinNatural,
    required String? skinOther,
    required String? skinHair,
    required bool eyesPallor,
    required bool eyesJaundice,
    required bool eyesNystagmus,
    required bool eyesEnophthalmos,
    required bool eyesExophthalmos,
    required bool mouthAtrophicGlossitis,
    required bool mouthMacroglossia,
    required String mouthColor,
    required bool mouthToothDecay,
    required bool mouthMacrogingivae,
    required bool mouthGingivalBleeding,
    required bool mouthUlcers,
  }) async {
    try {
      var response = await HeadApi.createHead(
        skinColor: skinColor,
        skinNatural: skinNatural,
        skinOther: skinOther,
        skinHair: skinHair,
        eyesPallor: eyesPallor,
        eyesJaundice: eyesJaundice,
        eyesNystagmus: eyesNystagmus,
        eyesEnophthalmos: eyesEnophthalmos,
        eyesExophthalmos: eyesExophthalmos,
        mouthAtrophicGlossitis: mouthAtrophicGlossitis,
        mouthMacroglossia: mouthMacroglossia,
        mouthColor: mouthColor,
        mouthToothDecay: mouthToothDecay,
        mouthMacrogingivae: mouthMacrogingivae,
        mouthGingivalBleeding: mouthGingivalBleeding,
        mouthUlcers: mouthUlcers,
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
