import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailsspecial.dart';


class specialhotel extends StatelessWidget {
  static  String screenRoute =' specialhotel';
  specialhotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('specialhotel').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text('No data available');
          }

          return ListView.separated(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              DocumentSnapshot specialhotel = snapshot.data!.docs[index];

              String adresse = specialhotel['adresse'];
              String etoile = specialhotel['etoile'];
              String image = specialhotel['image'];
              String nom = specialhotel['nom'];
              String prix = specialhotel['prix'];

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>specialhotelDetailsPage(image:image, nom:nom,
                          adresse:adresse, prix:prix, etoile:etoile,)
                    ),
                  );


                },

                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  height: 180,
                  child: FractionallySizedBox(
                    widthFactor: 1.0, // Utilise toute la largeur disponible
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                            Colors.white,
                            BlendMode.multiply,
                          ),
                          image: NetworkImage(image),
                          fit: BoxFit.cover, // Ajuste l'image pour remplir le conteneur
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              nom,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 19,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    SizedBox(width: 7),
                                    Text('4'),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.price_change,
                                      color: Colors.yellow,
                                      size: 18,
                                    ),
                                    SizedBox(width: 7),
                                    Text(prix),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
