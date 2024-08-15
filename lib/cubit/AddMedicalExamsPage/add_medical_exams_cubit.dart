/*

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../data/repo/death_file_repo.dart';
import '../../data/repo/summary_charge_repo.dart';



class summaryChargeCubit extends Cubit<summaryChargeState> {
  summaryChargeCubit() : super(summaryChargeState.initial());

  Future createsummaryCharge( ) async {
    emit(state.copyWith(status: summaryChargeStatus.loading)) ;
    try {
      print("eeeeeeeeeeeeeeeeeeee") ;
      await SummaryChargeRepo.createsummaryCharge() ;
      emit(state.copyWith(status: summaryChargeStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: summaryChargeStatus.error)) ;
    }
  }
}
*/
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../data/repo/add_medical_exams_repo.dart';
import '../../data/repo/death_file_repo.dart';
import '../../data/repo/summary_charge_repo.dart';
import 'add_medical_exams_states.dart';



class addmedicalexamsCubit extends Cubit<addmedicalexamsState> {
  addmedicalexamsCubit() : super(addmedicalexamsState.initial());

  Future createaddmedicalexams(

      String askExaminations,


      ) async {
    emit(state.copyWith(status: addmedicalexamsStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await addmedicalexamsRepo.createaddmedicalexams(

        askExaminations,

      );
      emit(state.copyWith(status: addmedicalexamsStatus.success));
    } catch (e) {
      emit(state.copyWith(status: addmedicalexamsStatus.error));
    }
  }
}

