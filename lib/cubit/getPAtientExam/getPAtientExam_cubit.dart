import 'package:bloc/bloc.dart';
import 'package:waseem/Models/getMedicalExamination.dart';

import '../../Models/getPatientExamModel.dart';
import '../../data/api/getPAtientExam_api.dart';
import 'getPAtientExam_state.dart';



class getPAtientExamError extends getPAtientExamState {
  final String error;

  getPAtientExamError(this.error);
}

class getPAtientExamCubit extends Cubit<getPAtientExamState> {
  getPAtientExamCubit() : super(getPAtientExamInitial());

  var r ;

  Future fetchgetPAtientExam() async {
    try {
      emit(getPAtientExamLoading());
      final getPatientExam = await getPAtientExamApi.fetchgetPAtientExam();
      emit(getPAtientExamSuccess(getPatientExam));
    } catch (e) {
      emit(getPAtientExamError(e.toString()));
    }
  }

  Future getc() async {
    try {
      List<Examinations> getPatientExam = [];
      emit(getPAtientExamLoading());
      r = await getPAtientExamApi.getc();
      emit(getPAtientExamSuccess(getPatientExam));
    } catch (e) {
      emit(getPAtientExamError(e.toString()));
    }
  }
}
