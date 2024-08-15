import 'package:bloc/bloc.dart';

import '../../Models/getPatientExamModel.dart';



class getPAtientExamState {}

class getPAtientExamInitial extends getPAtientExamState {}

class getPAtientExamLoading extends getPAtientExamState {}

class getPAtientExamSuccess extends getPAtientExamState {
  final List<Examinations> getpatientexam;

  getPAtientExamSuccess(this.getpatientexam);
}