import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../detail_cars/detail_cars.dart';

class CardCars extends StatelessWidget {
  CardCars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('voitures').get(),
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
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DocumentSnapshot voitures = snapshot.data!.docs[index];

              String IMAGE = voitures['IMAGE'];
              String NOM = voitures['NOM'];
              String BOITE = voitures['BOITE'];
              String prix = voitures['prix'];
              String ENERGIE = voitures['ENERGIE'];



              return Card(
                margin: EdgeInsets.only(right: 22.0),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 0.0,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailCars (
                          IMAGE: IMAGE,
                          NOM: NOM,
                          BOITE: BOITE,
                          prix: prix,
                          ENERGIE: ENERGIE, ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(IMAGE),
                        fit: BoxFit.cover,
                        scale: 2.0,
                      ),
                    ),
                    width: 200.0,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '4',
                                style: TextStyle(
                                  color: Color(0xE5E0C30C),
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: Color(0xE5E0C30C),
                              ),
                            ],
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  NOM,
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
                                  prix,
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
            separatorBuilder: (context, index) => const SizedBox(
              width: 10.0,
            ),
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
