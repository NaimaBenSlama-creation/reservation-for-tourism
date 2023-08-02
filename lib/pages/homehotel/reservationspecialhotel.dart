import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../home cars/paimentreservation voiture .dart';

class HotelspecialReservationScreen extends StatefulWidget {
  final String image;
  final String nom;
  final String adresse;
  final String prix;
  final String etoile;

  HotelspecialReservationScreen({
    Key? key,
    required this.image,
    required this.nom,
    required this.adresse,
    required this.prix,
    required this.etoile,
  }) : super(key: key);

  @override
  _HotelspecialReservationScreenState createState() => _HotelspecialReservationScreenState();
}

class _HotelspecialReservationScreenState extends State<HotelspecialReservationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nbadulteController = TextEditingController();
  final TextEditingController _nbenfantController = TextEditingController();
  final TextEditingController _nomhotelController = TextEditingController();
  String _message = '';
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _nomhotelController.text = widget.nom;
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
        title: Text('Réservation d\'hôtel'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller:  _nomhotelController,
              decoration: InputDecoration(
                labelText:  widget.nom ,
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
            SizedBox(height: 8),
            TextFormField(
              controller: _nbadulteController,
              decoration: InputDecoration(
                hintText: 'Nombre d\'adultes',
              ),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: _nbenfantController,
              decoration: InputDecoration(
                hintText: 'Nombre d\'enfants',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Payer'),
              onPressed: () {
                String nomhotel= _nomhotelController.text;
                String name = _nameController.text;
                String email = _emailController.text;
                String phone = _phoneController.text;
                DateTime? date =  _selectedDate;
                String nbadulte =  _nbadulteController.text;
                String nbenfant=   _nbenfantController.text;

                // Create the user object with the desired fields
                Map<String, dynamic> user = {
                  'nomhotel': nomhotel,
                  'name': name,
                  'email': email,
                  'numeroTelephone': phone,
                  'date':date,
                  'nbadulte':nbadulte,
                  'nbenfant':nbenfant,
                };

                // Save the user data to the "users" collection in Firestore
                FirebaseFirestore.instance
                    .collection('reservationspecialhotel')
                    .add(user)
                    .then((_) {
                  setState(() {
                    _message = 'reservation  ajouté avec succès!';
                  });
                }).catchError((error) {
                  print('Error adding partenaire: $error');
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


