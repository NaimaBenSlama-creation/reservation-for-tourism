import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SpecialHotelOffer extends StatefulWidget {
  const SpecialHotelOffer({Key? key}) : super(key: key);

  @override
  State<SpecialHotelOffer> createState() => _SpecialHotelOfferState();
}

class _SpecialHotelOfferState extends State<SpecialHotelOffer> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _adresseController = TextEditingController();
  TextEditingController _etoileController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  String _message = '';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter Offre Special d\'Hotel'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 10.0),
                child: Image.asset(
                  'assets/images/hotel.png',
                  fit: BoxFit.cover,
                  height: 250.0,
                  width: 350.0,
                ),
              ),
               
              const SizedBox(height: 20),
              TextField(
                controller: _nameController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Nom hotel',
                  hintText: 'Entrez le nom d hotel',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller:_adresseController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Adresse',
                  hintText: 'Entrez adresse d hotel',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller:_etoileController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Nombre d etoile',
                  hintText: 'Entrez le Nombre d etoile',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller:_prixController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Prix',
                  hintText: 'Entrez le prix',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller:_imageController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Image',
                  hintText: 'Entrez le lien d image',
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Confirmer'),
                onPressed: () {
                String nom = _nameController.text;
                String adresse = _adresseController.text;
                String etoile = _etoileController.text;
                String prix = _prixController.text;
                String image = _imageController.text;

                Map<String, dynamic> user = {
                  'nom': nom,
                  'adresse': adresse,
                  'etoile': etoile,
                  'prix': prix,
                  'image': image,

                };

                FirebaseFirestore.instance
                    .collection('specialhotel')
                    .add(user)
                    .then((_) {
                  setState(() {
                    _message = 'Offre  ajouté avec succès!';
                  });
                }).catchError((error) {
                  print('Error adding Offre : $error');
                  setState(() {
                    _message =
                    'Une erreur s\'est produite lors de l\'ajout du Offre.';
                  });
                });






                  _showConfirmationDialog(context);
                  // Gérer l'action de confirmation
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text('Voulez-vous vraiment modifier les informations ?'),
        actions: [
          TextButton(
            child: const Text('Oui'),
            onPressed: () {
              Navigator.pop(context);
              _showSuccessDialog(context);
            },
          ),
          TextButton(
            child: const Text('Non'),
            onPressed: () {
              Navigator.pop(context);
              _showCancelDialog(context);
            },
          ),
        ],
      );
    },
  );
}

void _showSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Modification réussie'),
        content: const Text('La modification a été effectuée avec succès.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}

void _showCancelDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Modification annulée'),
        content: const Text('La modification a été annulée.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}
