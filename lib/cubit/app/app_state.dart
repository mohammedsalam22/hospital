part of 'app_cubit.dart';

class AppState extends Equatable {
  const AppState({
    required this.status,
    this.patientId,
    required this.allClinicalForm,
    required this.clinicalForm,
    this.clinicalFormModel,
    this.formId,
  });
  final RequestState status;
  final int? patientId;
  final RequestState allClinicalForm;
  final RequestState clinicalForm;
  final ClinicalFormModel? clinicalFormModel;
  final int? formId;

  factory AppState.initial() => const AppState(
        status: RequestState.initial,
        allClinicalForm: RequestState.initial,
        clinicalForm: RequestState.initial,
      );
  AppState copyWith({
    final RequestState? status,
    final int? patientId,
    final RequestState? allClinicalForm,
    final RequestState? clinicalForm,
    final ClinicalFormModel? clinicalFormModel,
    final int? formId,
  }) {
    return AppState(
      status: status ?? this.status,
      patientId: patientId ?? this.patientId,
      allClinicalForm: allClinicalForm ?? this.allClinicalForm,
      clinicalForm: clinicalForm ?? this.clinicalForm,
      clinicalFormModel: clinicalFormModel ?? this.clinicalFormModel,
      formId: formId ?? this.formId,
    );
  }

  @override
  List<Object?> get props => [
        status,
        patientId,
        allClinicalForm,
        clinicalForm,
        clinicalFormModel,
        formId,
      ];
}
