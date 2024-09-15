import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/death_file_repo.dart';
import '../../data/repo/final_repo.dart';
import '../../data/repo/firstone_repo.dart';
import '../../data/repo/summary_charge_repo.dart';
import '../../data/repo/three_Repo.dart';
import 'Intensive Care vitals final part_State.dart';



class finalSectionCubit extends Cubit<finalSectionState> {
  finalSectionCubit() : super(finalSectionState.initial());
  /*"HR": 3,
  "BP": 4,
  "Rr": 2,
  "Temp": 111,
  "SPO2": 243,
  "other": "Joi.string()"*/
  Future createfinalSection(
      int HR,
      int BP,
      int Rr,
      int Temp,
      int SPO2,
      String other,

      ) async {
    emit(state.copyWith(status: finalSectionStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await finalRepo.createfinal(
         HR,
         BP,
         Rr,
         Temp,
         SPO2,
         other,
      );
      emit(state.copyWith(status: finalSectionStatus.success));
    } catch (e) {
      emit(state.copyWith(status: finalSectionStatus.error));
    }
  }
}

