import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waseem/cubit/summaryCharge/summary_charge_state.dart';

import '../../data/repo/ScreeingTest_Repo.dart';
import '../../data/repo/death_file_repo.dart';
import '../../data/repo/summary_charge_repo.dart';
import 'ScreeingTest_state.dart';



class ScreeingTestCubit extends Cubit< ScreeingTestState> {
  ScreeingTestCubit() : super(ScreeingTestState.initial());

  Future createScreeingTest(

      String askTest,

      ) async {
    emit(state.copyWith(status: ScreeingTestStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeeeeeeeeee");
      await ScreeingTestRepo.createScreeingTest(

        askTest

      );
      emit(state.copyWith(status: ScreeingTestStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ScreeingTestStatus.error));
    }
  }
}

