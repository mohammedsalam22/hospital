
import 'package:equatable/equatable.dart';

enum ChestExaminationStatus {
  initial,
  loading,
  success,
  error,
}

class ChestExaminationState extends Equatable {
  final ChestExaminationStatus status;

  const ChestExaminationState({required this.status});

  factory ChestExaminationState.initial() => const ChestExaminationState(status: ChestExaminationStatus.initial);

  @override
  List<Object?> get props => [status];

  ChestExaminationState copyWith({
    ChestExaminationStatus? status,
  }) {
    return ChestExaminationState(
        status: status ?? this.status
    );
  }
}