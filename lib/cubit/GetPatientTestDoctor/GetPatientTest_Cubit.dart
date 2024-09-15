import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/getPatientTest_api.dart';
import 'GetPatientTest_State.dart';

class GetPatientTestDoctorCubit extends Cubit<GetPatientTestDoctorState> {
  GetPatientTestDoctorCubit() : super(GetPatientTestInitial());

  var rr ;

  void fetchPatientTests() async {
    try {
      emit(GetPatientTestLoading());
      rr =  await GetpatientTestApi.fetchGetpatientTest();
      emit(GetPatientTestSuccess());
    } catch (e) {
      print("Error: $e");  // طباعة أي خطأ
      emit(GetPatientTestError());
    }
  }

}
