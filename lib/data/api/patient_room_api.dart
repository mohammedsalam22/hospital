import 'package:http/http.dart' as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';

class PatientRoomApi {
  static Future getPatient(int roomId) async {
    var response = await http.get(
      Uri.parse('${ApiConstant.base}/api/patient/getPatientByRoom/$roomId') ,
      headers: {
        'Content-Type': 'application/json',
      }
    ) ;
      print(response.body) ;
    if (response.statusCode == 200) {
      print('jh') ;
      return response.body ;
    }
  }

  static Future getclinicalForm() async {
    var response = await http.get(
      Uri.parse('${ApiConstant.base}/api/intensiveCare/${PatientId.patientID}') ,
      headers: {
        'Content-Type': 'application/json',
        'token' : Token.token
      }
    ) ;
      print(response.body) ;
    if (response.statusCode == 200) {
      print('jh') ;
      return response.body ;
    }
  }
}