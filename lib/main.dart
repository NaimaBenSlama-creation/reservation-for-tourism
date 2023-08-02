import 'package:flutter/material.dart';
import 'package:pfe/pages/GestionClient/modifieprofil.dart';
import 'package:pfe/pages/GestionClient/profileClient.dart';
import 'package:pfe/pages/homehotel/specialhotel.dart';
import 'package:pfe/pages/homevol/homeVol.dart';
import 'package:pfe/home/tabs_screen.dart';
import 'package:pfe/pages/home%20cars/homecars.dart';
import 'package:pfe/pages/GestionClient/registration_screen.dart';
import 'package:pfe/pages/GestionClient/signin_screen.dart';
import 'package:pfe/home/welcome_page.dart';
import 'package:pfe/pages/GestionClient/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pfe/pages/homevol/search.dart';
import 'package:pfe/pages/homehotel/homehotel.dart';

import 'home/home_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      appId: '1:383186593580:android:2893957fa90596812cee89',
      apiKey: 'AIzaSyCbEPtkKwcc6v9oJvYcG3OfBbHH9FUBGiY',
      projectId: 'fochka-travel-app',
      messagingSenderId: '383186593580',
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fochka travel',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: const WelcomePage(),
    routes: {
      HomeScreen.screenRoute : (context) =>  HomeScreen(),
      TabsScreen.screenRoute : (context) => TabsScreen(),
      SignInScreen.screenRoute : (context) => SignInScreen(),
    WelcomeScreen.screenRoute : (context) =>const WelcomeScreen(),
    RegistrationScreen.screenRoute: (context) =>const RegistrationScreen(),
      Homecars.screenRoute : (context) => Homecars (),
      ProfilClient.screenRoute : (context) =>  const ProfilClient (),
      modifieprofil.screenRoute : (context) =>  const modifieprofil(),
      Homevol.screenRoute : (context) =>   const Homevol(),
      Hotels.screenRoute : (context) => const Hotels(),
      Search.screenRoute : (context) => const Search(),
      specialhotel.screenRoute : (context) =>  specialhotel(),

    },
  );
}
}






