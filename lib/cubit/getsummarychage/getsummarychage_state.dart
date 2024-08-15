import 'package:bloc/bloc.dart';

import '../../Models/getPatientRadioModel.dart';
import '../../Models/getsummarychagemodel.dart';


class getsummarychargeState {}

class getsummarychargeInitial extends getsummarychargeState {}

class getsummarychargeLoading extends getsummarychargeState {}

class getsummarychargeSuccess extends getsummarychargeState {
  final List<SummaryDischarge> summaryDischarge;

  getsummarychargeSuccess(this.summaryDischarge);
}