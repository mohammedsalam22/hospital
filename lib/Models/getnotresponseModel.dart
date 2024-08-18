class Getnotresponse {
  List<PatientTest>? tests;

  Getnotresponse({this.tests});

  Getnotresponse.fromJson(Map<String, dynamic> json) {
    if (json['tests'] != null) {
      tests = (json['tests'] as List)
          .map((json) => PatientTest.fromJson(json))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.tests != null) {
      data['tests'] = this.tests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PatientTest {
  int? id;
  String? result;
  String? askTest;
  int? patientID;
  String? createdAt;
  String? updatedAt;

  PatientTest({
    this.id,
    this.result,
    this.askTest,
    this.patientID,
    this.createdAt,
    this.updatedAt,
  });

  PatientTest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    result = json['result'];
    askTest = json['askTest'];
    patientID = json['patientID'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['result'] = this.result;
    data['askTest'] = this.askTest;
    data['patientID'] = this.patientID;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
