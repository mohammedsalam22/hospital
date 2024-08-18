import 'dart:convert';

import '../api/abdomen_api.dart';
import '../api/head_api.dart';

class abdomenRepo {
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
      var response = await abdomenapi.createabdomen(

          macBrownie :macBrownie,
          murphy:murphy,
          rooftopping:rooftopping,
          milia:milia,
          myoclonus:myoclonus,
          distendedAbdomen:distendedAbdomen,
          Umbilical_Fold_Disappearance:Umbilical_Fold_Disappearance,
          abdominalRespiration:abdominalRespiration,
          hernia:hernia,
          sideRounded:sideRounded,
          surgicalScar:surgicalScar,
          rashes:rashes,

      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
