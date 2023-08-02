import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class reservationhotel extends StatefulWidget {
  const reservationhotel({Key? key}) : super(key: key);

  @override
  State<reservationhotel> createState() => _reservationhotelState();
}

class _reservationhotelState extends State<reservationhotel> {

  List<DocumentSnapshot> _users = [];
  DocumentSnapshot? _selectedUser;

  @override
  void initState() {
    super.initState();
    _fetchUsersFromFirebase();
  }

  void _fetchUsersFromFirebase() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reservation_hotel')
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
          .collection('reservation_hotel')
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
        title: Text('Suivi  Reservation Hotel '),
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
                final nomhotel = userData['nomhotel'];
                final name = userData['name'];
                final email = userData['email'];
                final phone = userData['phone'];
                final date = userData['date'];
                final nbadulte = userData['nbadulte'];
                final nbenfant = userData['nbenfant'];



                return ListTile(
                  title: Text('$nomhotel $name $email $phone $date $nbadulte $nbenfant'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('nom: $nomhotel'),
                      Text('name: $name'),
                      Text('email: $email'),
                      Text('phone: $phone'),
                      Text('date: $date'),
                      Text('nbadulte: $nbadulte'),
                      Text('nbenfant: $nbenfant'),

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
