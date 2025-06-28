import 'package:alacarta/models/platillo_model.dart';
import 'package:flutter/material.dart';

Widget buildPlatillo(PlatilloModel platilloActual, BuildContext context) {
  final screenWidth = MediaQuery.of(context).size.width;
  final istablet = screenWidth > 600;

  return Container(
    width: istablet ? 595 : 330,
    decoration: BoxDecoration(
      color: const Color.fromRGBO(31, 31, 31, 1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(platilloActual.id, style: const TextStyle(color: Colors.white)),

          // TITULO + PRECIO
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  platilloActual.name,
                  style: TextStyle(
                    fontSize: istablet ? 32 : 24,
                    color: Colors.white,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${platilloActual.precio}",
                    style: TextStyle(
                      fontSize: istablet ? 24 : 18,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    platilloActual.currency,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),

          const SizedBox(height: 8),

          // DESCRIPCIÓN + IMAGEN
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "* ${platilloActual.description}",
                  style: TextStyle(
                    fontSize: istablet ? 20 : 14,
                    color: const Color.fromRGBO(254, 187, 62, 1),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: istablet ? 119 : 70,
                width: istablet ? 119 : 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('lib/assets/platos.png'),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),
          Text(
            platilloActual.vegetarian ? "Vegetariano: Sí" : "Vegetariano: No",
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
