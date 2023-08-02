import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detailsvol.dart';
import 'package:intl/intl.dart';


class specialvol extends StatelessWidget {
  const specialvol ({Key? key}) : super(key: key);
  void main() {
    DateTime currentDateTime = DateTime.now();
    print(currentDateTime);
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
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
            scrollDirection: Axis.vertical,
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

              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>Detailvol(arrive:arrive, classe:classe, compagnie:compagnie,
                        depart:depart, dt_arr:dt_arr, dt_dep:dt_dep, nom:nom, prix:prix, image:image,),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  height: 180,
                  child: FractionallySizedBox(
                    widthFactor: 1.0,
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
                          fit: BoxFit.cover,
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
