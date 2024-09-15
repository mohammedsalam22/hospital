import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/surgery_repo.dart';

part 'surgery_state.dart';



class SurgeryCubit extends Cubit<SurgeryState> {
  SurgeryCubit() : super(SurgeryState.initial());
  var details ;


  Future postSurgery( String injuryType,
      String ASA ,
      String surgerySituation,
      String surgeryDuration,
      bool antipathetic,
      String surgeonName,
      String helperSurgeonName,
      String nurseName,
      String surgeryName,
      String helperNurse,
      int surgeonRoomNumber,
      var antipatheticStartDate,
      var antipatheticStopDate, ) async {
    print('kkj') ;
    emit(state.copyWith(surgery_status: Surgery_Status.loading));
    try {
await SurgeryRepo.postSurgery(injuryType, ASA, surgerySituation, surgeryDuration, antipathetic, surgeonName, helperSurgeonName, nurseName, surgeryName, helperNurse, surgeonRoomNumber, antipatheticStartDate, antipatheticStopDate);   emit(state.copyWith(surgery_status: Surgery_Status.success));
    } catch (e) {
      emit(state.copyWith(surgery_status: Surgery_Status.failure));
    }
  }}