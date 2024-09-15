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

import '../../data/repo/death_file_repo.dart';
import '../../data/repo/summary_charge_repo.dart';

class summaryChargeCubit extends Cubit<summaryChargeState> {
  summaryChargeCubit() : super(summaryChargeState.initial());

  Future createsummaryCharge(
    String specialistDoctor,
    String inChargeDoctor,
    String finall,
    String entryReason,
    String summaryStory,
    String finalSituation,
    String guidelines,
    String guidelines1,
    String guidelines2,
    String guidelines3,
    String guidelines4,
  ) async {
    emit(state.copyWith(status: summaryChargeStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await SummaryChargeRepo.createsummaryCharge(
          specialistDoctor,
          inChargeDoctor,
          // Add this line
          finall,
          entryReason,
          summaryStory,
          finalSituation,
          guidelines,
          guidelines1,
          guidelines2,
          guidelines3,
          guidelines4,
      );
      emit(state.copyWith(status: summaryChargeStatus.success));
    } catch (e) {
      emit(state.copyWith(status: summaryChargeStatus.error));
    }
  }
}
