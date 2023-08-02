import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class reservationspecialvoiture extends StatefulWidget {
  const reservationspecialvoiture({Key? key}) : super(key: key);

  @override
  State<reservationspecialvoiture> createState() => _reservationspecialhotelState();
}

class _reservationspecialhotelState extends State<reservationspecialvoiture> {

  List<DocumentSnapshot> _users = [];
  DocumentSnapshot? _selectedUser;

  @override
  void initState() {
    super.initState();
    _fetchUsersFromFirebase();
  }

  void _fetchUsersFromFirebase() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reservationspecialvoiture')
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
          .collection('reservationspecialvoiture')
          .doc(_selectedUser!.id)
          .delete()
          .then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succès'),
              content: Text('Reservation Voiture avec succès!'),
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
        title: Text('Suivi Réservation Hotel '),
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
                final nomvoiture = userData['nomvoiture'];
                final name = userData['name'];
                final email = userData['email'];
                final phone = userData['phone'];
                final date = userData['date'];
                final BOITE= userData['BOITE'];
                final prix = userData['prix'];
                final Energie = userData['prix'];


                return ListTile(
                  title: Text('$nomvoiture $name $email $phone $date $BOITE $prix $Energie'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('nomvoiture: $nomvoiture'),
                      Text('name: $name'),
                      Text('email: $email'),
                      Text('phone: $phone'),
                      Text('date: $date'),
                      Text('BOITE: $BOITE'),
                      Text('prix: $prix'),
                      Text('Energie: $Energie'),
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
