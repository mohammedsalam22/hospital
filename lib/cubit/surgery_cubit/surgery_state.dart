part of 'surgery_cubit.dart';
enum Surgery_Status{
  loading ,
  success ,
  failure ,
  initial,
  deletedone,
  editdone,
}
class SurgeryState extends Equatable{
  final Surgery_Status surgery_status;

  const SurgeryState({required this.surgery_status});
  factory SurgeryState.initial()=> const SurgeryState(surgery_status: Surgery_Status.initial);

  @override
  // TODO: implement props
  List<Object?> get props => [surgery_status];

  SurgeryState copyWith({Surgery_Status? surgery_status}){
    return SurgeryState(surgery_status:surgery_status?? this.surgery_status);
  }
}
