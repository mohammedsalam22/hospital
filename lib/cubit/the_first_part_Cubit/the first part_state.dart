import 'package:equatable/equatable.dart';

enum firstpartStatus {
  initial,
  loading,
  success,
  error,
}

class firstpartState extends Equatable {
  final firstpartStatus status;

  const firstpartState({required this.status});

  factory firstpartState.initial() => const firstpartState(status: firstpartStatus.initial);

  @override
  List<Object?> get props => [status];

  firstpartState copyWith({
    firstpartStatus? status,
  }) {
    return firstpartState(
      status: status ?? this.status,
    );
  }
}