import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/Models/params/companions_complents_params.dart';
import 'package:waseem/Models/params/details_complaint_params.dart';
import 'package:waseem/Models/params/other_system_params.dart';
import 'package:waseem/Models/params/patient_history_params.dart';
import 'package:waseem/data/repo/clinical_form_repo.dart';
import 'package:waseem/shared/sharedComponent/constant.dart';

part 'clinical_form_state.dart';

class ClinicalFormCubit extends Cubit<ClinicalFormState> {
  ClinicalFormCubit() : super(ClinicalFormState.initial());

  static ClinicalFormCubit get(context) => BlocProvider.of(context);

  Future addPatientHistory(
      PatientHistoryParams p, int patientId, bool isEdit) async {
    emit(state.copyWith(patientHistoryStatus: RequestState.loading));
    try {
      await ClinicalFormRepo.addPatientHistory(p, patientId, isEdit);
      emit(
        state.copyWith(
          patientHistoryStatus: RequestState.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(patientHistoryStatus: RequestState.error));
    }
  }

  Future addcomplent(
      DetailsComplaintParams p, int patientId, bool isEdit) async {
    emit(state.copyWith(complentStatus: RequestState.loading));
    try {
      await ClinicalFormRepo.addcomplent(p, patientId, isEdit);
      emit(
        state.copyWith(
          complentStatus: RequestState.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(complentStatus: RequestState.error));
    }
  }

  Future companionsComplents(
      CompanionsComplentsParams p, int patientId, bool isEdit) async {
    emit(state.copyWith(companionsComplentsStatus: RequestState.loading));
    try {
      await ClinicalFormRepo.companionsComplents(p, patientId, isEdit);
      emit(
        state.copyWith(
          companionsComplentsStatus: RequestState.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(companionsComplentsStatus: RequestState.error));
    }
  }

  Future addOtherSystem(OtherSystemParams p, int patientId, bool isEdit) async {
    emit(state.copyWith(otherSystemStatus: RequestState.loading));
    try {
      await ClinicalFormRepo.addOtherSystem(p, patientId, isEdit);
      emit(
        state.copyWith(
          otherSystemStatus: RequestState.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(otherSystemStatus: RequestState.error));
    }
  }
}
