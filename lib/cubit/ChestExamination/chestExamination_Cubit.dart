import 'package:bloc/bloc.dart';

import '../../data/repo/ChestExamination_Repo.dart';
import '../../data/repo/Head_Repo.dart';
import 'chestExamination_State.dart';

class ChestExaminationCubit extends Cubit<ChestExaminationState> {
  ChestExaminationCubit() : super(ChestExaminationState.initial());

  Future createChestExamination({
    required String? Compressions,
    required String? respiratorySounds,
    required bool sideRounded,
    required bool gynecomastia,
    required bool orange_skinnedBreast,
    required bool spiderVeins,
    required bool barrelChest,
    required bool sternalPit,

  }) async {
    emit(state.copyWith(status: ChestExaminationStatus.loading));
    try {
      await ChestexaminationRepo.createChestexamination(
          Compressions:Compressions,
          respiratorySounds:respiratorySounds,
          sideRounded:sideRounded,
          gynecomastia:gynecomastia,
          orange_skinnedBreast:orange_skinnedBreast,
          spiderVeins:spiderVeins,
          barrelChest:barrelChest,
          sternalPit:sternalPit,
      );
      emit(state.copyWith(status: ChestExaminationStatus.success));
    } catch (e) {
      emit(state.copyWith(status: ChestExaminationStatus.error));
    }
  }
}
