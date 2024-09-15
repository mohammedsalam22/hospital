/*
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/data/repo/login_repo.dart';

import 'package:waseem/shared/sharedComponent/constant.dart';

import '../../Models/auth_model.dart';
import '../../Models/speciality_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login({
    required String password,
    required String type,
    int? specialist,
  }) async {
    emit(state.copyWith(status: RequestState.loading));
    try {
      print("ddddd");
      final result = await LoginRepo.login(
        password: password,
        type: type,
        specialist: specialist,
      );
      final auth = Auth.fromJson(result);
      emit(state.copyWith(status: RequestState.success, user: auth));
    } catch (e) {
      emit(state.copyWith(status: RequestState.error));
    }
  }

  Future getSpeciality() async {
    emit(state.copyWith(statusGetSpeciality: RequestState.loading));
    try {
      print("ddddd");
      List<dynamic> result = await LoginRepo.getSpeciality();
      final List<SpecialityModel> l = List.from(result.map(
        (e) => SpecialityModel.fromJson(e),
      ));
      emit(state.copyWith(
          statusGetSpeciality: RequestState.success, speciality: l));
    } catch (e) {
      emit(state.copyWith(statusGetSpeciality: RequestState.error));
    }
  }
}
*/
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waseem/component/id.dart';
import 'package:waseem/data/repo/login_repo.dart';
import 'package:waseem/shared/sharedComponent/constant.dart';

import '../../Models/auth_model.dart';
import '../../Models/speciality_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../../component/token.dart';
import '../../shared/shared network/remote/api_constant.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState.initial());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login({
    required String password,
    required String type,
    int? specialist,
  }) async {
    emit(state.copyWith(status: RequestState.loading));
    try {
      print("Logging in with: password=$password, type=$type, specialist=$specialist"); // طباعة البيانات المرسلة
      final result = await LoginRepo.login(
        password: password,
        type: type,
        specialist: specialist??0,
      );
      print('s') ;
      IO.Socket socket = IO.io(ApiConstant.base, <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': true,
      });
      Id.id = result['user']['id'] ;
      Token.token = result['token'] ;
      Token.type = type ;
      print("Login result: $result"); // طباعة الاستجابة
      // final auth = Auth.fromJson(result);
      socket.emit('join' , Id.id) ;
      print('ss') ;
      emit(state.copyWith(status: RequestState.success));
    } catch (e) {
      print('Login Error: $e');
      emit(state.copyWith(status: RequestState.error));
    }
  }

  Future getSpeciality() async {
    emit(state.copyWith(statusGetSpeciality: RequestState.loading));
    try {
      print("Fetching specialties..."); // طباعة رسالة بدء جلب التخصصات
      List<dynamic> result = await LoginRepo.getSpeciality();
      print("Specialties result: $result"); // طباعة الاستجابة
      final List<SpecialityModel> l = List.from(result.map(
            (e) => SpecialityModel.fromJson(e),
      ));
      emit(state.copyWith(
          statusGetSpeciality: RequestState.success, speciality: l));
    } catch (e) {
      print('Fetch Specialties Error: $e'); // طباعة الأخطاء للتعامل معها
      emit(state.copyWith(statusGetSpeciality: RequestState.error));
    }


  Future<void> getSpeciality() async {
    emit(state.copyWith(statusGetSpeciality: RequestState.loading));

    try {
      final result = await LoginRepo.getSpeciality();

      // طباعة البيانات المستلمة من LoginRepo
      print("LoginCubit getSpeciality response:");
      print(result);

      final List<SpecialityModel> l = List.from(result.map(
            (e) => SpecialityModel.fromJson(e),
      ));
      emit(state.copyWith(
          statusGetSpeciality: RequestState.success, speciality: l));
    } catch (e) {
      print("LoginCubit error: $e");
      emit(state.copyWith(statusGetSpeciality: RequestState.error));
    }
  }
}}
