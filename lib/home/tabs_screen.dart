import 'package:flutter/material.dart';
import '../pages/GestionClient/profileClient.dart';
import '../pages/GestionClient/tableaubordclient.dart';
import 'cartefidelite.dart';
import 'home_screen.dart';
import '../pages/GestionClient/welcome_screen.dart';

class TabsScreen extends StatefulWidget {
  static  String screenRoute ='TabsScreen';
    const TabsScreen({super.key});

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Widget> _screens = [
     HomeScreen(),
    DashboardPage(),
    BarcodeScanner(),
    ProfilClient(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.indigoAccent ,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedScreenIndex,
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled,),
            label: 'Acceuil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Tableau de bord',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call_to_action),
            label: 'Scane Carte',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}