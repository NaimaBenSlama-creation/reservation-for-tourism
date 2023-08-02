import 'package:flutter/material.dart';
import 'package:pfe/pages/registration_screen.dart';
import 'package:pfe/pages/signin_screen.dart';
import 'package:pfe/pages/welcome_screen.dart';
import 'package:pfe/widgets/my_button.dart';

class choixscreen extends StatefulWidget {
  static const String screenRoute ='choixscreen';
  const choixscreen({Key? key}) : super(key: key);

  @override
  State<choixscreen> createState() => _choixscreenState();
}

class _choixscreenState extends State<choixscreen> {
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
                  child: Image.asset('assets/icons/fochka-removebg-preview.png'),
                ),
                const Text(
                  'Voyage plus ganger plus  ',
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
              title: 'Admin',
              onPressed: () {
                Navigator.pushNamed(context, WelcomeScreen.screenRoute);
              }, onTap: () {  },
            ),
            MyButton(
              color: Colors.blue[800]!,
              title: 'Client',
              onPressed: () {
                Navigator.pushNamed(context, WelcomeScreen.screenRoute);
              }, onTap: () {  },
            )
          ],
        ),
      ),
    );
  }
}