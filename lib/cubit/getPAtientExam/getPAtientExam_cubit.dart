import 'package:bloc/bloc.dart';

import '../../data/api/getPAtientExam_api.dart';
import 'getPAtientExam_state.dart';



class getPAtientExamError extends getPAtientExamState {
  final String error;

  getPAtientExamError(this.error);
}

class getPAtientExamCubit extends Cubit<getPAtientExamState> {
  getPAtientExamCubit() : super(getPAtientExamInitial());

  void fetchgetPAtientExam(String token) async {
    try {
      emit(getPAtientExamLoading());
      final getPatientExam = await getPAtientExamApi.fetchgetPAtientExam();
      emit(getPAtientExamSuccess(getPatientExam));
    } catch (e) {
      emit(getPAtientExamError(e.toString()));
    }
  }
}
