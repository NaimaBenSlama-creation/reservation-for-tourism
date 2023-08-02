import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../home cars/paimentreservation voiture .dart';

class voitureReservationScreen extends StatefulWidget {
  final String IMAGE;
  final String NOM;
  final String BOITE;
  final String prix;
  final String ENERGIE;


  voitureReservationScreen({
    Key? key,
    required this.IMAGE,
    required this.NOM,
    required this.BOITE,
    required this.prix,
    required this.ENERGIE,
  }) : super(key: key);

  @override
  _voitureReservationScreenState createState() => _voitureReservationScreenState();
}

class _voitureReservationScreenState extends State< voitureReservationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _BOITEController = TextEditingController();
  final TextEditingController _prixController = TextEditingController();
  final TextEditingController _ENERGIEController = TextEditingController();
  final TextEditingController _nomvoitureController = TextEditingController();

  String _message = '';
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _nomvoitureController.text = widget.NOM;
    _BOITEController.text=widget.BOITE;
    _prixController.text=widget.prix;
    _ENERGIEController.text=widget.ENERGIE;
  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Réservation de Location Voiture'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller:  _nomvoitureController,
              decoration: InputDecoration(
                labelText:  widget.NOM ,
              ),
            ),
            SizedBox(height: 3),

            TextField(
              controller:  _ENERGIEController,
              decoration: InputDecoration(
                labelText:  widget.ENERGIE ,
              ),
            ),
            SizedBox(height: 3),
            TextField(
              controller:  _prixController,
              decoration: InputDecoration(
                labelText:  widget.prix ,
              ),
            ),
            SizedBox(height: 3),

            SizedBox(height: 16),
            Text(
              'Date d\'arrivée :',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            MaterialButton(
              child: Text(
                _selectedDate == null
                    ? 'Sélectionner une date'
                    : 'Date sélectionnée: ${_selectedDate.toString().substring(0, 10)}',
              ),
              onPressed: () => _selectDate(context),
            ),
            SizedBox(height: 16),
            Text(
              'Informations supplémentaires :',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Nom',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _phoneController,
              decoration: InputDecoration(
                hintText: 'Numéro de Télephone ',
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Payer'),
              onPressed: () {
                String nomvoiture= _nomvoitureController.text;
                String name = _nameController.text;
                String email = _emailController.text;
                String phone = _phoneController.text;
                DateTime? date =  _selectedDate;
                String BOITE =  _BOITEController.text;
                String prix = _prixController.text;
                String Energie = _ENERGIEController.text;

                // Create the user object with the desired fields
                Map<String, dynamic> user = {
                  'nomvoiture': nomvoiture,
                  'name': name,
                  'email': email,
                  'numeroTelephone': phone,
                  'date':date,
                  'Energie':Energie,
                  'BOITE':BOITE,
                };

                // Save the user data to the "users" collection in Firestore
                FirebaseFirestore.instance
                    .collection('reservation_voiture')
                    .add(user)
                    .then((_) {
                  setState(() {
                    _message = 'reservation  ajouté avec succès!';
                  });
                }).catchError((error) {
                  print('Error adding reservation: $error');
                  setState(() {
                    _message =
                    'Une erreur s\'est produite lors de l\'ajout du Réservation .';
                  });
                });

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


