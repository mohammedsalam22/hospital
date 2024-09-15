part of 'clinical_form_cubit.dart';

class ClinicalFormState extends Equatable {
  const ClinicalFormState({
    required this.patientHistoryStatus,
    required this.complentStatus,
    required this.companionsComplentsStatus,
    required this.otherSystemStatus,
  });
  final RequestState patientHistoryStatus;
  final RequestState complentStatus;
  final RequestState companionsComplentsStatus;
  final RequestState otherSystemStatus;

  factory ClinicalFormState.initial() => const ClinicalFormState(
        patientHistoryStatus: RequestState.initial,
        complentStatus: RequestState.initial,
        companionsComplentsStatus: RequestState.initial,
        otherSystemStatus: RequestState.initial,
      );
  ClinicalFormState copyWith({
    final RequestState? patientHistoryStatus,
    final RequestState? complentStatus,
    final RequestState? companionsComplentsStatus,
    final RequestState? otherSystemStatus,
  }) {
    return ClinicalFormState(
      patientHistoryStatus: patientHistoryStatus ?? this.patientHistoryStatus,
      complentStatus: complentStatus ?? this.complentStatus,
      companionsComplentsStatus:
          companionsComplentsStatus ?? this.companionsComplentsStatus,
      otherSystemStatus: otherSystemStatus ?? this.otherSystemStatus,
    );
  }

  @override
  List<Object?> get props => [
        patientHistoryStatus,
        complentStatus,
        companionsComplentsStatus,
        otherSystemStatus
      ];
}
