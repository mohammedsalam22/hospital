import 'package:equatable/equatable.dart';

enum addmedicalexamsStatus {
  initial,
  loading,
  success,
  error,
}

class addmedicalexamsState extends Equatable {
  final addmedicalexamsStatus status;

  const addmedicalexamsState({required this.status});

  factory addmedicalexamsState.initial() => const addmedicalexamsState(status: addmedicalexamsStatus.initial);

  @override
  List<Object?> get props => [status];

  addmedicalexamsState copyWith({
    addmedicalexamsStatus? status,
  }) {
    return addmedicalexamsState(
      status: status ?? this.status,
    );
  }
}