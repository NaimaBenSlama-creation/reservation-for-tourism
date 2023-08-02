
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class cardhotel extends StatelessWidget {
  CollectionReference volsref= FirebaseFirestore.instance.collection("hotels");
  cardhotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 235,
        child: FutureBuilder<QuerySnapshot>(
            future: FirebaseFirestore.instance.collection('hotels').get(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot) {
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
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot hotels = snapshot.data!.docs[index];

                    String image = hotels['image'];
                    String nom = hotels['nom'];
                    String adresse = hotels['adresse'];
                    String prix = hotels['prix'];
                    String ville = hotels['ville'];
                    String etoile = hotels['etoile'];

                    return Card(
                      margin: EdgeInsets.only(right: 22.0),
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      elevation: 0.0,
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                                scale: 2.0,
                              )),
                          width: 200.0,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(etoile),
                                    Icon(
                                      Icons.star,
                                      color: Color(0xE5E0C30C),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        nom,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.0,
                                      ),
                                      Text(
                                        adresse,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: SizedBox(),)
                  ,
                  itemCount: snapshot.data!.docs.length
              );
            })
    );
  }
}