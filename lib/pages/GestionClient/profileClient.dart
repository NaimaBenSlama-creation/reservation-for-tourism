import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pfe/pages/GestionClient/modifieprofil.dart';
import 'package:pfe/pages/GestionClient/signin_screen.dart';
import 'package:pfe/pages/GestionClient/suivireservation.dart';


class ProfilClient extends StatefulWidget {
  static const String screenRoute = 'ProfilClient';

  const ProfilClient({Key? key}) : super(key: key);

  @override
  State<ProfilClient> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilClient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white60,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.blue,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Column(
            children:[
              Image.asset(
                'assets/icons/fochka-removebg-preview.png',
              ),
              Text(
                "Profil  Client",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 5),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 35),
          ...customListTiles.map((tile) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Card(
                elevation: 4,
                shadowColor: Colors.black12,
                child: ListTile(
                  leading: Icon(tile.icon),
                  title: Text(tile.title),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => tile.onPressed(context),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class CustomListTile {
  final IconData icon;
  final String title;
  final Function(BuildContext) onPressed;

  CustomListTile({
    required this.icon,
    required this.title,
    required this.onPressed,
  });
}

Future<void> signOut() async {
  await FirebaseAuth.instance.signOut();
  Fluttertoast.showToast(
    msg: 'Déconnexion réussie',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
List<CustomListTile> customListTiles = [
  CustomListTile(
    icon: Icons.insights,
    title: "Suivi Niveaux de fidélité",
    onPressed: (context) {

    },
  ),
  CustomListTile(
    icon: Icons.settings,
    title: "Modifier Profil",
    onPressed: (context) {
      Navigator.pushNamed(context, modifieprofil.screenRoute);
    },
  ),
  CustomListTile(
    icon: Icons.insights,
    title: "Suivi & Supprimer Réservation ",
    onPressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => suivireservation()),
      );
    },
  ),
  CustomListTile(
    title: "Notification",
    icon: CupertinoIcons.bell,
    onPressed: (context) {
      // Code to execute when this item is pressed
    },
  ),
  CustomListTile(
    title: "Supprimer Profil",
    icon: CupertinoIcons.delete,
    onPressed: (context) {
      // Code to execute when this item is pressed
    },
  ),
  CustomListTile(
    title: "Déconnexion",
    icon: CupertinoIcons.arrow_right_arrow_left,
    onPressed: (context) {
      signOut();
      Navigator.pushNamed(context, SignInScreen.screenRoute);
    },
  ),
];
