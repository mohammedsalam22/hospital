import 'package:equatable/equatable.dart';

enum AddVisualStatus {
  initial,
  loading,
  success,
  error,
}

class AddVisualState extends Equatable {
  final AddVisualStatus status;

  const AddVisualState({required this.status});

  factory AddVisualState.initial() => const AddVisualState(status: AddVisualStatus.initial);

  @override
  List<Object?> get props => [status];

  AddVisualState copyWith({
    AddVisualStatus? status,
  }) {
    return AddVisualState(
      status: status ?? this.status,
    );
  }
}
