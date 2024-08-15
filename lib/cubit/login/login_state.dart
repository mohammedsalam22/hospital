part of 'login_cubit.dart';

class LoginState extends Equatable {
  final RequestState status;
  final Auth? user;
  final RequestState statusGetSpeciality;
  final List<SpecialityModel> speciality;

  const LoginState({
    required this.status,
    this.user,
    required this.statusGetSpeciality,
    required this.speciality,
  });

  factory LoginState.initial() => const LoginState(
        status: RequestState.initial,
        statusGetSpeciality: RequestState.initial,
        speciality: [],
      );

  LoginState copyWith({
    final RequestState? status,
    final Auth? user,
    final RequestState? statusGetSpeciality,
    final List<SpecialityModel>? speciality,
  }) {
    return LoginState(
      status: status ?? this.status,
      user: user ?? this.user,
      statusGetSpeciality: statusGetSpeciality ?? this.statusGetSpeciality,
      speciality: speciality ?? this.speciality,
    );
  }

  @override
  List<Object?> get props => [
        status,
        user,
        statusGetSpeciality,
        speciality,
      ];
}
