// radiograph_repo.dart
import 'package:waseem/data/api/getPAtientExam_api.dart';
import '../../Models/getPatientExamModel.dart';

class getpatientExamRepo {
  late final getPAtientExamApi getPatientExamApi;
//constructre
  getpatientExamRepo(this.getPatientExamApi);

  Future<List<Examinations>> getpatientexam() async {
    return await getPAtientExamApi.fetchgetPAtientExam();
  }
}
