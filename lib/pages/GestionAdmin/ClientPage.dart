
import 'package:pfe/pages/GestionAdmin/Notification.dart';
import 'package:flutter/material.dart';
import 'Ajoute_Client.dart';
import 'Modifie_Client.dart';
import 'Supprimer_Client.dart';

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
      displayColor = Color.fromARGB(255, 255, 153, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gérer les Client'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/cliente.png', // Remplacez par le chemin de votre image
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ModifierClientScreen()),
                        );
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
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  SupprimerClientScreen()),
                        );
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
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AjoutClientScreen()),
                        );
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
                Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SendNotificationScreen()),
                        );
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
              label: const Text('Envoyer des notifications '),
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
