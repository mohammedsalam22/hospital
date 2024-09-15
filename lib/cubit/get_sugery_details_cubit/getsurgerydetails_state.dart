part of 'getsurgerydetails_cubit.dart';



enum GetsurgerydetailsStatus {
  loading ,
  success ,
  failure ,
  initial
}

class GetsurgerydetailsState extends Equatable {
  final GetsurgerydetailsStatus getsurgerydetailsStatus ;

  const GetsurgerydetailsState({required this.getsurgerydetailsStatus}) ;

  factory GetsurgerydetailsState.initial() => const GetsurgerydetailsState(getsurgerydetailsStatus: GetsurgerydetailsStatus.initial) ;

  @override
  List<Object?> get props => [getsurgerydetailsStatus];

  GetsurgerydetailsState copyWith({GetsurgerydetailsStatus? getsurgerydetailsStatus}) {
    return GetsurgerydetailsState(getsurgerydetailsStatus: getsurgerydetailsStatus ?? this.getsurgerydetailsStatus) ;
  }

}