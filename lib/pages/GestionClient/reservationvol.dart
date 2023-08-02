import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class reservationspecialvol extends StatefulWidget {
  const reservationspecialvol({Key? key}) : super(key: key);

  @override
  State<reservationspecialvol> createState() => _reservationspecialvolState();
}

class _reservationspecialvolState extends State<reservationspecialvol> {

  List<DocumentSnapshot> _users = [];
  DocumentSnapshot? _selectedUser;

  @override
  void initState() {
    super.initState();
    _fetchUsersFromFirebase();
  }

  void _fetchUsersFromFirebase() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('reservation_vol')
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
          .collection('reservation_vol')
          .doc(_selectedUser!.id)
          .delete()
          .then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succès'),
              content: Text('Reservation Vol avec succès!'),
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
                'Une erreur s\'est produite lors de la Reservation  de vol .',
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
        title: Text('Suivi Réservation de vol'),
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
                final nomvol = userData['nomvol'];
                final nom = userData['nom'];
                final email = userData['email'];
                final numeroTelephone = userData['numeroTelephone'];
                final depart = userData['depart'];
                final arrive= userData['arrive'];
                final prix = userData['prix'];
                final classe = userData['classe'];
                final compagnie= userData['compagnie'];
                final  image  = userData[' image '];
                final dt_dep= userData['dt_dep'];
                final dt_arr= userData['dt_arr'];


                return ListTile(
                  title: Text('$nomvol $nom $email $numeroTelephone $classe $depart $prix $arrive $compagnie $image $dt_arr $dt_dep  '),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('nomvol: $nomvol'),
                      Text('name: $nom'),
                      Text('email: $email'),
                      Text('numeroTelephone: $numeroTelephone'),
                      Text('classe: $classe'),
                      Text('depart: $depart'),
                      Text('prix: $prix'),
                      Text('arrive: $arrive'),
                      Text('compagnie: $compagnie'),
                      Text('image: $image'),
                      Text('dt_arr: $dt_arr'),
                      Text('dt_dep: $dt_dep'),
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
