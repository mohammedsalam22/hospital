import '../../Models/GetPatientTest Model.dart';

abstract class GetPatientTestDoctorState {}

class GetPatientTestInitial extends GetPatientTestDoctorState {}

class GetPatientTestLoading extends GetPatientTestDoctorState {}

class GetPatientTestSuccess extends GetPatientTestDoctorState {
  final List<GetPatientTest> patientTests;

  GetPatientTestSuccess(this.patientTests);
}

class GetPatientTestError extends GetPatientTestDoctorState {
  final String error;

  GetPatientTestError(this.error);
}
