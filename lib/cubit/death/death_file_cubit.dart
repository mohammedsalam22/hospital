
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/death_file_repo.dart';

part 'death_file_state.dart';

class DeathFileCubit extends Cubit<DeathFileState> {
  DeathFileCubit() : super(DeathFileState.initial());

  Future createDeathFile() async {
    emit(state.copyWith(status: DeathFileStatus.loading)) ;
    try {
      print("ddddd") ;
      await DeathFileRepo.createDeathFile() ;
      emit(state.copyWith(status: DeathFileStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(status: DeathFileStatus.error)) ;
    }
  }
}
