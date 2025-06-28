class OpeningHoursModel {
  final Map<String, String> dias;

  OpeningHoursModel({required this.dias});

  factory OpeningHoursModel.fromJson(Map<String, dynamic> json) {
    return OpeningHoursModel(dias: Map<String, String>.from(json));
  }
}
