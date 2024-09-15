import 'dart:convert';

import 'package:waseem/data/api/notification_api.dart';

class NotificationRepo {
  static Future notification() async {
    try {
      var response = await NotificationApi.getPatient() ;
      return jsonDecode(response)['notification'] ;
    } catch (e) {
      rethrow ;
    }
  }
}