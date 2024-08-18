
import 'package:bloc/bloc.dart';

import '../../data/repo/NeckExam_Repo.dart';
import '../addVital/addVital_state.dart';
import 'add_neck_examination_State.dart';

/*"carotidArtery" : null ,//enum
"jugularVein" : null , //enum
"lymphNodes" : "hghgh" ,
"neckStiffenss" : null , //bool
"pembertonsSign" : false , //bool
"thyroid_gland_testing" : true //bool*/

class addNeckExamCubit extends Cubit<addNeckExamState> {
  addNeckExamCubit() : super(addNeckExamState.initial());

  Future createaddNeckExam(
String carotidArtery,
      String jugularVein,
      String lymphNodes,
bool neckStiffenss,
      bool pembertonsSign,

      bool thyroid_gland_testing,


      ) async {
    emit(state.copyWith(status: addNeckExamStatus.loading));
    try {
      print("eeeeeeeeeeeeeeeeeeee");
      await addNeckExamRepo.createNeckexam
        (
         carotidArtery,
         jugularVein,
         lymphNodes,
         neckStiffenss,
         pembertonsSign,
         thyroid_gland_testing,

      );
      emit(state.copyWith(status: addNeckExamStatus.success));
    } catch (e) {
      emit(state.copyWith(status: addNeckExamStatus.error));
    }
  }
}


