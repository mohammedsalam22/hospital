import 'dart:convert';
import 'package:http/http.dart' as http;

class HeadApi {
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
      var response = await http.post(
        Uri.parse("http://192.168.43.74:3000/api/clinical/head/1"),
        headers: {
          'Content-Type': 'application/json',
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MjMsInVzZXJJRCI6MzMsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMzgzMjYxNX0.yZNeEemXlXfMMMI70p3T4B9itIQVBtzf40azRegNQOE",
        },
        body: json.encode({
          "skin": {
            "color": skinColor,
            "natural": skinNatural,
            "other": skinOther,
            "hair": skinHair,
          },
          "eyes": {
            "pallor": eyesPallor,
            "jaundice": eyesJaundice,
            "Nystagmus": eyesNystagmus,
            "Enophthalmos": eyesEnophthalmos,
            "Exophthalmos": eyesExophthalmos,
          },
          "mouth": {
            "atrophicGlossitis": mouthAtrophicGlossitis,
            "macroglossia": mouthMacroglossia,
            "color": mouthColor,
            "toothDecay": mouthToothDecay,
            "Macrogingivae": mouthMacrogingivae,
            "gingivalBleeding": mouthGingivalBleeding,
            "Ulcers": mouthUlcers,
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
