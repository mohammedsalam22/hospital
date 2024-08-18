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

enum addNeckExamStatus {
  initial,
  loading,
  success,
  error,
}

class addNeckExamState extends Equatable {
  final addNeckExamStatus status;

  const addNeckExamState({required this.status});

  factory addNeckExamState.initial() => const addNeckExamState(status: addNeckExamStatus.initial);

  @override
  List<Object?> get props => [status];

  addNeckExamState copyWith({
    addNeckExamStatus? status,
  }) {
    return addNeckExamState(
      status: status ?? this.status,
    );
  }
}