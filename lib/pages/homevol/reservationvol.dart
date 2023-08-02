import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../home cars/paimentreservation voiture .dart';

class volReservationScreen extends StatefulWidget {
  final String arrive;
  final String classe;
  final String compagnie;
  final String depart;
  final DateTime dt_arr;
  final DateTime dt_dep;
  final String nom;
  final String prix;
  final String image;


  volReservationScreen({
    Key? key,
    required this.arrive,
    required this.classe,
    required this.compagnie,
    required this.depart,
    required this.dt_arr,
    required this.dt_dep,
    required this.nom,
    required this.prix,
    required this.image,
  }) : super(key: key);

  @override
  _volReservationScreenState createState() => _volReservationScreenState();
}

class _volReservationScreenState extends State< volReservationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dt_depController = TextEditingController();
  final TextEditingController _dt_arrController = TextEditingController();
  final TextEditingController _nomvolController = TextEditingController();
  final TextEditingController _passportController = TextEditingController();
  final TextEditingController _compagnieController = TextEditingController();
  final TextEditingController _departController = TextEditingController();




  String _message = '';
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _nomvolController.text = widget.nom;
    _dt_depController.text=widget.dt_dep.toString();
    _dt_arrController.text=widget.dt_arr.toString();
    _compagnieController.text=widget.compagnie;
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
        title: Text('Réservation de vol'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller:  _nomvolController,
              decoration: InputDecoration(
                labelText:  widget.nom ,
              ),
            ),
            SizedBox(height: 3),

            TextField(
              controller:  _compagnieController,
              decoration: InputDecoration(
                labelText:  widget.compagnie ,
              ),
            ),
            SizedBox(height: 3),
            TextField(
              controller:  _departController,
              decoration: InputDecoration(
                labelText:  widget.depart ,
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
              controller: _passportController,
              decoration: InputDecoration(
                hintText: 'Numero de passport',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Payer'),
              onPressed: () {
                String nomvol= _nomvolController.text;
                String name = _nameController.text;
                String email = _emailController.text;
                String phone = _phoneController.text;
                DateTime? date =  _selectedDate;
                String passport =  _passportController.text;
                DateTime dt_dep = DateTime.parse(_dt_depController.text);
                DateTime _dt_arr = DateTime.parse(_dt_arrController.text);
                String compagnie = _compagnieController.text;

                // Create the user object with the desired fields
                Map<String, dynamic> user = {
                  'nomvol': nomvol,
                  'name': name,
                  'email': email,
                  'numeroTelephone': phone,
                  'date':date,
                  'compagnie':compagnie,
                  'passport':passport,
                  'dt_dep':dt_dep,
                  'dt_arr':_dt_arr,
                };

                // Save the user data to the "users" collection in Firestore
                FirebaseFirestore.instance
                    .collection('reservation_vol')
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


