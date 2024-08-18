import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../data/repo/VisualRepo.dart';
import 'AddVisual_state.dart';

class AddVisualCubit extends Cubit<AddVisualState> {
  AddVisualCubit() : super(AddVisualState.initial());

  Future<void> createVisual({
    required bool goodCondition,
    required bool cachecticPatient,
    required String conscience,
    required int gcs,
  }) async {
    emit(state.copyWith(status: AddVisualStatus.loading));
    try {
      await VisualRepo.createVisual(
        goodCondition: goodCondition,
        cachecticPatient: cachecticPatient,
        conscience: conscience,
        gcs: gcs,
      );
      emit(state.copyWith(status: AddVisualStatus.success));
    } catch (e) {
      emit(state.copyWith(status: AddVisualStatus.error));
    }
  }
}
