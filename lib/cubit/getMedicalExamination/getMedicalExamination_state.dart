import 'package:bloc/bloc.dart';

import '../../Models/getMedicalExamination.dart';


class GetMedicalExaminationState {}

class GetMedicalExaminationInitial extends GetMedicalExaminationState {}

class GetMedicalExaminationLoading extends GetMedicalExaminationState {}

class GetMedicalExaminationSuccess extends GetMedicalExaminationState {
  final List<Examination> getMedicalExaminations;

  GetMedicalExaminationSuccess(this.getMedicalExaminations);
}

class GetMedicalExaminationError extends GetMedicalExaminationState {
  final String error;

  GetMedicalExaminationError(this.error);
}
