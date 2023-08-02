import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:intl/intl.dart';
import 'package:pfe/pages/homevol/reservationvol.dart';

class Detailvol extends StatelessWidget {
  final String arrive;
  final String classe;
  final String compagnie;
  final String depart;
  final DateTime dt_arr;
  final DateTime dt_dep;
  final String nom;
  final String prix;
  final String image;

  Detailvol({
    Key? key,
    required this.arrive,
    required this.classe,
    required this.compagnie,
    required this.depart,
    required this.dt_arr,
    required this.dt_dep,
    required this.nom,
    required this.prix,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.38,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Image.network(
                        image,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.horizontal(right: Radius.circular(15)),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              iconSize: 20,
                              icon: Icon(Ionicons.chevron_back),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nom,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(height: 3),
                    Icon(
                      Ionicons.airplane_outline,
                      size: 14,
                    ),
                    Text(
                      compagnie,
                      style: Theme.of(context).textTheme.subtitle1!,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Prix",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      prix,
                      style: Theme.of(context).textTheme.subtitle1!,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Ionicons.airplane,
                    color: Colors.black54,
                    size: 14,
                  ),
                  Text(
                    "Depart",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  ...List.generate(
                    18,
                        (index) {
                      return Expanded(
                        child: Container(
                          height: 2,
                          color: index.isOdd ? Colors.transparent : Colors.black54,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Ionicons.location_outline,
                    size: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    depart,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Ionicons.calendar,
                    color: Colors.black54,
                    size: 14,
                  ),
                  Text(
                    "Date depart",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 3),
                  ...List.generate(
                    18,
                        (index) {
                      return Expanded(
                        child: Container(
                          height: 2,
                          color: index.isOdd ? Colors.transparent : Colors.black54,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Ionicons.time_outline,
                    size: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    DateFormat('yyyy-MM-dd HH:mm ').format(dt_dep),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Ionicons.calendar,
                    color: Colors.black54,
                    size: 14,
                  ),
                  Text(
                    "Date Arrive",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  ...List.generate(
                    18,
                        (index) {
                      return Expanded(
                        child: Container(
                          height: 2,
                          color: index.isOdd ? Colors.transparent : Colors.black54,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Ionicons.time_outline,
                    size: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    DateFormat('yyyy-MM-dd  HH:mm').format(dt_arr),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Ionicons.stats_chart,
                    color: Colors.black54,
                    size: 14,
                  ),
                  Text(
                    "Classe",
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(width: 10),
                  ...List.generate(
                    18,
                        (index) {
                      return Expanded(
                        child: Container(
                          height: 2,
                          color: index.isOdd ? Colors.transparent : Colors.black54,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Ionicons.leaf,
                    size: 14,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                  classe,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => volReservationScreen(arrive:arrive, classe:classe, compagnie:compagnie, depart:depart,
                            dt_arr:dt_arr, dt_dep: dt_dep, nom:nom, prix:prix, image:image,)
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 8.0,
                    ),
                  ),
                  child: const Text("Réserver Maintenant"),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
