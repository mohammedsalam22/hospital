import 'package:http/http.dart'as http;
import 'package:waseem/component/patient_id.dart';
import 'package:waseem/component/token.dart';
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';
class GetAllSurgeryApi {
  static Future getAllSurgery () async {
    try {
      var response = await http.get(
        Uri.parse("${ApiConstant.baseUrl}/surgeryFile/getAllsurgery/${PatientId.patientID}"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token':Token.token
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }}