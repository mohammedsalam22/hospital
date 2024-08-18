// radiograph_repo.dart
import '../../Models/GetPatientTest Model.dart';
import '../../Models/getPatientRadioModel.dart';
import '../api/getPatientRadio_api.dart';
import '../api/getPatientTest_api.dart';

class patientTestRepo {
  final GetpatientTestApi getpatientTestApi;

  patientTestRepo(this.getpatientTestApi);

  Future<List<GetPatientTest>> getpatientTest() async {
    return await GetpatientTestApi.fetchGetpatientTest();
  }
}
