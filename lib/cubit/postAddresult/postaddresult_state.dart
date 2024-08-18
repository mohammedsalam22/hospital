import 'package:equatable/equatable.dart';

enum postAddresultStatus {
  initial,
  loading,
  success,
  error,
}

class postAddresultState extends Equatable {
  final postAddresultStatus status;

  const postAddresultState({required this.status});

  factory postAddresultState.initial() => const postAddresultState(status: postAddresultStatus.initial);

  @override
  List<Object?> get props => [status];

  postAddresultState copyWith({
    postAddresultStatus? status,
  }) {
    return postAddresultState(
      status: status ?? this.status,
    );
  }
}