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
import 'package:waseem/cubit/radiograph/radio_graph_state.dart';
import '../../data/repo/add_radio_graph_repo.dart';



class addradiographCubit extends Cubit<addradiographState> {
  addradiographCubit() : super(addradiographState.initial());

  Future createradiograph(

      String askRadiographs,


      ) async {
    emit(state.copyWith(status: addradiographStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await addradiographRepo.createaddradiograph(

        askRadiographs,

      )   ;    print("vvvvvvvvvvvvvvvvvvvvvv");
      ;
      emit(state.copyWith(status: addradiographStatus.success));
    } catch (e) {
      emit(state.copyWith(status: addradiographStatus.error));
    }
  }
}

