import 'package:flutter/material.dart';
import 'package:pfe/pages/registration_screen.dart';
import 'package:pfe/pages/signin_screen.dart';
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
                  height: 180,
                  child: Image.asset('images/logo.png'),
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
              }, onTap: () {  },
            ),
            MyButton(
              color: Colors.blue[800]!,
              title: 'sinscrire',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.screenRoute);
              }, onTap: () {  },
            )
          ],
        ),
      ),
    );
  }
}