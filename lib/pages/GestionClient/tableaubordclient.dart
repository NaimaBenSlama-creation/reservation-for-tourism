import 'package:flutter/material.dart';
import '../../home/cartefidelite.dart';
import '../home cars/homeoffresoecialvoiture.dart';
import '../homehotel/homespecialhotel.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>specialHotels(),
                          ),
                        );
                      },
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 18.0),
                            child: Image.asset(
                              'assets/images/offres_speciales.png',
                              width: 100, // Réduire la largeur de l'image
                            ),
                          ),
                          const Text('Offres Spéciales Hotels'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>BarcodeScanner(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18.0),
                      child: Image.asset(
                        'assets/images/niv_fidelite.png',
                        width: 100, // Réduire la largeur de l'image
                      ),
                    ),
                    const Text('Niveau de Fidélité'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => specialvoiture(),
                    ),
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 18.0),
                      child: Image.asset(
                        'assets/images/i30n.png',
                        width: 120, // Réduire la largeur de l'image
                      ),
                    ),
                    const Text('Offres Spéciales voitures'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


