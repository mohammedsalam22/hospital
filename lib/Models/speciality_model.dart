import 'package:equatable/equatable.dart';

class SpecialityModel extends Equatable {
  final int id;
  final String name;
  final int floorID;

  const SpecialityModel({
    required this.id,
    required this.name,
    required this.floorID,
  });

  factory SpecialityModel.fromJson(Map<String, dynamic> json) {
    return SpecialityModel(
      id: json['id'],
      name: json['name'],
      floorID: json['floorID'],
    );
  }

  @override
  List<Object?> get props => [id, name, floorID];
}
