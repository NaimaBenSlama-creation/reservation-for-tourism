import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SendNotificationScreen extends StatefulWidget {
  const SendNotificationScreen({Key? key}) : super(key: key);

  @override
  _SendNotificationScreenState createState() => _SendNotificationScreenState();
}

class _SendNotificationScreenState extends State<SendNotificationScreen> {
  Color displayColor = Colors.blue;
  bool isHovered = false;

  void changeColor() {
    setState(() {
      displayColor = const Color.fromARGB(255, 121, 117, 117);
    });
  }

  void sendNotification() {
    // Ajoutez ici votre logique pour l'envoi de notifications push aux clients
    Fluttertoast.showToast(
      msg: 'Notification envoyée avec succès!',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white,
    );
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
              'assets/images/notification.png', // Chemin de l'icône de notification
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              'Envoyer une notification',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Contenu de la notification',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.notification_important), // Icône du champ de texte
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                sendNotification();
                changeColor();
              },
              style: ElevatedButton.styleFrom(
                primary: isHovered ? const Color.fromARGB(255, 154, 186, 204) : displayColor,
              ),
              child: const Text('Envoyer'),
              onHover: (value) {
                setState(() {
                  isHovered = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
