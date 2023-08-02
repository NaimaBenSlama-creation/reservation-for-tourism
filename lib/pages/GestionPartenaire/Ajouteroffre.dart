import 'package:pfe/pages/GestionPartenaire/partenaire_Special_hotel.dart';
import 'package:pfe/pages/GestionPartenaire/partenaire_Special_voiture.dart';
import 'package:pfe/pages/GestionPartenaire/partenaire_hotel.dart';
import 'package:pfe/pages/GestionPartenaire/partenaire_voiture.dart';
import 'package:pfe/pages/GestionPartenaire/partenaire_vol.dart';
import 'package:flutter/material.dart';

class Ajouteroffre extends StatelessWidget {
  const  Ajouteroffre({Key? key}) : super(key: key);

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
              margin: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/11.png',
                fit: BoxFit.cover,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'Ajouter une offre de :',
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
                          MaterialPageRoute(builder: (context) => VoitureOfferForm()),
                        );
                      },
                      child: const Text('Voiture'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VolOfferForm()),
                        );
                      },
                      child: const Text('Vol'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HotelOfferForm()),
                        );
                      },
                      child: const Text('Hôtel'),
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
                          MaterialPageRoute(builder: (context) => SpecialVoitureOffer()),
                        );
                      },
                      child: const Text('Offre spéciale voiture'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Handle special offer for hotel
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SpecialHotelOffer()),
                        );
                      },
                      child: const Text('Offre spéciale hôtel'),
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
