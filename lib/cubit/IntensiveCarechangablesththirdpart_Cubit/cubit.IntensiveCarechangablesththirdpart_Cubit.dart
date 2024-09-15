import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/death_file_repo.dart';
import '../../data/repo/firstone_repo.dart';
import '../../data/repo/summary_charge_repo.dart';
import '../../data/repo/three_Repo.dart';
import 'cubit.IntensiveCarechangablesththirdpart_State.dart';



class threeSectionCubit extends Cubit<threeSectionState> {
  threeSectionCubit() : super(threeSectionState.initial());

  Future createthreeSection(
  String shift,
  int PIV,
  int CVC,
  int PICC,
  String site,
  int fluidRate,
  String other,

  ) async {
    emit(state.copyWith(status: threeSectionStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await threeRepo.createthree(
         shift,
         PIV,
         CVC,
         PICC,
         site,
         fluidRate,
         other,
      );
      emit(state.copyWith(status: threeSectionStatus.success));
    } catch (e) {
      emit(state.copyWith(status: threeSectionStatus.error));
    }
  }
}

