import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waseem/component/id.dart';
import 'package:waseem/cubit/the_first_part_Cubit/the%20first%20part_state.dart';

import '../../data/repo/death_file_repo.dart';
import '../../data/repo/firstone_repo.dart';
import '../../data/repo/summary_charge_repo.dart';



class firstpartCubit extends Cubit<firstpartState> {
  firstpartCubit() : super(firstpartState.initial());

  Future createfirstpart(
      int RoomID,
      String ptInitial,
      String POA,
      String code,
      String HT,
      String WT,
      String isolation,
      String admitDate,
      String meds,
      String RN,
      String Instructor,
      bool accucheck,
      bool restraints
      ) async {
    emit(state.copyWith(status: firstpartStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      var ss = await firstoneRepo.createfirstone(
           RoomID,
           ptInitial,
           POA,
           code,
           HT,
           WT,
           isolation,
           admitDate,
           meds,
           RN,
           Instructor,
           accucheck,
           restraints
      );
      Id.id2 = ss['id'][0] ;
      emit(state.copyWith(status: firstpartStatus.success));
    } catch (e) {
      emit(state.copyWith(status: firstpartStatus.error));
    }
  }
}

