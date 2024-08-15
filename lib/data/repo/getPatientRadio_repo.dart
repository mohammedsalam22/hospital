// radiograph_repo.dart
import '../../Models/getPatientRadioModel.dart';
import '../api/getPatientRadio_api.dart';

class RadiographRepo {
  final GetpatientradioApi radiographApi;

  RadiographRepo(this.radiographApi);

  Future<List<GetPatientRadio>> getRadiographs() async {
    return await GetpatientradioApi.fetchRadiographs();
  }
}
