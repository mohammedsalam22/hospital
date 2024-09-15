class CompanionsComplentsParams {
  final String timeSituation;
  final String catalystRemedies;
  final String frequencyImprovment;
  final String other;

  CompanionsComplentsParams({
    required this.timeSituation,
    required this.catalystRemedies,
    required this.frequencyImprovment,
    required this.other,
  });

  Map<String, dynamic> toJson() => {
        "timeSituation": "timeSituation",
        "catalystRemedies": catalystRemedies,
        "frequencyImprovment": frequencyImprovment,
        "other": other,
      };
}
