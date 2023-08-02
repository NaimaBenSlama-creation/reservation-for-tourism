import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe/pages/GestionAdmin/Systemepyramidal.dart';

class AjouterClientFidel extends StatefulWidget {
  @override
  _AjouterClientFidelState createState() => _AjouterClientFidelState();
}

class _AjouterClientFidelState extends State<AjouterClientFidel> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _pointsController = TextEditingController();
  String _message = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter un client fidèle'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/fidelite.png',
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Nom & Prénom',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _nomController,
                decoration: const InputDecoration(
                  hintText: 'Entrez le Nom & Prénom du client',
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
              const SizedBox(height: 16),
              const Text(
                'Numéro de carte de fidélité',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _cardNumberController,
                decoration: const InputDecoration(
                  hintText: 'Entrez le Numéro de carte de fidélité',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Point de fidélité',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _pointsController,
                decoration: const InputDecoration(
                  hintText: 'Les points de fidélité',
                ),
              ),
              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  String cardNumber = _cardNumberController.text;
                  String nom = _nomController.text;
                  String email = _emailController.text;
                  String phone = _phoneController.text;
                  int points = int.tryParse(_pointsController.text) ?? 0;

                  Map<String, dynamic> user = {
                    'nom': nom,
                    'cardNumber': cardNumber,
                    'email': email,
                    'numeroTelephone': phone,
                    'points': points,
                  };

                  FirebaseFirestore.instance
                      .collection('fidelclient')
                      .add(user)
                      .then((documentReference) {
                    setState(() {
                      _message = 'Le client a été ajouté avec succès !';
                    });


                  }).catchError((error) {
                    setState(() {
                      _message = 'Une erreur est survenue lors de l\'ajout du client : $error';
                    });
                  });
                },
                child: const Text('Ajouter'),
              ),
              const SizedBox(height: 16),
              Text(
                _message,
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
