class TestModel {
  final List<Test> tests;

  TestModel({required this.tests});

  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      tests: List<Test>.from(json['tests'].map((x) => Test.fromJson(x))),
    );
  }
}

class Test {
  final String? result;
  final String askTest;
  final int patientID;

  Test({
    this.result,
    required this.askTest,
    required this.patientID,
  });

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      result: json['result'],
      askTest: json['askTest'],
      patientID: json['patientID'],
    );
  }
}