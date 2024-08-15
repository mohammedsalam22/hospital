// radiograph_repo.dart
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getsummarychagemodel.dart';
import '../api/getPatientRadio_api.dart';
import '../api/getsummarychage_api.dart';


class getSummaryChargeRepo {
  final GetSummaryDischargeApi getSummaryDischargeApi;

  getSummaryChargeRepo(this.getSummaryDischargeApi);

  Future<List<SummaryDischarge>> getSummaryCharge() async {
    return await GetSummaryDischargeApi.fetchSummary();
  }
}
