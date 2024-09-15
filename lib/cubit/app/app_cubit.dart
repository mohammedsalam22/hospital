import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/Models/clinical_form.dart';
import 'package:waseem/data/repo/clinical_form_repo.dart';
import 'package:waseem/data/repo/floor_repo.dart';
import 'package:waseem/shared/sharedComponent/constant.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState.initial());
  static AppCubit get(context) => BlocProvider.of(context);

  ///
  Future getPatientByRoom(int roomId) async {
    emit(state.copyWith(status: RequestState.loading, patientId: null));
    try {
      final result = await FloorRepo.getPatientByRoom(roomId);
      await getAllClinicalForm(result);
      emit(
        state.copyWith(
          status: RequestState.success,
          patientId: result,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: RequestState.error));
    }
  }
  //

  Future getAllClinicalForm(int patientId) async {
    emit(state.copyWith(allClinicalForm: RequestState.loading));
    try {
      final formId = await ClinicalFormRepo.getAllClinicalForm(patientId);
      emit(state.copyWith(
        allClinicalForm: RequestState.success,
        formId: formId,
      ));

      await getclinicalForm(formId, patientId);
    } catch (e) {
      emit(state.copyWith(allClinicalForm: RequestState.error));
    }
  }

  Future getclinicalForm(int formId, int patientId) async {
    emit(state.copyWith(clinicalForm: RequestState.loading));
    try {
      final result = await ClinicalFormRepo.getclinicalForm(formId, patientId);
      var s = result["clinical form"];

      emit(
        state.copyWith(
          clinicalForm: RequestState.success,
          clinicalFormModel: ClinicalFormModel.fromJson(s),
        ),
      );
      print(state.clinicalForm);
    } catch (e) {
      print(e.toString());
      emit(state.copyWith(clinicalForm: RequestState.error));
    }
  }
}
