/*

import 'package:equatable/equatable.dart';

enum summaryChargeStatus {
  initial,
  loading,
  success,
  error,
}

class summaryChargeState extends Equatable {
  final summaryChargeStatus status;

  const summaryChargeState({required this.status});

  factory summaryChargeState.initial() => const summaryChargeState(status: summaryChargeStatus.initial);

  @override
  List<Object?> get props => [status];

  summaryChargeState copyWith({
    summaryChargeStatus? status,
  }) {
    return summaryChargeState(
        status: status ?? this.status
    );
  }
}*/
import 'package:equatable/equatable.dart';

enum ScreeingTestStatus {
  initial,
  loading,
  success,
  error,
}

class ScreeingTestState extends Equatable {
  final ScreeingTestStatus status;

  const ScreeingTestState({required this.status});

  factory ScreeingTestState.initial() => const ScreeingTestState(status: ScreeingTestStatus.initial);

  @override
  List<Object?> get props => [status];

  ScreeingTestState copyWith({
    ScreeingTestStatus? status,
  }) {
    return ScreeingTestState(
      status: status ?? this.status,
    );
  }
}