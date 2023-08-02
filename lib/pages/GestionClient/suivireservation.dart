import 'package:flutter/material.dart';
import 'package:pfe/pages/GestionClient/reservationspecialhotel.dart';
import 'package:pfe/pages/GestionClient/reservationspecialvoiture.dart';
import 'package:pfe/pages/GestionClient/reservationvoiture.dart';
import 'package:pfe/pages/GestionClient/reservationvol.dart';
import 'reservationhotel.dart';

class suivireservation extends StatelessWidget {
  const suivireservation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/reservation.jpg',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Suivi & Supprimer Réservation:',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => reservationvoiture()),
                        );
                      },
                      child: const Text('Voiture'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => reservationspecialvol()),
                        );
                      },
                      child: const Text('  Vol'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>reservationhotel()),
                        );
                      },
                      child: const Text(' Hôtel'),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>reservationspecialvoiture () ),
                        );
                      },
                      child: const Text('spécial voiture'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => reservationspecialhotel()),
                        );
                      },
                      child: const Text('spécial hôtel'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
