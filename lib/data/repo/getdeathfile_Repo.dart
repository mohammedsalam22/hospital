// radiograph_repo.dart
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getdeathfileModel.dart';
import '../api/getPatientRadio_api.dart';
import '../api/getdeathFile_api.dart';

class FetRadioGraphRepo {
  late final GetDeathFileApi getdeathfileapi;

  FetRadioGraphRepo(this.getdeathfileapi);

  Future<List<DeathFileModel>> getdeathfile() async {
    return await GetDeathFileApi.fetchGetDeathFile();
  }
}
