import 'package:bloc/bloc.dart';
import 'package:waseem/cubit/postAddresult/postaddresult_state.dart';

import '../../data/repo/postAddresult_repo.dart';




class postAddresultCubit extends Cubit< postAddresultState> {
  postAddresultCubit() : super(postAddresultState.initial());

  Future createpostAddresult(

      String result,

      ) async {
    emit(state.copyWith(status: postAddresultStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeeeeeeeeee");
      await postAddresultRepo.createpostAddresult(

          result

      );
      emit(state.copyWith(status: postAddresultStatus.success));
    } catch (e) {
      emit(state.copyWith(status: postAddresultStatus.error));
    }
  }
}

