import 'dart:convert';

import '../api/death_file_api.dart';


class DeathFileRepo {
  static Future createDeathFile() async {
    try {
      print("ddddd") ;
      var response = await DeathFileApi.createDeathFile() ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

}
