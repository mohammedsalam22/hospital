import 'package:equatable/equatable.dart';

enum SecondpartStatus {
  initial,
  loading,
  success,
  error,
}

class SecondpartState extends Equatable {
  final SecondpartStatus status;

  const SecondpartState({required this.status});

  factory SecondpartState.initial() => const SecondpartState(status: SecondpartStatus.initial);

  @override
  List<Object?> get props => [status];

  SecondpartState copyWith({
    SecondpartStatus? status,
  }) {
    return SecondpartState(
      status: status ?? this.status,
    );
  }
}