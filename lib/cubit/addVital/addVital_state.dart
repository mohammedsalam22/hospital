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

enum addVitalStatus {
  initial,
  loading,
  success,
  error,
}

class addVitalState extends Equatable {
  final addVitalStatus status;

  const addVitalState({required this.status});

  factory addVitalState.initial() => const addVitalState(status: addVitalStatus.initial);

  @override
  List<Object?> get props => [status];

  addVitalState copyWith({
    addVitalStatus? status,
  }) {
    return addVitalState(
      status: status ?? this.status,
    );
  }
}