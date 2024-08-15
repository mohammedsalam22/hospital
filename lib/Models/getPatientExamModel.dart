class Examinations {
  final int doctorID;
  final int patientID;
  final String askExaminations;
  final String? response; // يمكن أن تكون null


  Examinations({
    required this.doctorID,
    required this.patientID,
    required this.askExaminations,
    this.response,

  });

  // Factory method to create an Examination object from JSON
  factory Examinations.fromJson(Map<String, dynamic> json) {
    return Examinations(

      doctorID: json['doctorID'] ?? 0,
      patientID: json['patientID'] ?? 0,
      askExaminations: json['askExaminations'] ?? '',
      response: json['response'],

    );
  }

  // Method to convert an Examination object to JSON
  Map<String, dynamic> toJson() {
    return {

      'doctorID': doctorID,
      'patientID': patientID,
      'askExaminations': askExaminations,
      'response': response,

    };
  }
}
