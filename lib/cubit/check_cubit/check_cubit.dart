import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/check_repo.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckState.initial());

  var con ;

  Future checkIn (int id , int patientId) async {
    emit(state.copyWith(checkStatus: CheckStatus.loading)) ;
    try {
      await CheckRepo.getDoctorDetails(id, patientId) ;
      emit(state.copyWith(checkStatus: CheckStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(checkStatus: CheckStatus.failure)) ;
    }
  }

  Future checkOut (int id) async {
    emit(state.copyWith(checkStatus: CheckStatus.loading)) ;
    try {
      await CheckRepo.checkOut(id) ;
      emit(state.copyWith(checkStatus: CheckStatus.successO)) ;
    } catch (e) {
      emit(state.copyWith(checkStatus: CheckStatus.failure)) ;
    }
  }

  Future consults () async {
    emit(state.copyWith(checkStatus: CheckStatus.loading)) ;
    try {
      con = await CheckRepo.consults() ;
      emit(state.copyWith(checkStatus: CheckStatus.successO)) ;
    } catch (e) {
      emit(state.copyWith(checkStatus: CheckStatus.failure)) ;
    }
  }
}
