class OtherSystemParams {
  final Heead? heead;
  final Neck? neck;
  final Chest? chest;
  final AbdomenArea? abdomenArea;
  final Excretory? excretory;
  final Other? other;

  const OtherSystemParams({
    this.heead,
    this.neck,
    this.chest,
    this.abdomenArea,
    this.excretory,
    this.other,
  });

  Map<String, dynamic> toJson(bool isEdit) {
    if (isEdit) {
      if (heead != null) {
        return {
          "Heead": {
            "headache": heead?.headache ?? 0,
            "vision": heead?.vision ?? 0,
            "earBuzz": heead?.earBuzz ?? 0,
            "rotor": heead?.rotor ?? 0,
            "plaid": heead?.plaid ?? 0,
            "other": heead?.other ?? "",
            "details": heead?.details ?? "",
          },
        };
      }
      if (neck != null) {
        return {
          "neck": {
            "difficulty_Swallowing": neck?.difficultySwallowing ?? 0,
            "senseOfBulging": neck?.senseOfBulging ?? 0,
            "hoarseness": neck?.hoarseness ?? 0,
            "details": neck?.details ?? "",
          },
        };
      }
      if (chest != null) {
        return {
          "chest": {
            "chestgeneral": {
              "chestPain": chest?.chestGeneral.chestPain ?? "",
              "palm": chest?.chestGeneral.palm ?? "",
              "cough": chest?.chestGeneral.cough ?? "",
              "other": chest?.chestGeneral.other ?? "",
            },
            "slipofbreath": {
              "type": chest?.slipOfBreath.type ?? "",
              "degree": chest?.slipOfBreath.degree ?? "",
              "improvement": chest?.slipOfBreath.improvement ?? "",
            },
          },
        };
      }
      if (abdomenArea != null) {
        return {
          "abdomenarea": {
            "nausea": {
              "quantity": abdomenArea?.nausea.quantity ?? "",
              "frequency": abdomenArea?.nausea.frequency ?? "",
              "comfortable": abdomenArea?.nausea.comfortable ?? "",
              "qualities": abdomenArea?.nausea.qualities ?? "",
              "lmsqa": abdomenArea?.nausea.lmsqa ?? "",
            },
            "diarrheal": {
              "quantity": abdomenArea?.diarrheal.quantity ?? "",
              "frequency": abdomenArea?.diarrheal.frequency ?? "",
              "smell": abdomenArea?.diarrheal.smell ?? "",
              "qualities": abdomenArea?.diarrheal.qualities ?? "",
              "lmsqa": abdomenArea?.diarrheal.lmsqa ?? "",
            },
            "constipation": {
              "frequency": abdomenArea?.constipation.frequency ?? "",
              "color": abdomenArea?.constipation.color ?? "",
              "pain": abdomenArea?.constipation.pain ?? "",
              "mandatory": abdomenArea?.constipation.mandatory ?? "",
              "zahir": abdomenArea?.constipation.zahir ?? "",
              "lmsqa": abdomenArea?.constipation.lmsqa ?? "",
            },
          },
        };
      }
      if (excretory != null) {
        return {
          "excretory": {
            "dysuria": excretory?.dysuria ?? 0,
            "urethralStricture": excretory?.urethralStricture ?? 0,
            "urinaryIncontinence": excretory?.urinaryIncontinence ?? 0,
            "overactiveBladder": excretory?.overactiveBladder ?? 0,
          },
        };
      }
      if (other != null) {
        return {
          "Other": {
            "myalgia": other?.myalgia ?? 0,
            "arthralgia": other?.arthralgia ?? 0,
            "peripheralNeuropathy": other?.peripheralNeuropathy ?? 0,
          },
        };
      } else {
        return {};
      }
    } else {
      return {
        "Heead": {
          "headache": heead?.headache ?? 0,
          "vision": heead?.vision ?? 0,
          "earBuzz": heead?.earBuzz ?? 0,
          "rotor": heead?.rotor ?? 0,
          "plaid": heead?.plaid ?? 0,
          "other": heead?.other ?? "",
          "details": heead?.details ?? "",
        },
        "neck": {
          "difficulty_Swallowing": neck?.difficultySwallowing ?? 0,
          "senseOfBulging": neck?.senseOfBulging ?? 0,
          "hoarseness": neck?.hoarseness ?? 0,
          "details": neck?.details ?? "",
        },
        "chest": {
          "chestgeneral": {
            "chestPain": chest?.chestGeneral.chestPain ?? "",
            "palm": chest?.chestGeneral.palm ?? "",
            "cough": chest?.chestGeneral.cough ?? "",
            "other": chest?.chestGeneral.other ?? "",
          },
          "slipofbreath": {
            "type": chest?.slipOfBreath.type ?? "",
            "degree": chest?.slipOfBreath.degree ?? "",
            "improvement": chest?.slipOfBreath.improvement ?? "",
          },
        },
        "abdomenarea": {
          "nausea": {
            "quantity": abdomenArea?.nausea.quantity ?? "",
            "frequency": abdomenArea?.nausea.frequency ?? "",
            "comfortable": abdomenArea?.nausea.comfortable ?? "",
            "qualities": abdomenArea?.nausea.qualities ?? "",
            "lmsqa": abdomenArea?.nausea.lmsqa ?? "",
          },
          "diarrheal": {
            "quantity": abdomenArea?.diarrheal.quantity ?? "",
            "frequency": abdomenArea?.diarrheal.frequency ?? "",
            "smell": abdomenArea?.diarrheal.smell ?? "",
            "qualities": abdomenArea?.diarrheal.qualities ?? "",
            "lmsqa": abdomenArea?.diarrheal.lmsqa ?? "",
          },
          "constipation": {
            "frequency": abdomenArea?.constipation.frequency ?? "",
            "color": abdomenArea?.constipation.color ?? "",
            "pain": abdomenArea?.constipation.pain ?? "",
            "mandatory": abdomenArea?.constipation.mandatory ?? "",
            "zahir": abdomenArea?.constipation.zahir ?? "",
            "lmsqa": abdomenArea?.constipation.lmsqa ?? "",
          },
        },
        "excretory": {
          "dysuria": excretory?.dysuria ?? 0,
          "urethralStricture": excretory?.urethralStricture ?? 0,
          "urinaryIncontinence": excretory?.urinaryIncontinence ?? 0,
          "overactiveBladder": excretory?.overactiveBladder ?? 0,
        },
        "Other": {
          "myalgia": other?.myalgia ?? 0,
          "arthralgia": other?.arthralgia ?? 0,
          "peripheralNeuropathy": other?.peripheralNeuropathy ?? 0,
        },
      };
    }
  }
}

class Heead {
  final int headache;
  final int vision;
  final int earBuzz;
  final int rotor;
  final int plaid;
  final String? other;
  final String? details;

  Heead({
    this.headache = 0,
    this.vision = 0,
    this.earBuzz = 0,
    this.rotor = 0,
    this.plaid = 0,
    this.other,
    this.details,
  });
}

class Neck {
  final int difficultySwallowing;
  final int senseOfBulging;
  final int hoarseness;
  final String? details;

  Neck({
    this.difficultySwallowing = 0,
    this.senseOfBulging = 0,
    this.hoarseness = 0,
    this.details,
  });

  Map<String, dynamic> toJson() {
    return {};
  }
}

class Chest {
  final ChestGeneral chestGeneral;
  final SlipOfBreath slipOfBreath;

  Chest({
    required this.chestGeneral,
    required this.slipOfBreath,
  });

  Map<String, dynamic> toJson() {
    return {
      "chestgeneral": chestGeneral.toJson(),
      "slipofbreath": slipOfBreath.toJson(),
    };
  }
}

class ChestGeneral {
  final String? chestPain;
  final String? palm;
  final String? cough;
  final String? other;

  ChestGeneral({
    this.chestPain,
    this.palm,
    this.cough,
    this.other,
  });

  Map<String, dynamic> toJson() {
    return {
      "chestPain": chestPain,
      "palm": palm,
      "cough": cough,
      "other": other,
    };
  }
}

class SlipOfBreath {
  final String? type;
  final String? degree;
  final String? improvement;

  SlipOfBreath({
    this.type,
    this.degree,
    this.improvement,
  });

  Map<String, dynamic> toJson() {
    return {
      "type": type,
      "degree": degree,
      "improvement": improvement,
    };
  }
}

class AbdomenArea {
  final Nausea nausea;
  final Diarrheal diarrheal;
  final Constipation constipation;

  AbdomenArea({
    required this.nausea,
    required this.diarrheal,
    required this.constipation,
  });

  Map<String, dynamic> toJson() {
    return {
      "nausea": nausea.toJson(),
      "diarrheal": diarrheal.toJson(),
      "constipation": constipation.toJson(),
    };
  }
}

class Nausea {
  final String? quantity;
  final String? frequency;
  final String? comfortable;
  final String? qualities;
  final String? lmsqa;

  Nausea({
    this.quantity,
    this.frequency,
    this.comfortable,
    this.qualities,
    this.lmsqa,
  });

  Map<String, dynamic> toJson() {
    return {
      "quantity": quantity,
      "frequency": frequency,
      "comfortable": comfortable,
      "qualities": qualities,
      "lmsqa": lmsqa,
    };
  }
}

class Diarrheal {
  final String? quantity;
  final String? frequency;
  final String? smell;
  final String? qualities;
  final String? lmsqa;

  Diarrheal({
    this.quantity,
    this.frequency,
    this.smell,
    this.qualities,
    this.lmsqa,
  });

  Map<String, dynamic> toJson() {
    return {
      "quantity": quantity,
      "frequency": frequency,
      "smell": smell,
      "qualities": qualities,
      "lmsqa": lmsqa,
    };
  }
}

class Constipation {
  final String? frequency;
  final String? color;
  final String? pain;
  final String? mandatory;
  final String? zahir;
  final String? lmsqa;

  Constipation({
    this.frequency,
    this.color,
    this.pain,
    this.mandatory,
    this.zahir,
    this.lmsqa,
  });

  Map<String, dynamic> toJson() {
    return {
      "frequency": frequency,
      "color": color,
      "pain": pain,
      "mandatory": mandatory,
      "zahir": zahir,
      "lmsqa": lmsqa,
    };
  }
}

class Excretory {
  final int dysuria;
  final int urethralStricture;
  final int urinaryIncontinence;
  final int overactiveBladder;

  Excretory({
    this.dysuria = 0,
    this.urethralStricture = 0,
    this.urinaryIncontinence = 0,
    this.overactiveBladder = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "dysuria": dysuria,
      "urethralStricture": urethralStricture,
      "urinaryIncontinence": urinaryIncontinence,
      "overactiveBladder": overactiveBladder,
    };
  }
}

class Other {
  final int myalgia;
  final int arthralgia;
  final int peripheralNeuropathy;

  Other({
    this.myalgia = 0,
    this.arthralgia = 0,
    this.peripheralNeuropathy = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "myalgia": myalgia,
      "arthralgia": arthralgia,
      "peripheralNeuropathy": peripheralNeuropathy,
    };
  }
}
