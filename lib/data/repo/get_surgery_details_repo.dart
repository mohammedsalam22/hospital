import 'dart:convert';
import '../api/get_surgery_details_api.dart';

class GetSurgeryDetailsRepo {
  static Future getSurgeryDetails(int id) async {
    try {
      var response = await GetSurgeryDetailsApi.getSurgeryDetails(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }}