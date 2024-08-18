import 'dart:convert';

import '../api/addNeckExam_api.dart';
import '../api/head_api.dart';
/*String carotidArtery,
    String jugularVein,
String lymphNodes,
    bool neckStiffenss,
bool pembertonsSign,

    bool thyroid_gland_testing,*/
class addNeckExamRepo {
  static Future createNeckexam(
     String carotidArtery,
     String jugularVein,
     String lymphNodes,

     bool neckStiffenss,
     bool pembertonsSign,
bool thyroid_gland_testing,
  ) async {
    try {
      var response = await addNeckExamApi.createaddNeckExam(
         carotidArtery,
         jugularVein,
         lymphNodes,
         pembertonsSign,
        neckStiffenss,
          thyroid_gland_testing
      );
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
