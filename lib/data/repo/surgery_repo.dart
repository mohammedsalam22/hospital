
import 'dart:convert';

import '../api/surgery_api.dart';

class SurgeryRepo {
  static Future postSurgery( String injuryType,
      String ASA ,
      String surgerySituation,
      String surgeryDuration,
      bool antipathetic,
      String surgeonName,
      String helperSurgeonName,
      String nurseName,
      String surgeryName,
      String helperNurse,
      int surgeonRoomNumber,
      var antipatheticStartDate,
      var antipatheticStopDate, ) async {
    try {
      print('lljlklk') ;
      var response = await SurgeryApi.postSurgery(injuryType, ASA, surgerySituation, surgeryDuration, antipathetic, surgeonName, helperSurgeonName, nurseName, surgeryName, helperNurse, surgeonRoomNumber, antipatheticStartDate, antipatheticStopDate) ;
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }}