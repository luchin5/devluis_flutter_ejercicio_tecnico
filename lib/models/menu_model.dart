import 'package:alacarta/models/platillo_model.dart';

class Menu {
  String category;
  List<PlatilloModel> platillos;

  Menu({required this.category, required this.platillos});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      category: json['category'],
      platillos:
          (json['items'] as List)
              .map((e) => PlatilloModel.fromJson(e))
              .toList(),
    );
  }
}
