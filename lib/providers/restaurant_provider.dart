import 'package:alacarta/models/menu_model.dart';
import 'package:alacarta/models/platillo_model.dart';
import 'package:alacarta/models/restaurante_model.dart';
import 'package:alacarta/services/servicio.dart';
import 'package:flutter/material.dart';

class RestaurantProvider extends ChangeNotifier {
  Servicio _miservicio = Servicio();
  RestauranteModel? _restaurante;
  RestauranteModel? get mirestaurante => _restaurante;

  Future<void> getRestaurant() async {
    try {
      _restaurante = await _miservicio.getJsonRestaurante();
      notifyListeners();
    } catch (e) {
      print("Error en la peticion $e");
    }
    notifyListeners();
  }

  void agregarMenu() async {
    try {
      var data = await _miservicio.agregarListaMenu();
      if (data != null) {
        _restaurante?.menu.add(data);
        notifyListeners();
      }
    } catch (e) {
      print("Error en la peticion $e");
    }
  }
}
