import '../../Models/GetPatientTest Model.dart';

abstract class GetPatientTestDoctorState {}

class GetPatientTestInitial extends GetPatientTestDoctorState {}

class GetPatientTestLoading extends GetPatientTestDoctorState {}

class GetPatientTestSuccess extends GetPatientTestDoctorState {
}

class GetPatientTestError extends GetPatientTestDoctorState {
}
