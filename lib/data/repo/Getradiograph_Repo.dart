// radiograph_repo.dart
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getradiographModel.dart';
import '../api/GetRadiograph_api.dart';
import '../api/getPatientRadio_api.dart';

class GetRadiographRepo {
  final GetradiographApi getradiographApi;

  GetRadiographRepo(this.getradiographApi);

  Future<List<Radiograph>> getRadiographs() async {
    return await GetradiographApi.fetchRadiograph();
  }
}
