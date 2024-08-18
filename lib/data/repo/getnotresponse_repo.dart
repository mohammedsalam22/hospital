// radiograph_repo.dart
import '../../Models/GetPatientTest Model.dart';
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getnotresponseModel.dart';
import '../api/getPatientRadio_api.dart';
import '../api/getPatientTest_api.dart';
import '../api/getnotresponse_api.dart';

class getnotresponseRepo {
  final GetnotresponseApi getgetnotresponseApi;

  getnotresponseRepo(this.getgetnotresponseApi);

  Future<Getnotresponse> getgetnotresponse() async {
    return await GetnotresponseApi.fetchgetnotresponse();
  }
}
