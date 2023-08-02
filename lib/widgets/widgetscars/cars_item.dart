import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pfe/pages/homehotel/tourist_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


  class CARITEM extends StatefulWidget {
  CARITEM({Key? key}) : super(key: key);

  @override
  State< CARITEM> createState() => _CARITEMState();
}

class _CARITEMState extends State< CARITEM> {
  final CollectionReference hotelsCollection =
  FirebaseFirestore.instance.collection('voitures');

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
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              DocumentSnapshot voitures = snapshot.data!.docs[index];

              String IMAGE = voitures['IMAGE'];
              String NOM = voitures ['NOM'];
              String BOITE =  voitures['BOITE'];
              String prix = voitures['prix'];
              String ENERGIE =  voitures['ENERGIE'];


              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                    width: 300,
                    child: Card(
                      elevation: 0.0,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(9),
                        ),
                      ),

                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () {
                        },
                        child: Padding(
                          padding:  EdgeInsets.all(5),
                          child:SingleChildScrollView(
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.network(
                                    IMAGE,
                                    width: double.maxFinite,
                                    fit: BoxFit.cover,
                                    height: 160,
                                  ),
                                ),
                                 SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                   NOM,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Spacer(),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow.shade700,
                                      size: 14,
                                    ),
                                    Text(
                                     '4',
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),

                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(
                                      Ionicons.car,
                                      color: Theme.of(context).primaryColor,
                                      size: 16,
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                    prix,
                                      style: const TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
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
