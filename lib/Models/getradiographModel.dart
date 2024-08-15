class Radiograph {
  final int doctorID;
  final int patientID;
  final String askExaminations;
  final String? response; // يمكن أن تكون null حسب البيانات


  Radiograph({
    required this.doctorID,
    required this.patientID,
    required this.askExaminations,
    this.response,

  });

  factory Radiograph.fromJson(Map<String, dynamic> json) {
    return Radiograph(
      doctorID: json['doctorID'] ?? 0, // افتراض أن ID لا يمكن أن يكون null
      patientID: json['patientID'] ?? 0,
      askExaminations: json['askExaminations'] ?? '',
      response: json['response'], // يمكن أن تكون null
    );
  }

}
