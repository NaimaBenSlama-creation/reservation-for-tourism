import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VoitureOfferForm extends StatefulWidget {
  const VoitureOfferForm({Key? key}) : super(key: key);

  @override
  State<VoitureOfferForm> createState() => _VoitureOfferFormState();
}

class _VoitureOfferFormState extends State<VoitureOfferForm> {

  TextEditingController _BOITEController = TextEditingController();
  TextEditingController _ENERGIEController = TextEditingController();
  TextEditingController _IMAGEController = TextEditingController();
  TextEditingController _NOMController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  String _message = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter Voiture'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/images/kia_seltos.jpg',
                  height: 250.0,
                  width: 250.0,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller:_NOMController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Nom du marque',
                  hintText: 'Entrez le nom de voiture',
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
                controller:_BOITEController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Boite',
                  hintText: 'Entrez le style de boite',
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
                controller:_ENERGIEController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Energie',
                  hintText: 'Entrez le type d\'energie',
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
                controller:_IMAGEController,
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

                  String NOM = _NOMController.text;
                  String BOITE = _BOITEController.text;
                  String ENERGIE = _ENERGIEController.text;
                  String prix = _prixController.text;
                  String IMAGE = _IMAGEController.text;

                  Map<String, dynamic> user = {
                    'NOM': NOM,
                    'BOITE': BOITE,
                    'ENERGIE ': ENERGIE,
                    'prix': prix,
                    'IMAGE':IMAGE,

                  };

                  FirebaseFirestore.instance
                      .collection('voitures')
                      .add(user)
                      .then((_) {
                    setState(() {
                      _message = 'voitures ajouté avec succès!';
                    });
                  }).catchError((error) {
                    print('Error adding voitures: $error');
                    setState(() {
                      _message =
                      'Une erreur s\'est produite lors de l\'ajout du voitures.';
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
        content: const Text('Voulez-vous vraiment Ajouter les informations ?'),
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
        title: const Text('Réussie'),
        content: const Text('Effectuée avec succès.'),
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
        title: const Text('Annulée'),
        content: const Text('Annulée.'),
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
