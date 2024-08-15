import 'package:bloc/bloc.dart';

import '../../data/api/getMedicalExamination_api.dart';
import 'getMedicalExamination_state.dart';  // استيراد الحالات التي أنشأتها

class GetMedicalExaminationCubit extends Cubit<GetMedicalExaminationState> {
  GetMedicalExaminationCubit() : super(GetMedicalExaminationInitial());

  void fetchgetMedicalExamination(String token) async {
    try {
      emit(GetMedicalExaminationLoading());
      final getMedicalExaminations = await getMedicalExaminationApi.fetchgetMedicalExamination();
      print("Fetched Examinations: $getMedicalExaminations");
      emit(GetMedicalExaminationSuccess(getMedicalExaminations));
    } catch (e) {
      emit(GetMedicalExaminationError(e.toString()));
    }
  }

}
