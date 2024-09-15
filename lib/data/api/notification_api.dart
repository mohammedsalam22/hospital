import 'package:http/http.dart' as http;

import '../../component/token.dart';
import '../../shared/shared network/local/cache_helper.dart';
import '../../shared/shared network/local/cache_key.dart';
import '../../shared/shared network/remote/api_constant.dart';

class NotificationApi {
  static Future getPatient() async {
    var response = await http.get(
        Uri.parse('${ApiConstant.base}/api/notification/not') ,
        headers: {
          'Content-Type': 'application/json',
          'token': Token.token,
        }
    ) ;
    print(response.body) ;
    if (response.statusCode == 200) {
      print('jh') ;
      return response.body ;
    }
  }
}