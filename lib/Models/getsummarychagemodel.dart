class SummaryDischarge {

  final String inChargeDoctor;
  final String finalDiagnosis;
  final String entryReason;
  final String summaryStory;
  final String? tests;
  final String? procedures;
  final String? surgeons;
  final String? treatments;
  final String finalSituation;
  final String guidelines;


  SummaryDischarge({

    required this.inChargeDoctor,
    required this.finalDiagnosis,
    required this.entryReason,
    required this.summaryStory,
   this.tests,
    this.procedures,
    this.surgeons,
    this.treatments,
    required this.finalSituation,
    required this.guidelines,

  });

  factory SummaryDischarge.fromJson(Map<String, dynamic> json) {
    return SummaryDischarge(

      inChargeDoctor: json['inChargeDoctor'],
      finalDiagnosis: json['final'],
      entryReason: json['entryReason'],
      summaryStory: json['summaryStory'],
      tests: json['tests'],
      procedures: json['procedures'],
      surgeons: json['surgeons'],
      treatments: json['treatments'],
      finalSituation: json['finalSituation'] ?? '',
      guidelines: json['guidelines'],

    );
  }
}
