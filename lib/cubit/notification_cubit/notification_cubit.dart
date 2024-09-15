import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:waseem/data/repo/notification_repo.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationState.initial());

  var not ;

  Future getPatientByRoom() async {
    not = null ;
    emit(state.copyWith(notificationStatus: NotificationStatus.loading)) ;
    try {
      not = await NotificationRepo.notification();
      print(not) ;
      emit(state.copyWith(notificationStatus: NotificationStatus.success)) ;
    } catch (e) {
      emit(state.copyWith(notificationStatus: NotificationStatus.failure)) ;
    }
  }
}
