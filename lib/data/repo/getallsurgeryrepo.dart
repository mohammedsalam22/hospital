import 'dart:convert';

import '../api/get_all_surgery_api.dart';

class GetAllSurgeryRepo {
  static Future getAllSurgery() async {
    try {
      var response = await GetAllSurgeryApi.getAllSurgery();
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }}