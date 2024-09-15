import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/death_file_repo.dart';
import '../../data/repo/firstone_repo.dart';
import '../../data/repo/second_repo.dart';
import '../../data/repo/summary_charge_repo.dart';
import 'cubit.addIntensiveCaretheseconde_State.dart';



class SecondpartCubit extends Cubit<SecondpartState> {
  SecondpartCubit() : super(SecondpartState.initial());

  Future createSecondpart(
  String currentProblem,
  String allergies,
  String activity,
  String neuro,
  String diet,
  String resp,
  String GL,
  String skin,
  String cardiac,
  String pain,
  String M_S,
  String RUE,
  String RLE,
  String LUE,
  String LLE,
  String GU,
  String voidStatus,
  String lastBM,
  String medicalHistory,
  String recentProcedure,
  String IONote,
  String other,

  ) async {
    emit(state.copyWith(status: SecondpartStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await secondRepo.createsecond(
         currentProblem,
         allergies,
         activity,
         neuro,
         diet,
         resp,
         GL,
         skin,
         cardiac,
         pain,
         M_S,
         RUE,
         RLE,
         LUE,
         LLE,
         GU,
         voidStatus,
         lastBM,
         medicalHistory,
         recentProcedure,
         IONote,
         other,
      );
      emit(state.copyWith(status: SecondpartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: SecondpartStatus.error));
    }
  }
}

