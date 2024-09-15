import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repo/get_surgery_details_repo.dart';

part 'getsurgerydetails_state.dart';


class GetsurgerydetailsCubit extends Cubit<GetsurgerydetailsState> {
  GetsurgerydetailsCubit() : super(GetsurgerydetailsState.initial());

  var rr;

  Future getSurgeryDetails  (int id) async {
    emit(state.copyWith(getsurgerydetailsStatus: GetsurgerydetailsStatus.loading));
    try {
      rr = await GetSurgeryDetailsRepo.getSurgeryDetails(id);
      emit(state.copyWith(getsurgerydetailsStatus: GetsurgerydetailsStatus.success));
      print(state.getsurgerydetailsStatus);
    } catch (e) {
      emit(state.copyWith(getsurgerydetailsStatus: GetsurgerydetailsStatus.failure));
    }
  }
}