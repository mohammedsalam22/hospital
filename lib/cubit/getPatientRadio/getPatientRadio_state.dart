import 'package:bloc/bloc.dart';

import '../../Models/getPatientRadioModel.dart';


class getPatientRadioState {}

class getPatientRadioInitial extends getPatientRadioState {}

class getPatientRadioLoading extends getPatientRadioState {}

class getPatientRadioSuccess extends getPatientRadioState {
  final List<GetPatientRadio> getPatientRadio;

  getPatientRadioSuccess(this.getPatientRadio);
}