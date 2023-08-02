import 'package:flutter/material.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  String username = 'John Doe'; // Nom d'utilisateur par défaut
  int loyaltyLevel = 3; // Niveau de fidélité par défaut

  void updateUserProfile(String newUsername) {
    setState(() {
      username = newUsername;
    });
  }

  void deleteProfile() {
    // Implémenter la logique de suppression du profil ici
    // ...
  }

  void logout() {
    // Implémenter la logique de déconnexion ici
    // ...
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil utilisateur'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Chemin vers l'image de profil
            ),
            SizedBox(height: 16),
            Text(
              'Nom d\'utilisateur:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              username,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Niveau de fidélité:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Niveau $loyaltyLevel',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            MaterialButton(
              onPressed: () {
                // Ouvrir l'écran de modification du profil
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      currentUsername: username,
                      onUpdate: updateUserProfile,
                    ),
                  ),
                );
              },
              child: Text('Modifier le profil'),
            ),
            MaterialButton(
              onPressed: () {
                // Supprimer le profil
                deleteProfile();
              },
              child: Text('Supprimer le profil'),
            ),
            MaterialButton(
              onPressed: () {
                // Déconnexion du compte
                logout();
              },
              child: Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  final String currentUsername;
  final Function(String) onUpdate;

  EditProfilePage({required this.currentUsername, required this.onUpdate});

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    usernameController.text = widget.currentUsername;
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  void saveChanges() {
    String newUsername = usernameController.text;
    widget.onUpdate(newUsername);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'), // Chemin vers l'image de profil
            ),
            SizedBox(height: 16),
            Text(
              'Nom d\'utilisateur:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Entrez votre nom d\'utilisateur',
              ),
            ),
            SizedBox(height: 16),
          MaterialButton(
              onPressed: () {
                // Enregistrer les modifications et revenir à l'écran du profil utilisateur
                saveChanges();
              },
              child: Text('Enregistrer les modifications'),
            ),
          ],
        ),
      ),
    );
  }
}
