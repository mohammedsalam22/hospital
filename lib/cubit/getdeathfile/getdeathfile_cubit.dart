// death_file_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:waseem/Models/getdeathfileModel.dart';
import '../../data/api/death_file_api.dart';
import '../../data/api/getdeathFile_api.dart';
import 'getdeathfile_state.dart';  // هنا يجب استدعاء API الخاص بك لجلب البيانات

class GetDeathFileCubit extends Cubit<GetDeathFileState> {
  GetDeathFileCubit() : super(GetDeathFileInitial());

  void fetchGetDeathFile() async {
    try {
      emit(GetDeathFileLoading());

      // استدعاء الـ API لجلب البيانات
      final deathFileModel = await GetDeathFileApi.fetchGetDeathFile(); // هنا يجب أن تقوم بإنشاء الـ API الخاص بك
      print(deathFileModel); // تأكد من وجود البيانات هنا

      emit(GetDeathFileSuccess(deathFileModel as List<DeathFileModel>));
    } catch (e) {
      emit(GetDeathFileError(e.toString()));
    }
  }
}
