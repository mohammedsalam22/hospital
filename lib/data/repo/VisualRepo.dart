import 'dart:convert';

import '../api/VisualApi.dart';

class VisualRepo {
  static Future<void> createVisual({
    required bool goodCondition,
    required bool cachecticPatient,
    required String conscience,
    required int gcs,
  }) async {
    try {
      var response = await VisualApi.createVisual(
        goodCondition,
        cachecticPatient,
        conscience,
        gcs,
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
