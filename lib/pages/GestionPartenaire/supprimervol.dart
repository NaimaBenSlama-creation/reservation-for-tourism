import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class supprimervol extends StatefulWidget {
  const supprimervol ({Key? key}) : super(key: key);
  @override
  State<supprimervol> createState() => _supprimervolState();
}

class _supprimervolState extends State<supprimervol> {

  List<DocumentSnapshot> _users = [];
  DocumentSnapshot? _selectedUser;

  @override
  void initState() {
    super.initState();
    _fetchUsersFromFirebase();
  }

  void _fetchUsersFromFirebase() async {
    final QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('vols')
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
          .collection('vols')
          .doc(_selectedUser!.id)
          .delete()
          .then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Succès'),
              content: Text('vol supprimé avec succès!'),
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
                'Une erreur s\'est produite lors de la suppression de l\'offre de vol .',
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
        title: Text('Supprimer Offre de vol'),
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
                final arrive = userData['arrive'];
                final classe = userData['classe'];
                final compagnie = userData['compagnie'];
                final depart = userData['depart'];
                final dt_arr = userData['dt_arr'];
                final dt_dep = userData['dt_dep'];
                final image = userData['image'];
                final nom = userData['nom'];
                final prix = userData['prix'];



                return ListTile(
                  title: Text('$nom $arrive $image $classe $prix $compagnie $depart $dt_arr $dt_dep  '),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('nom: $nom'),
                      Text('image: $image'),
                      Text('classe: $classe'),
                      Text('depart: $depart'),
                      Text('prix: $prix'),
                      Text('compagnie: $compagnie'),
                      Text('dt_arr: $dt_arr'),
                      Text('dt_dep: $dt_dep'),
                      Text('arrive: $arrive'),



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
