part of 'notification_cubit.dart';

enum NotificationStatus {
  loading ,
  success ,
  successI ,
  failure ,
  initial
}

class NotificationState extends Equatable {
  final NotificationStatus notificationStatus ;

  const NotificationState({required this.notificationStatus}) ;

  factory NotificationState.initial() => const NotificationState(notificationStatus: NotificationStatus.initial) ;

  @override
  List<Object?> get props => [notificationStatus];

  NotificationState copyWith({NotificationStatus? notificationStatus}) {
    return NotificationState(notificationStatus: notificationStatus ?? this.notificationStatus) ;
  }
}
