import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AjoutClientScreen extends StatefulWidget {
  @override
  _AjoutClientScreenState createState() => _AjoutClientScreenState();
}

class _AjoutClientScreenState extends State<AjoutClientScreen> {
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prenomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter Client'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/ajoutclient.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Nom',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  hintText: 'Entrez le nom du client',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Prénom',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _prenomController,
                decoration: const InputDecoration(
                  hintText: 'Entrez le prénom du client',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'Entrez l\'email du client',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Mot de passe',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Entrez le mot de passe du client',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Téléphone',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  hintText: 'Entrez le téléphone du client',
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  String nom = _nomController.text;
                  String prenom = _prenomController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  String phone = _phoneController.text;

                  // Create the user object with the desired fields
                  Map<String, dynamic> user = {
                    'nom': nom,
                    'prenom': prenom,
                    'password ': password ,
                    'email': email,
                    'numeroTelephone': phone,
                    'role': 'client',

                  };

                  // Save the user data to the "users" collection in Firestore
                  FirebaseFirestore.instance
                      .collection('users')
                      .add(user)
                      .then((_) {
                    setState(() {
                      _message = 'Client ajouté avec succès!';
                    });
                  }).catchError((error) {
                    print('Error adding client: $error');
                    setState(() {
                      _message =
                      'Une erreur s\'est produite lors de l\'ajout du client.';
                    });
                  });
                },
                child: const Text('Ajouter'),
              ),
              const SizedBox(height: 16),
              Text(
                _message,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 200), // Espacement pour permettre le défilement vers le bas
            ],
          ),
        ),
      ),
    );
  }
}
