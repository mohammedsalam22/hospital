
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/death_file_repo.dart';

part 'death_file_state.dart';

class DeathFileCubit extends Cubit<DeathFileState> {
  DeathFileCubit() : super(DeathFileState.initial());

  Future createDeathFile(
      String iden,
      String temp,
      String dLo,
      String dDa,
      String dHo ,
      String docName ,
      String fileDate ,
      String dSeen ,
      String lastMinute ,
      String lastDay ,
      String lastYear ,
      String reason ,
      bool anatomy ,
      bool autopsy ,
      bool normal ,
      bool notSpec ,
      bool nonNormal ,
      String liver1,
      String liver2,
      String liver3,
      bool liver4,
      String rigor,
      String dehyr,
      String lateSigns,
      ) async {
    emit(state.copyWith(status: DeathFileStatus.loading)) ;
    try {
      print("ddddd") ;
      await DeathFileRepo.createDeathFile(iden, temp, dLo, dDa, dHo, docName, fileDate, dSeen, lastMinute, lastDay, lastYear, reason, anatomy, autopsy, normal, notSpec, nonNormal, liver1, liver2, liver3, liver4, rigor, dehyr, lateSigns) ;
      emit(state.copyWith(status: DeathFileStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: DeathFileStatus.error)) ;
    }
  }
}
