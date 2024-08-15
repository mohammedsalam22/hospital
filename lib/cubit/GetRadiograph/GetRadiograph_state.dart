import 'package:bloc/bloc.dart';

import '../../Models/getPatientRadioModel.dart';
import '../../Models/getradiographModel.dart';


class GetradiographState {}

class GetradiographInitial extends GetradiographState {}

class GetradiographLoading extends GetradiographState {}

class GetradiographSuccess extends GetradiographState {
  final List<Radiograph> getradiographs;

  GetradiographSuccess(this.getradiographs);
}