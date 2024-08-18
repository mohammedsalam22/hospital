import 'package:bloc/bloc.dart';

import '../../data/repo/Head_Repo.dart';
import 'head_State.dart';
class HeadCubit extends Cubit<HeadState> {
  HeadCubit() : super(HeadState.initial());

  Future createHead({
    required String? skinColor,
    required String? skinNatural,
    required String? skinOther,
    required String? skinHair,
    required bool eyesPallor,
    required bool eyesJaundice,
    required bool eyesNystagmus,
    required bool eyesEnophthalmos,
    required bool eyesExophthalmos,
    required bool mouthAtrophicGlossitis,
    required bool mouthMacroglossia,
    required String mouthColor,
    required bool mouthToothDecay,
    required bool mouthMacrogingivae,
    required bool mouthGingivalBleeding,
    required bool mouthUlcers,
  }) async {
    emit(state.copyWith(status: HeadStatus.loading));
    try {
      await HeadRepo.createHead(
        skinColor: skinColor,
        skinNatural: skinNatural,
        skinOther: skinOther,
        skinHair: skinHair,
        eyesPallor: eyesPallor,
        eyesJaundice: eyesJaundice,
        eyesNystagmus: eyesNystagmus,
        eyesEnophthalmos: eyesEnophthalmos,
        eyesExophthalmos: eyesExophthalmos,
        mouthAtrophicGlossitis: mouthAtrophicGlossitis,
        mouthMacroglossia: mouthMacroglossia,
        mouthColor: mouthColor,
        mouthToothDecay: mouthToothDecay,
        mouthMacrogingivae: mouthMacrogingivae,
        mouthGingivalBleeding: mouthGingivalBleeding,
        mouthUlcers: mouthUlcers,
      );
      emit(state.copyWith(status: HeadStatus.success));
    } catch (e) {
      emit(state.copyWith(status: HeadStatus.error));
    }
  }
}
