import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pfe/pages/homehotel/reservationhotel.dart';

class TouristDetailsPage extends StatelessWidget {
  final String image;
  final String nom;
  final String adresse;
  final String prix;
  final String ville;
  final String etoile;

  TouristDetailsPage({
    Key? key,
    required this.image,
    required this.nom,
    required this.adresse,
    required this.prix,
    required this.ville,
    required this.etoile,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
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
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20)),
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
                          borderRadius: BorderRadius.horizontal(right: Radius
                              .circular(15)),
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline6,
                    ),
                    SizedBox(height: 3),
                    Icon(
                      Ionicons.star,
                      size: 14,
                      color: Colors.yellow,
                    ),
                    Text(
                      etoile,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1!,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(
                        color: Theme
                            .of(context)
                            .colorScheme
                            .primary,
                      ),
                    ),
                    Text(
                      prix,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1!,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Ionicons.locate_outline,
                    color: Colors.black54,
                    size: 14,
                  ),
                  Text(
                    "Adresse",
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
                          color: index.isOdd ? Colors.transparent : Colors
                              .black54,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Ionicons.location_outline,
                    size: 14,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  SizedBox(width: 2),
                  Text(
                    adresse,
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Ionicons.locate_outline,
                    color: Colors.black54,
                    size: 14,
                  ),
                  Text(
                    "Ville",
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
                          color: index.isOdd ? Colors.transparent : Colors
                              .black54,
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 3),
                  Icon(
                    Ionicons.location_outline,
                    size: 14,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                  SizedBox(width: 10),
                  Text(
                    ville,
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .primaryColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  HotelReservationScreen(image:image, nom:nom, adresse:adresse, prix:prix,
                          ville:ville, etoile:etoile ,)
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
