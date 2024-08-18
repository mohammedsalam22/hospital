import '../../Models/GetPatientTest Model.dart';
import '../../Models/getnotresponseModel.dart';

abstract class getnotresponseState {}

class getnotresponseInitial extends getnotresponseState {}

class getnotresponseLoading extends getnotresponseState {}

class getnotresponseSuccess extends getnotresponseState {
  final List<Getnotresponse> patientTests;

  getnotresponseSuccess(this.patientTests);
}

class getnotresponseError extends getnotresponseState {
  final String error;

  getnotresponseError(this.error);
}
