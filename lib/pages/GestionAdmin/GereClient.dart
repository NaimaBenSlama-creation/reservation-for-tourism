import 'package:flutter/material.dart';

class ClientListScreen extends StatefulWidget {
  const ClientListScreen({super.key});

  @override
  _ClientListScreenState createState() => _ClientListScreenState();
}

class _ClientListScreenState extends State<ClientListScreen> {
  Color displayColor = Colors.blue;
  bool isHovered1 = false;
  bool isHovered2 = false;
  bool isHovered3 = false;
  bool isHovered4 = false;
  bool isHovered5 = false;

  void changeColor() {
    setState(() {
      displayColor = const Color.fromARGB(255, 121, 117, 117);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/def.png', // Remplacez par le chemin de votre image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour afficher la liste des clients
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered1 ? Color.fromARGB(255, 154, 186, 204) : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/aff.png', // Chemin de l'image pour le premier bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Afficher les clients'),
              onHover: (value) {
                setState(() {
                  isHovered1 = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour modifier les clients
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered2 ? Color.fromARGB(255, 154, 186, 204) : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/modif.png', // Chemin de l'image pour le deuxième bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Modifier les clients'),
              onHover: (value) {
                setState(() {
                  isHovered2 = value;
                });
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour supprimer les clients
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered3 ? Color.fromARGB(255, 154, 186, 204) : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/gomme.png', // Chemin de l'image pour le troisième bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Supprimer les clients'),
              onHover: (value) {
                setState(() {
                  isHovered3 = value;
                });
              },
            ),
             const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour supprimer les clients
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered4  ?Color.fromARGB(255, 154, 186, 204) : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/+.png', // Chemin de l'image pour le troisième bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Ajouter les clients'),
              onHover: (value) {
                setState(() {
                  isHovered4 = value;
                });
              },
            ),
             const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Logique pour supprimer les clients
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered5 ? Color.fromARGB(255, 154, 186, 204) : displayColor,
              ),
              icon: Image.asset(
                'assets/icons/notif.png', // Chemin de l'image pour le troisième bouton
                width: 20,
                height: 20,
              ),
              label: const Text('Envoyer des notifications'),
              onHover: (value) {
                setState(() {
                  isHovered5 = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
