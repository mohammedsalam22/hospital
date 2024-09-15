class DetailsComplaintParams {
  final String story;
  final String startTime;
  final String startSituation;
  final String catalyst;
  final String remedies;
  final String complentsFrequency;
  final String complentsImprovment;
  final String location;
  final String severity;
  final String movements;
  final String quality;
  final String association;

  DetailsComplaintParams({
    required this.story,
    required this.startTime,
    required this.startSituation,
    required this.catalyst,
    required this.remedies,
    required this.complentsFrequency,
    required this.complentsImprovment,
    required this.location,
    required this.severity,
    required this.movements,
    required this.quality,
    required this.association,
  });

  Map<String, dynamic> toJson() => {
        "complentDetail": {
          "story": story,
          "startTime": startTime,
          "startSituation": startSituation,
          "catalyst": catalyst,
          "remedies": remedies,
          "complentsFrequency": complentsFrequency,
          "complentsImprovment": complentsImprovment,
        },
        "lmsqa": {
          "location": location,
          "severity": severity,
          "movements": movements,
          "quality": quality,
          "association": association,
        },
      };
}
