import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:waseem/Models/params/companions_complents_params.dart';
import 'package:waseem/Models/params/details_complaint_params.dart';
import 'package:waseem/Models/params/other_system_params.dart';
import 'package:waseem/Models/params/patient_history_params.dart';
import 'package:waseem/shared/shared%20network/local/cache_helper.dart';
import 'package:waseem/shared/shared%20network/local/cache_key.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class ClinicalFormApi {
  static Future getAllClinicalForm(int patientId) async {
    try {
      var response = await http.get(
        Uri.parse(ApiConstant.getAllClinicalForm(patientId)),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
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

  static Future getclinicalForm(int formId, int patientId) async {
    try {
      var response = await http.get(
        Uri.parse(ApiConstant.getclinicalForm(formId, patientId)),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
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

  static Future<String> addPatientHistory(
      PatientHistoryParams p, int patientId, bool isEdit) async {
    try {
      final token = CacheHelper.getData(key: CacheKey.token);
      var response;
      if (isEdit) {
        response = await http.put(
          Uri.parse(ApiConstant.addPatientHistory(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson()),
        );
      } else {
        response = await http.post(
          Uri.parse(ApiConstant.addPatientHistory(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson()),
        );
      }

      print(response.statusCode);
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

  static Future addcomplent(
      DetailsComplaintParams p, int patientId, bool isEdit) async {
    try {
      final token = CacheHelper.getData(key: CacheKey.token);
      var response;
      if (isEdit) {
        response = await http.put(
          Uri.parse(ApiConstant.editaddcomplent(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson()),
        );
      } else {
        response = await http.post(
          Uri.parse(ApiConstant.addcomplent(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson()),
        );
      }

      print(response.statusCode);
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

  static Future companionsComplents(
      CompanionsComplentsParams p, int patientId, bool isEdit) async {
    try {
      final token = CacheHelper.getData(key: CacheKey.token);
      var response;
      if (isEdit) {
        response = await http.post(
          Uri.parse(ApiConstant.editcompanionsComplents(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson()),
        );
      } else {
        response = await http.post(
          Uri.parse(ApiConstant.companionsComplents(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson()),
        );
      }
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

  static Future addOtherSystem(
      OtherSystemParams p, int patientId, bool isEdit) async {
    try {
      final token = CacheHelper.getData(key: CacheKey.token);
      var response;
      if (isEdit) {
        response = await http.put(
          Uri.parse(ApiConstant.editOtherSystem(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson(isEdit)),
        );
      } else {
        response = await http.post(
          Uri.parse(ApiConstant.addOtherSystem(patientId)),
          headers: {
            'Content-Type': 'application/json',
            'token': token,
          },
          body: json.encode(p.toJson(isEdit)),
        );
      }

      print(p.toJson(isEdit));
      print(response.statusCode);
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
