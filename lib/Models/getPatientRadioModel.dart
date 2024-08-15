// getPatientRadioModel.dart
class GetPatientRadio {
  final String askRadiographs;
  final String? document;
  final String? image;

  GetPatientRadio({
    required this.askRadiographs,
    this.document,
    this.image,
  });

  factory GetPatientRadio.fromJson(Map<String, dynamic> json) {
    return GetPatientRadio(
      askRadiographs: json['askRadiographs'],
      document: json['document'],
      image: json['image'],
    );
  }
}
