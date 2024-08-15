class Auth {
  final String message;
  final User user;
  final String token;

  const Auth({
    required this.message,
    required this.user,
    required this.token,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => Auth(
        message: json['message'],
        user: User.fromJson(json['user']),
        token: json['token'],
      );
}

class User {
  final int id;
  final int userID;
  final int specialistsID;
  final String name;
  final String fullName;
  final String fatherName;
  final String motherName;
  final String phoneNumber;
  final String internationalNumber;
  final String currentLocation;
  final String birthdate;
  final int gender;
  final String type;

  User({
    required this.id,
    required this.userID,
    required this.specialistsID,
    required this.name,
    required this.fullName,
    required this.fatherName,
    required this.motherName,
    required this.phoneNumber,
    required this.internationalNumber,
    required this.currentLocation,
    required this.birthdate,
    required this.gender,
    required this.type,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        userID: json['userID'],
        specialistsID: json['specialistsID'],
        name: json['name'],
        fullName: json['fullName'],
        fatherName: json['fatherName'],
        motherName: json['motherName'],
        phoneNumber: json['phoneNumber'],
        internationalNumber: json['internationalNumber'],
        currentLocation: json['currentLocation'],
        birthdate: json['birthdate'],
        gender: json['gender'],
        type: json['type'],
      );
}
