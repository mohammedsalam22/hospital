import 'package:bloc/bloc.dart';

import '../../data/api/getPatientRadio_api.dart';
import 'getPatientRadio_state.dart';

class getPatientRadioError extends getPatientRadioState {
  final String error;

  getPatientRadioError(this.error);
}

class getPatientRadioCubit extends Cubit<getPatientRadioState> {
  getPatientRadioCubit() : super(getPatientRadioInitial());

  void fetchRadiographs(String token) async {
    try {
      emit(getPatientRadioLoading());
      final radiographs = await GetpatientradioApi.fetchRadiographs();
      print(radiographs) ;
      emit(getPatientRadioSuccess(radiographs));
    } catch (e) {
      emit(getPatientRadioError(e.toString()));
    }
  }
}
