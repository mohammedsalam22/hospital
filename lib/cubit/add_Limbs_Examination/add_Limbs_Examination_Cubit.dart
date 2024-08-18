import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/Limb_Repo.dart';
import 'add_Limbs_Examination_State.dart';


class LimbCubit extends Cubit<LimbState> {
  LimbCubit() : super(LimbState.initial());

  Future createLimb({
    required String? inguinalLymphadenopathyPalpation,
    required bool venousLegUlcers,
    required  String? oedemaAssessment,
    required bool palmarErythema,
    required String? purpura,
    required bool acrocyanosis,
    required  String? myatrophy,
    required  String? neurological,
    required  String? xanthonychia,
    required bool leukonychia,
    required String? punctateLeukonychia,
    required bool capillaryDilation,
    required  String? periorbitalCyanosis,
  }) async {
    emit(state.copyWith(status: LimbStatus.loading));
    try {
      await LimbRepo.createLimb(
        inguinalLymphadenopathyPalpation: inguinalLymphadenopathyPalpation,
        venousLegUlcers: venousLegUlcers,
        oedemaAssessment: oedemaAssessment,
        palmarErythema: palmarErythema,
        purpura: purpura,
        acrocyanosis: acrocyanosis,
        myatrophy: myatrophy,
        neurological: neurological,
        xanthonychia: xanthonychia,
        leukonychia: leukonychia,
        punctateLeukonychia: punctateLeukonychia,
        capillaryDilation: capillaryDilation,
        periorbitalCyanosis: periorbitalCyanosis,
      );
      emit(state.copyWith(status: LimbStatus.success));
    } catch (e) {
      emit(state.copyWith(status: LimbStatus.error));
    }
  }
}
