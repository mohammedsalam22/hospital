import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/shared/sharedComponent/constant.dart';

import 'Button_State.dart';


class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonState.initial());

  Future<void> loadButtons() async {
    emit(state.copyWith(status: RequestState.loading));
    try {
      // افترض أنك تحصل على البيانات من مصدر خارجي هنا
      // سأستخدم نموذجًا ثابتًا للبيانات
      List<Button> buttons = [
        Button(text: "الزر الأول"),
        Button(text: "الزر الثاني"),
      ];

      emit(state.copyWith(
        status: RequestState.success,
        buttons: buttons,
      ));
    } catch (e) {
      emit(state.copyWith(status: RequestState.error));
    }
  }
}
