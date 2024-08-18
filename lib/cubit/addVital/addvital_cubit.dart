
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../data/repo/Vital_Repo.dart';
import '../../data/repo/death_file_repo.dart';
import '../../data/repo/summary_charge_repo.dart';
import 'addVital_state.dart';



class addVitalCubit extends Cubit<addVitalState> {
  addVitalCubit() : super(addVitalState.initial());

  Future createaddVital(

   int bodyTemperature,
   int heartRate

      ) async {
    emit(state.copyWith(status: addVitalStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await VitlaRepo.createVital(

  bodyTemperature,
  heartRate

      );
      emit(state.copyWith(status: addVitalStatus.success));
    } catch (e) {
      emit(state.copyWith(status: addVitalStatus.error));
    }
  }
}


