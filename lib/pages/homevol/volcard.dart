import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'detailsvol.dart';

class cardvol extends StatelessWidget {
  CollectionReference volsref = FirebaseFirestore.instance.collection("vols");
  cardvol({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('vols').get(),
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
              DocumentSnapshot vols = snapshot.data!.docs[index];

              String arrive = vols['arrive'];
              String classe = vols['classe'];
              String compagnie = vols['compagnie'];
              String depart = vols['depart'];
              String nom = vols['nom'];
              String prix = vols['prix'];
              String image = vols['image'];
              Timestamp timestamp_dep = vols['dt_dep'];
              Timestamp timestamp_arr = vols['dt_arr'];
              DateTime dt_dep = timestamp_dep.toDate();
              DateTime dt_arr = timestamp_arr.toDate();
              String formatted_dt_dep = DateFormat('yyyy-MM-dd HH:mm').format(dt_dep);
              String formatted_dt_arr = DateFormat('yyyy-MM-dd HH:mm').format(dt_arr);

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
                        builder: (context) => Detailvol(arrive:arrive, classe:classe, compagnie:compagnie,
                          depart:depart, dt_arr:dt_arr, dt_dep:dt_dep, nom:nom, prix:prix, image:image,),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(image),
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
                              Text('4'),
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
                                  compagnie,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text('Departure: $formatted_dt_dep'),
                          Text('Arrival: $formatted_dt_arr'),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsets.only(right: 10),
              child: SizedBox(),
            ),
            itemCount: snapshot.data!.docs.length,
          );
        },
      ),
    );
  }
}
