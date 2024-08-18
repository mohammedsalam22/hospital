
import 'package:equatable/equatable.dart';

enum abdomenStatus {
  initial,
  loading,
  success,
  error,
}

class abdomenState extends Equatable {
  final abdomenStatus status;

  const abdomenState({required this.status});

  factory abdomenState.initial() => const abdomenState(status: abdomenStatus.initial);

  @override
  List<Object?> get props => [status];

  abdomenState copyWith({
    abdomenStatus? status,
  }) {
    return abdomenState(
        status: status ?? this.status
    );
  }
}