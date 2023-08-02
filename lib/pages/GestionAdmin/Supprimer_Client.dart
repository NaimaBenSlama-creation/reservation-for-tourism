import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SupprimerClientScreen extends StatefulWidget {
  @override
  _SupprimerClientScreenState createState() => _SupprimerClientScreenState();
}

class _SupprimerClientScreenState extends State<SupprimerClientScreen> {
  List<DocumentSnapshot> _users = [];
  DocumentSnapshot? _selectedUser;

  @override
  void initState() {
    super.initState();
    _fetchUsersFromFirebase();
  }

  void _fetchUsersFromFirebase() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'client')
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
          .collection('users')
          .doc(_selectedUser!.id)
          .delete()
          .then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succès'),
              content: Text('Utilisateur supprimé avec succès!'),
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
                'Une erreur s\'est produite lors de la suppression de l\'utilisateur.',
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
        title: Text('Supprimer Client '),
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
                final email = userData['email'];
                final nom = userData['nom'];
                final numeroTelephone = userData['numeroTelephone'];
                final prenom = userData['prenom'];
                final role = userData['role'];

                return ListTile(
                  title: Text('$nom $prenom'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email: $email'),
                      Text('Téléphone: $numeroTelephone'),
                      Text('Rôle: $role'),
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
