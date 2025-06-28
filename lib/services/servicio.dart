import 'package:alacarta/models/menu_model.dart';
import 'package:alacarta/models/restaurante_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class Servicio {
  Future<RestauranteModel?> getJsonRestaurante() async {
    try {
      var res = await rootBundle.loadString('lib/assets/restaurant.json');
      var data = json.decode(res);

      return RestauranteModel.fromJson(data);
    } catch (e) {
      print("Error get service $e");
      //throw Exception("Error get service : ${e}");
    }
    return null;
  }

  Future<Menu?> agregarListaMenu() async {
    try {
      var res = await rootBundle.loadString('lib/assets/menu.json');
      var data = json.decode(res);
      return Menu.fromJson(data);
    } catch (e) {
      print("Error add service $e");
    }
    return null;
  }
}
