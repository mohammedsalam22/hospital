import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Models/getnotresponseModel.dart';
import '../../data/api/getPatientTest_api.dart';
import '../../data/api/getnotresponse_api.dart';
import 'getnotresponse_State.dart';

class getnotresponseCubit extends Cubit<getnotresponseState> {
  getnotresponseCubit() : super(getnotresponseInitial());

  void fetchTests() async {
    try {
      emit(getnotresponseLoading());  // أرسل حالة التحميل

      // الحصول على البيانات من API وتأكد من تحويلها بشكل صحيح إلى Getnotresponse
      Getnotresponse response = await GetnotresponseApi.fetchgetnotresponse();
      List<PatientTest> tests = response.tests ?? [];  // استخدم النوع الصحيح هنا

      emit(getnotresponseSuccess([response]));  // أرسل حالة النجاح مع البيانات
    } catch (e) {
      emit(getnotresponseError('Failed to load tests: $e'));  // أرسل حالة الخطأ
    }
  }
}


