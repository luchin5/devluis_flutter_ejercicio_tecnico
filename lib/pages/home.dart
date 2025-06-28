import 'package:alacarta/pages/restaurant.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset('lib/assets/platos.png', fit: BoxFit.cover),
            ),

            // Contenido principal
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 165),
                  Text(
                    'A la carta',
                    style: TextStyle(
                      color: const Color.fromRGBO(254, 187, 62, 1),
                      fontSize: isTablet ? 60 : 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Lo mejor en su paladar',
                    style: TextStyle(
                      color: const Color.fromRGBO(254, 187, 62, 1),
                      fontSize: isTablet ? 24 : 15,
                    ),
                  ),
                  SizedBox(height: isTablet ? 400 : 570),
                  SizedBox(
                    width: screenWidth - 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(254, 187, 62, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Restaurant()),
                        );
                      },
                      child: const Text(
                        'Bienvenido',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
