import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../home/tabs_screen.dart';
import '../GestionClient/signin_screen.dart';
import 'Ajouteroffre.dart';
import 'Supprimeroffre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class profilpartenaire extends StatefulWidget {
   profilpartenaire({Key? key}) : super(key: key);

  @override
  State<profilpartenaire> createState() => _profilpartenaireState();
}

class _profilpartenaireState extends State<profilpartenaire> {



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
        padding: const EdgeInsets.all(10),
        children: [
          Column(
            children:  [
              Image.asset(
                'assets/icons/fochka-removebg-preview.png',
              ),
              Text(
                " Profil Partenaire Commerciaux ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
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
    title: "Page d'acceuil ",
    onPressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabsScreen()),
      );
    },


  ),
  CustomListTile(
    icon: Icons.add_shopping_cart_outlined,
    title: "Ajouter Un Offre  ",
    onPressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Ajouteroffre() ,)
      );
    },
  ),
  CustomListTile(
    icon: Icons.delete,
    title: "Supprimer  Un Offre  ",
    onPressed: (context) {
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => supprimeroffre(),)
      );
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
