import 'package:equatable/equatable.dart';

import '../../shared/sharedComponent/constant.dart';


class ButtonState extends Equatable {
  final RequestState status;
  final List<Button> buttons;

  const ButtonState({
    required this.status,
    required this.buttons,
  });

  factory ButtonState.initial() => const ButtonState(
    status: RequestState.initial,
    buttons: [],
  );

  ButtonState copyWith({
    RequestState? status,
    List<Button>? buttons,
  }) {
    return ButtonState(
      status: status ?? this.status,
      buttons: buttons ?? this.buttons,
    );
  }

  @override
  List<Object?> get props => [status, buttons];
}

class Button {
  final String text;

  Button({required this.text});
}
