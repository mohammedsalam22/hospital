// death_file_state.dart
import '../../Models/getPatientRadioModel.dart';
import '../../Models/getdeathfileModel.dart';

abstract class GetDeathFileState {}

class GetDeathFileInitial extends GetDeathFileState {}

class GetDeathFileLoading extends GetDeathFileState {}

class GetDeathFileSuccess extends GetDeathFileState {
  final List<DeathFileModel> deathFileModel;

  GetDeathFileSuccess(this.deathFileModel);
}


class GetDeathFileError extends GetDeathFileState {
  final String error;

  GetDeathFileError(this.error);
}
