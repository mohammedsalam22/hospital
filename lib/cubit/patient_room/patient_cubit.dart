import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waseem/data/repo/patient_room_repo.dart';

part 'patient_state.dart';

class PatientCubit extends Cubit<PatientState> {
  PatientCubit() : super(PatientState.initial());

  var patient ;
  var patients ;

  Future getPatientByRoom(int roomID) async {
    patient = null ;
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      patient = await PatientRoomRepo.getPatient(roomID);
      print(patient) ;
      emit(state.copyWith(patientStatus: PatientStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }

  Future getss() async {
    patients = null ;
    emit(state.copyWith(patientStatus: PatientStatus.loading)) ;
    try {
      patients = await PatientRoomRepo.getd();
      print(patients) ;
      emit(state.copyWith(patientStatus: PatientStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(patientStatus: PatientStatus.failure)) ;
    }
  }
}
