// ignore_for_file: library_private_types_in_public_api


import 'package:flutter/material.dart';

import 'Ajoute_Partenaire.dart';
import 'Modifie_Partenaire.dart';
import 'Supprimer_Partenaire.dart';

// ignore: camel_case_types
class partenaireListScreen extends StatefulWidget {
  const partenaireListScreen({super.key});

  @override
  _partenaireListScreenState createState() => _partenaireListScreenState();
}

// ignore: camel_case_types
class _partenaireListScreenState extends State<partenaireListScreen> {
  Color displayColor = Colors.blue;
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  bool isHovered4 = false;
  bool isHovered5 = false;

  void changeColor() {
    setState(() {
      displayColor = const Color.fromARGB(255, 255, 153, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gérer le Partenaire'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/part.png', // Remplacez par le chemin de votre image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ModifPartenairesScreen()),
                );
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered2
                    ? const Color.fromARGB(255, 154, 186, 204)
                    : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/modif.png', // Chemin de l'image pour le deuxième bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Modifier un partenaire'),
              onHover: (value) {
                setState(() {
                  isHovered2 = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>  SuppPartenairesScreen()),
                );
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered3
                    ? const Color.fromARGB(255, 154, 186, 204)
                    : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/gomme.png', // Chemin de l'image pour le troisième bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Supprimer un partenaire'),
              onHover: (value) {
                setState(() {
                  isHovered3 = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AjoutPartenairesScreen()),
                );
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered4
                    ? const Color.fromARGB(255, 154, 186, 204)
                    : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/+.png', // Chemin de l'image pour le troisième bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Ajouter un partenaire'),
              onHover: (value) {
                setState(() {
                  isHovered4 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
