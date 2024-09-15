import 'package:equatable/equatable.dart';

enum threeSectionStatus {
  initial,
  loading,
  success,
  error,
}

class threeSectionState extends Equatable {
  final threeSectionStatus status;

  const threeSectionState({required this.status});

  factory threeSectionState.initial() => const threeSectionState(status: threeSectionStatus.initial);

  @override
  List<Object?> get props => [status];

  threeSectionState copyWith({
    threeSectionStatus? status,
  }) {
    return threeSectionState(
      status: status ?? this.status,
    );
  }
}