import 'dart:convert';

import '../api/death_file_api.dart';


class DeathFileRepo {
  static Future createDeathFile(
      String iden,
      String temp,
      String dLo,
      String dDa,
      String dHo ,
      String docName ,
      String fileDate ,
      String dSeen ,
      String lastMinute ,
      String lastDay ,
      String lastYear ,
      String reason ,
      bool anatomy ,
      bool autopsy ,
      bool normal ,
      bool notSpec ,
      bool nonNormal ,
      String liver1,
      String liver2,
      String liver3,
      bool liver4,
      String rigor,
      String dehyr,
      String lateSigns,
      ) async {
    try {
      print("ddddd") ;
      var response = await DeathFileApi.createDeathFile(iden, temp, dLo, dDa, dHo, docName, fileDate, dSeen, lastMinute, lastDay, lastYear, reason, anatomy, autopsy, normal, notSpec, nonNormal, liver1, liver2, liver3, liver4, rigor, dehyr, lateSigns) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

}
