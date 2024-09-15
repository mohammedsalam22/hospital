
import 'package:http/http.dart 'as http;
import 'package:waseem/shared/shared%20network/remote/api_constant.dart';
class Patient_View_Api{


  static Future ViewPatientIn()async{
    try{
      var response=await http.get(
        Uri.parse("${ApiConstant.baseUrl}/patient/get_checkinPatient"),
        headers: {
          'Content-Type': 'application/json',
        }
      );
      if(response.statusCode==200){
        return response.body;
      }

    }catch(e){rethrow;
    }
  }

}