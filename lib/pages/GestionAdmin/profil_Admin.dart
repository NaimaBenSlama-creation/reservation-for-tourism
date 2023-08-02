import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../home/tabs_screen.dart';
import '../GestionClient/signin_screen.dart';
import 'TableauBordAdmin.dart';

class Profile extends StatefulWidget {
  static const String screenRoute = 'Profile';

  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        padding: const EdgeInsets.all(9),
        children: [
          Column(
            children:  [
              Image.asset(
                'assets/icons/fochka-removebg-preview.png',
              ),
              Text(
                "Profil Administrateur ",
                style: TextStyle(
                  fontSize: 18,
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
    title: "Page d'acceuil ",
    onPressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabsScreen()),
      );
    },


  ),
  CustomListTile(
    icon: Icons.dashboard,
    title: "Tablaux de bord Admin ",
    onPressed: (context) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  AdminDashboardPage()),
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
