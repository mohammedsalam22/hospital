class PatientHistoryParams {
  final String smoking;
  final String alcahol;
  final String other;

  PatientHistoryParams({
    required this.smoking,
    required this.alcahol,
    required this.other,
  });

  Map<String, dynamic> toJson() => {
        "smoking": smoking,
        "alcahol": alcahol,
        "other": other,
      };
}
