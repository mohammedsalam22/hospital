import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

import '../../shared/shared network/local/cache_helper.dart';
import '../../shared/shared network/local/cache_key.dart';

/*
static Future createDeathFile (int id) async {
try {
print("ssssssssssss") ;
var response = await http.post(
Uri.parse('${http://192.168.43.74:3000/api/information/deathFile/}'$id) ,
*/

class DeathFileApi {
  static Future createDeathFile(
    String iden,
    String temp,
    String dLo,
    String dDa,
    String dHo,
    String docName,
    String fileDate,
    String dSeen,
    String lastMinute,
    String lastDay,
    String lastYear,
    String reason,
    bool anatomy,
    bool autopsy,
    bool normal,
    bool notSpec,
    bool nonNormal,
    String liver1,
    String liver2,
    String liver3,
    bool liver4,
    String rigor,
    String dehyr,
    String lateSigns,
  ) async {
    try {
      print("ssssssssssss");
      var response = await http.post(
        Uri.parse(
            "${ApiConstant.baseUrl}/information/deathFile/${PatientId.patientID}"),
        headers: {
          'Content-Type': 'application/json',
          'token': "${CacheHelper.getData(key: CacheKey.token)}",
        },
        body: json.encode({
          "deathFile": {
            "identityStatus": iden,
            "temperature": temp,
            "deathLocation": dLo,
            "deathDate": dDa,
            "deathHour": dHo,
            "doctorName": docName,
            "fileDate": fileDate,
            "deathSeen": dSeen
          },
          "deathReason": [
            {
              "lastMinute": lastMinute,
              "lastDay": lastDay,
              "lastYear": lastYear,
              "reasonLastHour": reason,
              "anatomy": anatomy,
              "autopsy": autopsy
            }
          ],
          "mannerOfDeath": {
            "normal": normal,
            "notSpecified": notSpec,
            "nonNormal": nonNormal
          },
          "deathSigns": {
            "liverMortiseLocation": liver1,
            "liverMortiseImprove": liver2,
            "liverMortiseColor": liver3,
            "liverMortiseRemoved": liver4,
            "rigorMortiseLocation": rigor,
            "dehydration": dehyr,
            "lateSigns": lateSigns
          }
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        print("donnnnnnnnnnne");
        return response.body;
      } else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow;
    }
  }
}
