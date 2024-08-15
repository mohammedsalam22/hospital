import 'package:bloc/bloc.dart';
import 'package:waseem/Models/getPatientRadioModel.dart';

import '../../data/api/GetRadiograph_api.dart';
import '../../data/api/getPatientRadio_api.dart';
import '../getPatientRadio/getPatientRadio_state.dart';
import 'GetRadiograph_state.dart';

class GetradiographError extends GetradiographState {
  final String error;

  GetradiographError(this.error);
}

class GetradiographCubit extends Cubit<GetradiographState> {
  GetradiographCubit() : super(GetradiographInitial());

  void fetchGetradiograph(String token) async {
    try {
      emit(GetradiographLoading());
      final Getradiograph = await GetradiographApi.fetchRadiograph();
      emit(GetradiographSuccess(Getradiograph));
    } catch (e) {
      emit(GetradiographError(e.toString()));
    }
  }
}
