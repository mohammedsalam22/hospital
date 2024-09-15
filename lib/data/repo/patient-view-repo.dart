import 'dart:convert';

import '../api/patient-view-api.dart';


class Patient_View_Repo{

  static Future ViewPatientIn()async{
    try{
      var response=await Patient_View_Api.ViewPatientIn();
      return jsonDecode(response);

    } catch(e){rethrow;}
  }

}