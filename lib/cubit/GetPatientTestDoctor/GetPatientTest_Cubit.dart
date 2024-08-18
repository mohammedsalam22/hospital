import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/getPatientTest_api.dart';
import 'GetPatientTest_State.dart';

class GetPatientTestDoctorCubit extends Cubit<GetPatientTestDoctorState> {
  GetPatientTestDoctorCubit() : super(GetPatientTestInitial());

  void fetchPatientTests() async {
    try {
      emit(GetPatientTestLoading());
      final patientTests = await GetpatientTestApi.fetchGetpatientTest();
      print("Data fetched: $patientTests");  // طباعة البيانات للتحقق
      emit(GetPatientTestSuccess(patientTests));
    } catch (e) {
      print("Error: $e");  // طباعة أي خطأ
      emit(GetPatientTestError(e.toString()));
    }
  }

}
