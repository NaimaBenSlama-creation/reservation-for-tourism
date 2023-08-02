import 'package:flutter/material.dart';
import 'package:pfe/pages/GestionClient/registration_screen.dart';
import 'package:pfe/pages/GestionClient/signin_screen.dart';
import 'package:pfe/widgets/my_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute ='Welcome_Screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 220,
                  child: Image.asset('assets/images/—Pngtree—airplane with dashline pin location_9046607.png'),
                ),
                Text(
                  'Fochka Travel ',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color(0xff2e386b),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            MyButton(
              color: Colors.yellow[900]!,
              title: 'connexion',
              onPressed: () {   Navigator.pushNamed(context, SignInScreen.screenRoute);
              }, onTap: () {  }, text: '', textColor: Colors.white,
            ),
            MyButton(
              color: Colors.blue[500]!,
              title: 'sinscrire',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.screenRoute);
              }, onTap: () {  }, text: '', textColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}