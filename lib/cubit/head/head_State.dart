
import 'package:equatable/equatable.dart';

enum HeadStatus {
  initial,
  loading,
  success,
  error,
}

class HeadState extends Equatable {
  final HeadStatus status;

  const HeadState({required this.status});

  factory HeadState.initial() => const HeadState(status: HeadStatus.initial);

  @override
  List<Object?> get props => [status];

  HeadState copyWith({
    HeadStatus? status,
  }) {
    return HeadState(
        status: status ?? this.status
    );
  }
}