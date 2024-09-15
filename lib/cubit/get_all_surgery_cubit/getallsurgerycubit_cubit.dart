import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/getallsurgeryrepo.dart';

part 'getallsurgerycubit_state.dart';



class GetallsurgerycubitCubit extends Cubit<GetallsurgerycubitState> {
  GetallsurgerycubitCubit() : super(GetallsurgerycubitState.initial());

  var rr;

  Future getAllSurgery  () async {
    emit(state.copyWith(getallsurgerycubitStatus: GetallsurgerycubitStatus.loading));
    try {
      rr = await GetAllSurgeryRepo.getAllSurgery();
      emit(state.copyWith(getallsurgerycubitStatus: GetallsurgerycubitStatus.success));
      print(state.getallsurgerycubitStatus);
    } catch (e) {
      emit(state.copyWith(getallsurgerycubitStatus: GetallsurgerycubitStatus.failure));
    }
  }
}