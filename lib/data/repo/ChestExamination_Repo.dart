import 'dart:convert';

import '../api/ChestExamination_api.dart';
import '../api/head_api.dart';

class ChestexaminationRepo {
  static Future createChestexamination({
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
      var response = await ChestExaminationApi.createChestExamination(
        Compressions: Compressions,
          respiratorySounds :respiratorySounds,
          sideRounded:sideRounded,
          gynecomastia:gynecomastia,
          orange_skinnedBreast:orange_skinnedBreast,
          spiderVeins:spiderVeins,
          barrelChest:barrelChest,
          sternalPit:sternalPit,
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
