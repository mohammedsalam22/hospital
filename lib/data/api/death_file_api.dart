import 'dart:convert';

import 'package:http/http.dart' as http;

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
  static Future createDeathFile () async {
    try {
      print("ssssssssssss") ;
      var response = await http.post(
        Uri.parse("http://192.168.43.74:3000/api/information/deathFile/6") ,
        headers: {
          'Content-Type': 'application/json',
/*
          'token': "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MTEsInVzZXJJRCI6MTQsInR5cGUiOiJvYmplY3QiLCJzcGVjaWFsaXN0IjoiZ2VuZXJhbCIsImlhdCI6MTcyMjYzMjY5NX0.wMmdr7kqxtTZSVFJfRa6FSAcULyTN4DqyJbJVT9UjTY",
*/
          'token': "${CacheHelper.getData(key: CacheKey.token)}",

        },
        body: json.encode({
          "deathFile" : {
            "identityStatus" : "jhj" ,
            "temperature" : "hghgh" ,
            "deathLocation" : "ddd" ,
            "deathDate" : "2024-01-01" ,
            "deathHour" : "05:01" ,
            "doctorName" : "ddd" ,
            "fileDate" : "2024-01-01" ,
            "deathSeen" : "sddsdkjk"
          } ,
          "deathReason" : [
            {
              "lastMinute" : "jhjh" ,
              "lastDay" : "kjkjk" ,
              "lastYear" : "jhjhj" ,
              "reasonLastHour" : "hhghghg" ,
              "anatomy" : false ,
              "autopsy" : true
            }
          ] ,
          "mannerOfDeath" : {
            "normal" : true ,
            "notSpecified" : false ,
            "nonNormal" : false
          } ,
          "deathSigns" : {
            "liverMortiseLocation" : "hghg" ,
            "liverMortiseImprove" : "ghgghgh" ,
            "liverMortiseColor" : "gghhghg" ,
            "liverMortiseRemoved" : false ,
            "rigorMortiseLocation" : "gfgfgf" ,
            "dehydration" : "hghgjhhj" ,
            "lateSigns" : "jhjhjh"
          }
        }),
      );
      print(response.body) ;
      if (response.statusCode == 200) {
        print("donnnnnnnnnnne") ;
        return response.body ;
      }else {
        throw Exception('an Error Occurred');
      }
    } catch (e) {
      rethrow ;
    }
  }
}


