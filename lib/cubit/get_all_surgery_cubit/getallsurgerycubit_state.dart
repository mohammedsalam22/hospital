part of 'getallsurgerycubit_cubit.dart';


enum GetallsurgerycubitStatus {
  loading ,
  success ,
  failure ,
  initial
}

class GetallsurgerycubitState extends Equatable {
  final GetallsurgerycubitStatus getallsurgerycubitStatus ;

  const GetallsurgerycubitState({required this.getallsurgerycubitStatus}) ;

  factory GetallsurgerycubitState.initial() => const GetallsurgerycubitState(getallsurgerycubitStatus: GetallsurgerycubitStatus.initial) ;

  @override
  List<Object?> get props => [getallsurgerycubitStatus];

  GetallsurgerycubitState copyWith({GetallsurgerycubitStatus? getallsurgerycubitStatus}) {
    return GetallsurgerycubitState(getallsurgerycubitStatus: getallsurgerycubitStatus ?? this.getallsurgerycubitStatus) ;
  }

}