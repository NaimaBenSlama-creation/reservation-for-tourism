import 'package:flutter/material.dart';
import 'package:pfe/pages/GestionPartenaire/supprimeroffrespcialhotel.dart';
import 'package:pfe/pages/GestionPartenaire/supprimervoiture.dart';
import 'package:pfe/pages/GestionPartenaire/supprimervol.dart';

import 'SupprimerHotel.dart';
import 'offrespecialvoiture.dart';

class supprimeroffre extends StatelessWidget {
  const supprimeroffre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Image.asset(
                'assets/images/11.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Supprimer une offre de :',
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
                          MaterialPageRoute(builder: (context) =>  supprimervoiture()),
                        );
                      },
                      child: const Text('Supprimer Voiture'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  supprimervol()),
                        );
                      },
                      child: const Text('Vol'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  supprimerhotel() ),
                        );
                      },
                      child: const Text('Supprimer Hôtel'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle special offer for car
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => supprimerspecialvoiture() ),
                        );
                      },
                      child: const Text('Supprimer spécial voiture'),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle special offer for hotel
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => supprimerspecialhotel()),
                        );
                      },
                      child: const Text('Supprimer spécial hôtel'),
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
