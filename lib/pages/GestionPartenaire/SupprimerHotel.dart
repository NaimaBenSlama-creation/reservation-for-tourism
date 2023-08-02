import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class supprimerhotel extends StatefulWidget {
  const supprimerhotel({Key? key}) : super(key: key);

  @override
  State<supprimerhotel> createState() => _supprimerhotelState();
}

class _supprimerhotelState extends State<supprimerhotel> {
  
  List<DocumentSnapshot> _users = [];
  DocumentSnapshot? _selectedUser;

  @override
  void initState() {
    super.initState();
    _fetchUsersFromFirebase();
  }

  void _fetchUsersFromFirebase() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('hotels')
        .get();

    setState(() {
      _users = snapshot.docs;
    });
  }

  void _onUserSelected(DocumentSnapshot user) {
    setState(() {
      _selectedUser = user;
    });
  }

  void _deleteUser() {
    if (_selectedUser != null) {
      FirebaseFirestore.instance
          .collection('hotels')
          .doc(_selectedUser!.id)
          .delete()
          .then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succès'),
              content: Text('Hotel supprimé avec succès!'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erreur'),
              content: Text(
                'Une erreur s\'est produite lors de la suppression de l\'offre d\'Hotel .',
              ),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Supprimer Offre d\'hotel'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              _fetchUsersFromFirebase();
            },
            child: Text('Actualiser'),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                final user = _users[index];
                final userData = user.data() as Map<String, dynamic>;
                final adresse = userData['adresse'];
                final image = userData['image'];
                final etoile = userData['etoile'];
                final nom = userData['nom'];
                final prix = userData['prix'];
                final ville = userData['ville'];


                return ListTile(
                  title: Text('$nom $adresse $image $etoile $prix $ville '),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('nom: $nom'),
                      Text('image: $image'),
                      Text('etoile: $etoile'),
                      Text('adresse: $adresse'),
                      Text('prix: $prix'),
                      Text('ville: $ville'),



                    ],
                  ),
                  onTap: () => _onUserSelected(user),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          if (_selectedUser != null) ...[
            ElevatedButton(
              onPressed: _deleteUser,
              child: Text('Supprimer'),
            ),
          ],
        ],
      ),
    );
  }
}
