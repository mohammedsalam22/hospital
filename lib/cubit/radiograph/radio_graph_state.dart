import 'package:equatable/equatable.dart';

enum addradiographStatus {
  initial,
  loading,
  success,
  error,
}

class addradiographState extends Equatable {
  final addradiographStatus status;

  const addradiographState({required this.status});

  factory addradiographState.initial() => const addradiographState(status: addradiographStatus.initial);

  @override
  List<Object?> get props => [status];

  addradiographState copyWith({
    addradiographStatus? status,
  }) {
    return addradiographState(
      status: status ?? this.status,
    );
  }
}