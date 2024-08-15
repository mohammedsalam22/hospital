// getPatientRadioModel.dart
class DeathFileModel {
  final DeathFile deathFile;
  final List<MannerOfDeath> mannerOfDeath;
  final List<DeathSigns> deathSigns;
  final List<DeathReasons> deathReasons;

  DeathFileModel({
    required this.deathFile,
    required this.mannerOfDeath,
    required this.deathSigns,
    required this.deathReasons,
  });

  factory DeathFileModel.fromJson(Map<String, dynamic> json) {
    return DeathFileModel(
      deathFile: DeathFile.fromJson(json['deathFile']['deathFile']), // تم التعديل هنا
      mannerOfDeath: (json['deathFile']['mannerOfDeath'] as List)
          .map((item) => MannerOfDeath.fromJson(item))
          .toList(),
      deathSigns: (json['deathFile']['deathSigns'] as List)
          .map((item) => DeathSigns.fromJson(item))
          .toList(),
      deathReasons: (json['deathFile']['deathReasons'] as List)
          .map((item) => DeathReasons.fromJson(item))
          .toList(),
    );
  }


}

class DeathFile {
  final int id;
  final String identityStatus;
  final String temperature;
  final String deathLocation;
  final String deathDate;
  final String deathHour;
  final String doctorName;
  final String fileDate;
  final String deathSeen;
  final int patientID;
  final String createdAt;
  final String updatedAt;

  DeathFile({
    required this.id,
    required this.identityStatus,
    required this.temperature,
    required this.deathLocation,
    required this.deathDate,
    required this.deathHour,
    required this.doctorName,
    required this.fileDate,
    required this.deathSeen,
    required this.patientID,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeathFile.fromJson(Map<String, dynamic> json) {
    return DeathFile(
      id: json['id'],
      identityStatus: json['identityStatus'],
      temperature: json['temperature'],
      deathLocation: json['deathLocation'],
      deathDate: json['deathDate'],
      deathHour: json['deathHour'],
      doctorName: json['doctorName'],
      fileDate: json['fileDate'],
      deathSeen: json['deathSeen'] ?? '',
      patientID: json['patientID'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class MannerOfDeath {
  final int id;
  final int normal;
  final int notSpecified;
  final int nonNormal;
  final int deathFileID;
  final String createdAt;
  final String updatedAt;

  MannerOfDeath({
    required this.id,
    required this.normal,
    required this.notSpecified,
    required this.nonNormal,
    required this.deathFileID,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MannerOfDeath.fromJson(Map<String, dynamic> json) {
    return MannerOfDeath(
      id: json['id'],
      normal: json['normal'],
      notSpecified: json['notSpecified'],
      nonNormal: json['nonNormal'],
      deathFileID: json['deathFileID'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class DeathSigns {
  final int id;
  final String liverMortiseLocation;
  final String liverMortiseImprove;
  final String liverMortiseColor;
  final int liverMortiseRemoved;
  final String rigorMortiseLocation;
  final String dehydration;
  final String lateSigns;
  final int deathFileID;
  final String createdAt;
  final String updatedAt;

  DeathSigns({
    required this.id,
    required this.liverMortiseLocation,
    required this.liverMortiseImprove,
    required this.liverMortiseColor,
    required this.liverMortiseRemoved,
    required this.rigorMortiseLocation,
    required this.dehydration,
    required this.lateSigns,
    required this.deathFileID,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeathSigns.fromJson(Map<String, dynamic> json) {
    return DeathSigns(
      id: json['id'],
      liverMortiseLocation: json['liverMortiseLocation'],
      liverMortiseImprove: json['liverMortiseImprove'],
      liverMortiseColor: json['liverMortiseColor'],
      liverMortiseRemoved: json['liverMortiseRemoved'],
      rigorMortiseLocation: json['rigorMortiseLocation'],
      dehydration: json['dehydration'],
      lateSigns: json['lateSigns'],
      deathFileID: json['deathFileID'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class DeathReasons {
  final int id;
  final String lastMinute;
  final String lastDay;
  final String lastYear;
  final String reasonLastHour;
  final int anatomy;
  final int autopsy;
  final int deathFileID;
  final String createdAt;
  final String updatedAt;

  DeathReasons({
    required this.id,
    required this.lastMinute,
    required this.lastDay,
    required this.lastYear,
    required this.reasonLastHour,
    required this.anatomy,
    required this.autopsy,
    required this.deathFileID,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DeathReasons.fromJson(Map<String, dynamic> json) {
    return DeathReasons(
      id: json['id'],
      lastMinute: json['lastMinute'],
      lastDay: json['lastDay'],
      lastYear: json['lastYear'],
      reasonLastHour: json['reasonLastHour'],
      anatomy: json['anatomy'],
      autopsy: json['autopsy'],
      deathFileID: json['deathFileID'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
