
import 'package:equatable/equatable.dart';

enum LimbStatus {
  initial,
  loading,
  success,
  error,
}

class LimbState extends Equatable {
  final LimbStatus status;

  const LimbState({required this.status});

  factory LimbState.initial() => const LimbState(status: LimbStatus.initial);

  @override
  List<Object?> get props => [status];

  LimbState copyWith({
    LimbStatus? status,
  }) {
    return LimbState(
        status: status ?? this.status
    );
  }
}