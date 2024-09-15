import 'package:bloc/bloc.dart';

import '../../data/api/getsummarychage_api.dart';
import 'getsummarychage_state.dart';

class getsummarychargeError extends getsummarychargeState {
  final String error;

  getsummarychargeError(this.error);
}

class getsummarychargeCubit extends Cubit<getsummarychargeState> {
  getsummarychargeCubit() : super(getsummarychargeInitial());

  Future fetchgetsummarycharge() async {
    try {
      emit(getsummarychargeLoading());
      final getsummarycharges = await GetSummaryDischargeApi.fetchSummary();
      emit(getsummarychargeSuccess(getsummarycharges));
    } catch (e) {
      emit(getsummarychargeError(e.toString()));
    }
  }
}

/*

class RadiographError extends RadiographState {
  final String error;

  RadiographError(this.error);
}

class RadiographCubit extends Cubit<RadiographState> {
  RadiographCubit() : super(RadiographInitial());

  void fetchRadiographs(String token) async {
    try {
      emit(RadiographLoading());
      final radiographs = await RadiographApi.fetchRadiographs();
      emit(RadiographSuccess(radiographs));
    } catch (e) {
      emit(RadiographError(e.toString()));
    }
  }
}
*/
