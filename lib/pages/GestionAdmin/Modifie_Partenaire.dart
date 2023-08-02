import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class  ModifPartenairesScreen extends StatefulWidget {
  @override
  _ModifPartenairesScreenState createState() => _ModifPartenairesScreenState();
}

class _ModifPartenairesScreenState extends State<ModifPartenairesScreen> {
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
        .where('role', isEqualTo: 'partenaire')
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

  void _updateUser() {
    if (_selectedUser != null) {
      String email = _selectedUser!['email'];
      String nom = _selectedUser!['nom'];
      String numeroTelephone = _selectedUser!['numeroTelephone'];
      String prenom = _selectedUser!['prenom'];
      String role = _selectedUser!['role'];

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Modifier Partenaire'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Nom'),
                  onChanged: (value) {
                    nom = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Numéro de téléphone'),
                  onChanged: (value) {
                    numeroTelephone = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Prénom'),
                  onChanged: (value) {
                    prenom = value;
                  },
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Rôle'),
                  onChanged: (value) {
                    role = value;
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                child: Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Enregistrer'),
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(_selectedUser!.id)
                      .update({
                    'email': email,
                    'nom': nom,
                    'numeroTelephone': numeroTelephone,
                    'prenom': prenom,
                    'role': role,
                  }).then((value) {
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Succès'),
                          content: Text('Utilisateur modifié avec succès!'),
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
                    Navigator.of(context).pop();
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Erreur'),
                          content: Text(
                            'Une erreur s\'est produite lors de la modification de l\'utilisateur.',
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
                },
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier Utilisateur'),
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
          ElevatedButton(
            onPressed: _updateUser,
            child: Text('Modifier'),
          ),
        ],
      ),
    );
  }
}
