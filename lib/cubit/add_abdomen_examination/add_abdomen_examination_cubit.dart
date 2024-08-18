import 'package:bloc/bloc.dart';

import '../../data/repo/Head_Repo.dart';
import '../../data/repo/abdomen_Repo.dart';
import 'add_abdomen_examination_State.dart';
class abdomenCubit extends Cubit<abdomenState> {
  abdomenCubit() : super(abdomenState.initial());

  Future createabdomen({
    required String? macBrownie,
    required String? murphy,
    required bool rooftopping,
    required String? milia,
    required String? myoclonus,
    required String? distendedAbdomen,
    required bool Umbilical_Fold_Disappearance,
    required String? abdominalRespiration,
    required bool hernia,
    required bool sideRounded,
    required String? surgicalScar,
    required String? rashes,


  }) async {
    emit(state.copyWith(status: abdomenStatus.loading));
    try {
      await abdomenRepo.createabdomen(
        macBrownie: macBrownie,
        murphy: murphy,
        rooftopping: rooftopping,
        milia: milia,
        myoclonus: myoclonus,
        distendedAbdomen: distendedAbdomen,
        Umbilical_Fold_Disappearance: Umbilical_Fold_Disappearance,
        abdominalRespiration: abdominalRespiration,
        hernia: hernia,
        sideRounded: sideRounded,
        surgicalScar: surgicalScar,
        rashes: rashes,

      );
      emit(state.copyWith(status: abdomenStatus.success));
    } catch (e) {
      emit(state.copyWith(status: abdomenStatus.error));
    }
  }
}
