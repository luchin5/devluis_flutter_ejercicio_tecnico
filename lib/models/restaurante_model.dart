import 'package:alacarta/models/menu_model.dart';
import 'package:alacarta/models/opening_model.dart';

class RestauranteModel {
  String id;
  String name;
  String description;
  String phone;
  String email;
  String website;
  OpeningHoursModel openinghours;
  List<Menu> menu;

  RestauranteModel({
    required this.id,
    required this.name,
    required this.description,
    required this.phone,
    required this.email,
    required this.website,
    required this.openinghours,
    required this.menu,
  });

  factory RestauranteModel.fromJson(Map<String, dynamic> json) {
    return RestauranteModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      phone: json['phone'],
      email: json['email'],
      website: json['website'],
      openinghours: OpeningHoursModel.fromJson(json['opening_hours']),
      menu: (json['menu'] as List).map((e) => Menu.fromJson(e)).toList(),
    );
  }
}
