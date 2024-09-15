import 'dart:convert';

import 'package:waseem/data/api/clinical_form_api.dart';

import '../../Models/params/companions_complents_params.dart';
import '../../Models/params/details_complaint_params.dart';
import '../../Models/params/other_system_params.dart';
import '../../Models/params/patient_history_params.dart';

class ClinicalFormRepo {
  static Future getAllClinicalForm(int patientId) async {
    try {
      print("ddddd");
      var response = await ClinicalFormApi.getAllClinicalForm(patientId);
      var decodedResponse = jsonDecode(response);
      var clinicalForms = decodedResponse['ClinicalForm'];
      for (var form in clinicalForms) {
        if (form['patientID'] == patientId) {
          return form['id'];
        }
      }
      return;
    } catch (e) {
      rethrow;
    }
  }

  static Future getclinicalForm(int formId, int patientId) async {
    try {
      print("ddddd");
      var response = await ClinicalFormApi.getclinicalForm(formId, patientId);
      var d = jsonDecode(response);
      print(d);
      return d;
    } catch (e) {
      rethrow;
    }
  }

  static Future addPatientHistory(
      PatientHistoryParams p, int patientId, bool isEdit) async {
    try {
      print("ddddd");
      var response =
          await ClinicalFormApi.addPatientHistory(p, patientId, isEdit);
      var d = jsonDecode(response);
      return;
    } catch (e) {
      rethrow;
    }
  }

  static Future addcomplent(
      DetailsComplaintParams p, int patientId, bool isEdit) async {
    try {
      print("ddddd");
      var response = await ClinicalFormApi.addcomplent(p, patientId, isEdit);
      var d = jsonDecode(response);
      return;
    } catch (e) {
      rethrow;
    }
  }

  static Future companionsComplents(
      CompanionsComplentsParams p, int patientId, bool isEdit) async {
    try {
      print("ddddd");
      var response =
          await ClinicalFormApi.companionsComplents(p, patientId, isEdit);
      var d = jsonDecode(response);
      return;
    } catch (e) {
      rethrow;
    }
  }

  static Future addOtherSystem(
      OtherSystemParams p, int patientId, bool isEdit) async {
    try {
      print("ddddd");
      var response = await ClinicalFormApi.addOtherSystem(p, patientId, isEdit);
      var d = jsonDecode(response);
      return;
    } catch (e) {
      rethrow;
    }
  }
}
