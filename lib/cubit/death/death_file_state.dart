part of 'death_file_cubit.dart';

enum DeathFileStatus {
  initial,
  loading,
  success,
  error,
}

class DeathFileState extends Equatable {
  final DeathFileStatus status;

  const DeathFileState({required this.status});

  factory DeathFileState.initial() => const DeathFileState(status: DeathFileStatus.initial);

  @override
  List<Object?> get props => [status];

  DeathFileState copyWith({
    DeathFileStatus? status,
  }) {
    return DeathFileState(
        status: status ?? this.status
    );
  }
}