import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pfe/pages/homehotel/tourist_details_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class RecommendedPlaces extends StatefulWidget {
  const RecommendedPlaces({Key? key}) : super(key: key);

  @override
  State<RecommendedPlaces> createState() => _RecommendedPlacesState();
}

class _RecommendedPlacesState extends State<RecommendedPlaces> {
  final CollectionReference hotelsCollection =
  FirebaseFirestore.instance.collection('hotels');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 235,
        child: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('hotels').get(),
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
    DocumentSnapshot hotels = snapshot.data!.docs[index];

    String image = hotels['image'];
    String nom = hotels['nom'];
    String adresse = hotels['adresse'];
    String prix = hotels['prix'];
    String ville = hotels['ville'];
    String etoile = hotels['etoile'];


    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SizedBox(
    width: 300,
     child: Card(
    elevation: 0.5,
    shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
    Radius.circular(9),
    ),
    ),

      child: InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => TouristDetailsPage(
    image: image,
    nom: nom,
    adresse: adresse,
    prix: prix,
    ville: ville,
    etoile: etoile.toString(), // Convertir la valeur en String

    ),
    ),
    );
    },
    child: Padding(
    padding:  EdgeInsets.all(5),
      child:SingleChildScrollView(
    child: Column(
    children: [
    ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: Image.network(
    image,
    width: double.maxFinite,
    fit: BoxFit.cover,
    height: 160,
    ),
    ),
    const SizedBox(height: 5),
    Row(
    children: [
    Text(
    nom,
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
        etoile.toString(),
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
            Ionicons.location,
            color: Theme.of(context).primaryColor,
            size: 16,
          ),
          const SizedBox(width: 5),
          Text(
            adresse,
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
