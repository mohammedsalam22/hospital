class ClinicalFormModel {
  final DemographInfo? demographInfo;
  final PatientsHistorys? patientsHistorys;
  final ComplentDetail? complentDetail;
  final OtherSystem? otherSystem;

  ClinicalFormModel({
    this.demographInfo,
    this.patientsHistorys,
    this.complentDetail,
    this.otherSystem,
  });

  factory ClinicalFormModel.fromJson(Map<String, dynamic> json) {
    return ClinicalFormModel(
      // demographInfo: json['demographInfo'] != null
      //     ? DemographInfo.fromJson(json['demographInfo'])
      //     : null,
      patientsHistorys: json['patientsHistorys'] != null
          ? PatientsHistorys.fromJson(json['patientsHistorys'])
          : null,
      complentDetail: json['complentDetail'] != null
          ? ComplentDetail.fromJson(json['complentDetail'])
          : null,
      otherSystem: json['othersystem'] != null
          ? OtherSystem.fromJson(json['othersystem'])
          : null,
    );
  }
}

class DemographInfo {
  final int id;
  final String fullName;
  final String phoneNumber;
  final String fatherName;
  final String motherName;
  final String internationalNumber;
  final String currentLocation;
  final DateTime birthdate;
  final int gender;
  final String work;
  final String socialStatus;
  // final String? deletedAt;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  DemographInfo({
    required this.id,
    required this.fullName,
    required this.phoneNumber,
    required this.fatherName,
    required this.motherName,
    required this.internationalNumber,
    required this.currentLocation,
    required this.birthdate,
    required this.gender,
    required this.work,
    required this.socialStatus,
    // this.deletedAt,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory DemographInfo.fromJson(Map<String, dynamic> json) {
    return DemographInfo(
      id: json['id'],
      fullName: json['fullName'],
      phoneNumber: json['phoneNumber'],
      fatherName: json['fatherName'],
      motherName: json['motherName'],
      internationalNumber: json['internationalNumber'],
      currentLocation: json['currentLocation'],
      birthdate: DateTime.parse(json['birthdate']),
      gender: json['gender'],
      work: json['work'],
      socialStatus: json['socialStatus'],
      // deletedAt: json['deleted_at'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class PatientsHistorys {
  final int id;
  final String smoking;
  final String alcahol;
  final String other;
  // final int clinicalFormID;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  PatientsHistorys({
    required this.id,
    required this.smoking,
    required this.alcahol,
    required this.other,
    // required this.clinicalFormID,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory PatientsHistorys.fromJson(Map<String, dynamic> json) {
    return PatientsHistorys(
      id: json['id'],
      smoking: json['smoking'],
      alcahol: json['alcahol'],
      other: json['other'],
      // clinicalFormID: json['clinicalFormID'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class ComplentDetail {
  final int id;
  final String story;
  final String startTime;
  final String startSituation;
  final String catalyst;
  final String remedies;
  final String complentsFrequency;
  final String complentsImprovment;
  final int clinicalFormID;
  // final DateTime createdAt;
  // final DateTime updatedAt;
  final LMSQA? lmsqa;
  final List<CompanionComplent>? companionComplent;

  ComplentDetail({
    required this.id,
    required this.story,
    required this.startTime,
    required this.startSituation,
    required this.catalyst,
    required this.remedies,
    required this.complentsFrequency,
    required this.complentsImprovment,
    required this.clinicalFormID,
    // required this.createdAt,
    // required this.updatedAt,
    this.lmsqa,
    this.companionComplent,
  });

  factory ComplentDetail.fromJson(Map<String, dynamic> json) {
    var companionComplentList = json['CompanionComplent'] as List?;
    return ComplentDetail(
      id: json['id'],
      story: json['story'],
      startTime: json['startTime'],
      startSituation: json['startSituation'],
      catalyst: json['catalyst'],
      remedies: json['remedies'],
      complentsFrequency: json['complentsFrequency'],
      complentsImprovment: json['complentsImprovment'] ?? "",
      clinicalFormID: json['clinicalFormID'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
      lmsqa: json['lmsqa'] != null ? LMSQA.fromJson(json['lmsqa']) : null,
      companionComplent: companionComplentList != null
          ? companionComplentList
              .map((item) => CompanionComplent.fromJson(item))
              .toList()
          : [],
    );
  }
}

class LMSQA {
  final int id;
  final String location;
  final String severity;
  final String movements;
  final String quality;
  final String association;
  final int complentdetailID;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  LMSQA({
    required this.id,
    required this.location,
    required this.severity,
    required this.movements,
    required this.quality,
    required this.association,
    required this.complentdetailID,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory LMSQA.fromJson(Map<String, dynamic> json) {
    return LMSQA(
      id: json['id'],
      location: json['location'],
      severity: json['severity'],
      movements: json['movements'],
      quality: json['quality'],
      association: json['association'],
      complentdetailID: json['complentdetailID'],
      // createdAt: DateTime.parse(json['created_at']),
      // updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class CompanionComplent {
  final int id;
  final String timeSituation;
  final String catalystRemedies;
  final String frequencyImprovment;
  final String other;
  final int complentdetailID;
  // final DateTime createdAt;
  // final DateTime updatedAt;

  CompanionComplent({
    required this.id,
    required this.timeSituation,
    required this.catalystRemedies,
    required this.frequencyImprovment,
    required this.other,
    required this.complentdetailID,
    // required this.createdAt,
    // required this.updatedAt,
  });

  factory CompanionComplent.fromJson(Map<String, dynamic> json) {
    return CompanionComplent(
      id: json['id'],
      timeSituation: json['timeSituation'],
      catalystRemedies: json['catalystRemedies'],
      frequencyImprovment: json['frequencyImprovment'],
      other: json['other'] ?? "",
      complentdetailID: json['complentdetailID'],
      //   createdAt: DateTime.parse(json['created_at']),
      //   updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}

class OtherSystem {
  final int id;
  final Head? head;
  final Neck? neck;
  final Chest? chest;
  final AbdomenArea? abdomenArea;
  final Excretorie? excretorie;
  final Other? other;

  OtherSystem({
    required this.id,
    this.head,
    this.neck,
    this.chest,
    this.abdomenArea,
    this.excretorie,
    this.other,
  });

  factory OtherSystem.fromJson(Map<String, dynamic> json) {
    return OtherSystem(
      id: json['id'],
      head: json['head'] != null ? Head.fromJson(json['head']) : null,
      neck: json['neck'] != null ? Neck.fromJson(json['neck']) : null,
      chest: json['chest'] != null ? Chest.fromJson(json['chest']) : null,
      abdomenArea: json['AbdomenArea'] != null
          ? AbdomenArea.fromJson(json['AbdomenArea'])
          : null,
      excretorie: json['excretorie'] != null
          ? Excretorie.fromJson(json['excretorie'])
          : null,
      other: json['other'] != null ? Other.fromJson(json['other']) : null,
    );
  }
}

class Head {
  int id;
  int headache;
  int vision;
  int earBuzz;
  int rotor;
  int plaid;
  int other;
  String details;

  Head({
    required this.id,
    required this.headache,
    required this.vision,
    required this.earBuzz,
    required this.rotor,
    required this.plaid,
    required this.other,
    required this.details,
  });

  factory Head.fromJson(Map<String, dynamic> json) {
    return Head(
      id: json['id'],
      headache: json['headache'],
      vision: json['vision'],
      earBuzz: json['earBuzz'],
      rotor: json['rotor'],
      plaid: json['plaid'],
      other: json['other'],
      details: json['details'],
    );
  }
}

class Neck {
  int id;
  int difficultySwallowing;
  int senseOfBulging;
  int hoarseness;
  String details;

  Neck({
    required this.id,
    required this.difficultySwallowing,
    required this.senseOfBulging,
    required this.hoarseness,
    required this.details,
  });

  factory Neck.fromJson(Map<String, dynamic> json) {
    return Neck(
      id: json['id'],
      difficultySwallowing: json['difficulty_Swallowing'],
      senseOfBulging: json['senseOfBulging'],
      hoarseness: json['hoarseness'],
      details: json['details'],
    );
  }
}

class Chest {
  int id;
  String chestPain;
  String palm;
  String cough;
  String other;
  SlipOfBreath? slipOfBreath;

  Chest({
    required this.id,
    required this.chestPain,
    required this.palm,
    required this.cough,
    required this.other,
    this.slipOfBreath,
  });

  factory Chest.fromJson(Map<String, dynamic> json) {
    return Chest(
      id: json['id'],
      chestPain: json['chestPain'],
      palm: json['palm'],
      cough: json['cough'],
      other: json['other'],
      slipOfBreath: json['slipOfBreath'] != null
          ? SlipOfBreath.fromJson(json['slipOfBreath'])
          : null,
    );
  }
}

class SlipOfBreath {
  int id;
  String type;
  String degree;
  String improvement;

  SlipOfBreath({
    required this.id,
    required this.type,
    required this.degree,
    required this.improvement,
  });

  factory SlipOfBreath.fromJson(Map<String, dynamic> json) {
    return SlipOfBreath(
      id: json['id'],
      type: json['type'],
      degree: json['degree'],
      improvement: json['improvement'],
    );
  }
}

class AbdomenArea {
  int id;
  Nausea? nausea;
  Diarrheal? diarrheal;
  Constipation? constipation;

  AbdomenArea({
    required this.id,
    this.nausea,
    this.diarrheal,
    this.constipation,
  });

  factory AbdomenArea.fromJson(Map<String, dynamic> json) {
    return AbdomenArea(
      id: json['id'],
      nausea: json['nausea'] != null ? Nausea.fromJson(json['nausea']) : null,
      diarrheal: json['diarrheal'] != null
          ? Diarrheal.fromJson(json['diarrheal'])
          : null,
      constipation: json['constipation'] != null
          ? Constipation.fromJson(json['constipation'])
          : null,
    );
  }
}

class Nausea {
  int id;
  String quantity;
  String frequency;
  String comfortable;
  String qualities;
  String lmsqa;

  Nausea({
    required this.id,
    required this.quantity,
    required this.frequency,
    required this.comfortable,
    required this.qualities,
    required this.lmsqa,
  });

  factory Nausea.fromJson(Map<String, dynamic> json) {
    return Nausea(
      id: json['id'],
      quantity: json['quantity'],
      frequency: json['frequency'],
      comfortable: json['comfortable'],
      qualities: json['qualities'],
      lmsqa: json['lmsqa'],
    );
  }
}

class Diarrheal {
  int id;
  String quantity;
  String frequency;
  String smell;
  String qualities;
  String lmsqa;

  Diarrheal({
    required this.id,
    required this.quantity,
    required this.frequency,
    required this.smell,
    required this.qualities,
    required this.lmsqa,
  });

  factory Diarrheal.fromJson(Map<String, dynamic> json) {
    return Diarrheal(
      id: json['id'],
      quantity: json['quantity'],
      frequency: json['frequency'],
      smell: json['smell'],
      qualities: json['qualities'],
      lmsqa: json['lmsqa'],
    );
  }
}

class Constipation {
  int id;
  String frequency;
  String color;
  String pain;
  String mandatory;
  String zahir;
  String lmsqa;

  Constipation({
    required this.id,
    required this.frequency,
    required this.color,
    required this.pain,
    required this.mandatory,
    required this.zahir,
    required this.lmsqa,
  });

  factory Constipation.fromJson(Map<String, dynamic> json) {
    return Constipation(
      id: json['id'],
      frequency: json['frequency'],
      color: json['color'],
      pain: json['pain'],
      mandatory: json['mandatory'],
      zahir: json['zahir'],
      lmsqa: json['lmsqa'],
    );
  }
}

class Excretorie {
  int id;
  final int dysuria;
  final int urethralStricture;
  final int urinaryIncontinence;
  final int overactiveBladder;
  final int otherID;
  Excretorie({
    required this.id,
    required this.dysuria,
    required this.urethralStricture,
    required this.urinaryIncontinence,
    required this.overactiveBladder,
    required this.otherID,
  });

  factory Excretorie.fromJson(Map<String, dynamic> json) {
    return Excretorie(
      id: json['id'],
      dysuria: json["dysuria"],
      urethralStricture: json["urethralStricture"],
      urinaryIncontinence: json["urinaryIncontinence"],
      overactiveBladder: json["overactiveBladder"],
      otherID: json["otherID"],
    );
  }
}

class Other {
  final int id;
  final int myalgia;
  final int arthralgia;
  final int peripheralNeuropathy;
  final int otherID;
  Other({
    required this.id,
    required this.myalgia,
    required this.arthralgia,
    required this.peripheralNeuropathy,
    required this.otherID,
  });

  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
      id: json['id'],
      myalgia: json["myalgia"],
      arthralgia: json["arthralgia"],
      peripheralNeuropathy: json["peripheralNeuropathy"],
      otherID: json["otherID"],
    );
  }
}

// باقي الكلاسات مشابهة ويجب تعريفها بنفس النمط
