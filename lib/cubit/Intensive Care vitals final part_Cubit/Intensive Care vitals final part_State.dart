import 'package:equatable/equatable.dart';

enum finalSectionStatus {
  initial,
  loading,
  success,
  error,
}

class finalSectionState extends Equatable {
  final finalSectionStatus status;

  const finalSectionState({required this.status});

  factory finalSectionState.initial() => const finalSectionState(status: finalSectionStatus.initial);

  @override
  List<Object?> get props => [status];

  finalSectionState copyWith({
    finalSectionStatus? status,
  }) {
    return finalSectionState(
      status: status ?? this.status,
    );
  }
}