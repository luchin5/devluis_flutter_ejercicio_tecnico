import 'package:alacarta/models/menu_model.dart';
import 'package:alacarta/models/platillo_model.dart';
import 'package:alacarta/providers/restaurant_provider.dart';
import 'package:alacarta/widgets/cardplatillo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Restaurant> {
  bool isloading = true;
  bool isadd = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(Duration(seconds: 5));
      if (mounted) {
        setState(() => isloading = false);
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        Provider.of<RestaurantProvider>(context, listen: false).getRestaurant();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = context.watch<RestaurantProvider>();
    final restaurante = restaurantProvider.mirestaurante;
    final dias = restaurante?.openinghours.dias ?? {};
    final listaDias = dias.keys.toList();

    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    // print(".............tablet  ?  $isTablet");
    // print(isTablet);

    if (isloading || restaurante == null) {
      return Scaffold(
        backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
        body: const Center(
          child: CircularProgressIndicator(color: Colors.amber),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color.fromRGBO(44, 44, 44, 1),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: isTablet ? 300 : 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('lib/assets/restaurante.jpg'),
                ),
              ),
            ),
            const SizedBox(height: 21),
            Center(
              child: Column(
                children: [
                  Text(
                    restaurante.name,
                    style: TextStyle(
                      fontSize: isTablet ? 40 : 32,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "# ${restaurante.id}",
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text(
              restaurante.description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[700],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  _infoRow(Icons.phone, restaurante.phone),
                  _infoRow(Icons.email_outlined, restaurante.email),
                  _infoRow(Icons.public, restaurante.website),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listaDias.length,
                itemBuilder: (context, index) {
                  final dia = listaDias[index];
                  final horario = dias[dia];
                  return Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Column(
                      children: [
                        Container(
                          width: 99,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              dia,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          horario!,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.amber,
                    thickness: 1,
                    endIndent: 10,
                  ),
                ),
                Text(
                  "Menú",
                  style: TextStyle(fontSize: 25, color: Colors.amber),
                ),
                Expanded(
                  child: Divider(color: Colors.amber, thickness: 1, indent: 10),
                ),
              ],
            ),
            const SizedBox(height: 30),
            for (final menu in restaurante.menu) ...[
              Text(
                menu.category,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: isTablet ? 24 : 20,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: isTablet ? 300 : 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: menu.platillos.length,
                  itemBuilder: (context, index) {
                    final platillo = menu.platillos[index];
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: buildPlatillo(platillo, context),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
            const SizedBox(height: 80),
            const Center(
              child: Text(
                "Disfrute y comparta",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.amber,
        onPressed: () async {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.amber),
              );
            },
          );

          await Future.delayed(const Duration(seconds: 2));

          Navigator.of(context).pop();

          restaurantProvider.agregarMenu();
        },

        icon: const Icon(Icons.add_outlined, color: Colors.black),
        label: const Text("Añadir menú", style: TextStyle(color: Colors.black)),
      ),
    );
  }

  Widget _infoRow(IconData icon, String? text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 10),
        Expanded(
          child: Text(text ?? '-', style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
