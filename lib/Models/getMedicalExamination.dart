class Examination {
  final int doctorID;
  final int patientID;
  final String askExaminations;
  final String? response; // يمكن أن تكون null


  Examination({
    required this.doctorID,
    required this.patientID,
    required this.askExaminations,
    this.response,
  
  });

  // Factory method to create an Examination object from JSON
  factory Examination.fromJson(Map<String, dynamic> json) {
    return Examination(
      doctorID: json['doctorID'],
      patientID: json['patientID'],
      askExaminations: json['askExaminations'],
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
