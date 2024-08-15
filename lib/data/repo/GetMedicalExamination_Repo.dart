
import '../../Models/getMedicalExamination.dart';
import '../api/getMedicalExamination_api.dart';

class GetMedicalExaminationRepo {
  late final getMedicalExaminationApi getMedicalExamination;

  GetMedicalExaminationRepo(this.getMedicalExamination);

  Future<List<Examination>> getMedicalExaminations() async {
    return await getMedicalExaminationApi.fetchgetMedicalExamination();
  }
}
