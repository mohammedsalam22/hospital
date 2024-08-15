// getPatientRadioModel.dart
class summarychargeModel {
  final String specialistDoctor;
  final String inChargeDoctor;
  final String finall;
  final String entryReason;
  final String summaryStory;
  final String finalSituation;
  final String guidelines;

  summarychargeModel({
    required this.specialistDoctor,
    required this.inChargeDoctor,
    required this.finall,
    required this.entryReason,
    required this.summaryStory,
    required this.finalSituation,
    required this.guidelines,
  });

  factory summarychargeModel.fromJson(Map<String, dynamic> json) {
    return summarychargeModel(
      specialistDoctor: json['specialistDoctor'],
      inChargeDoctor: json['inChargeDoctor'],
      finall: json['final'],
      entryReason: json['entryReason'],
      summaryStory: json['summaryStory'],
      finalSituation: json['finalSituation'],
      guidelines: json['guidelines'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'specialistDoctor': specialistDoctor,
      'inChargeDoctor': inChargeDoctor,
      'final': finall,
      'entryReason': entryReason,
      'summaryStory': summaryStory,
      'finalSituation': finalSituation,
      'guidelines': guidelines,
    };
  }
}
