import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VolOfferForm extends StatefulWidget {
  const VolOfferForm({Key? key}) : super(key: key);

  @override
  State<VolOfferForm> createState() => _VolOfferFormState();

  void onSaved(DateTime selectedDateTime) {}
}

class _VolOfferFormState extends State<VolOfferForm> {
  TextEditingController _arriveController = TextEditingController();
  TextEditingController _classeController = TextEditingController();
  TextEditingController _compagnieController = TextEditingController();
  TextEditingController _departController = TextEditingController();
  TextEditingController _datearriveController = TextEditingController();
  TextEditingController _datedepartController = TextEditingController();
  TextEditingController _nomController = TextEditingController();
  TextEditingController _prixController = TextEditingController();
  TextEditingController _imageController = TextEditingController();
  String _message = '';
  late DateTime selectedDateTime;
  late TextEditingController _textEditingController;


  void initState() {
    super.initState();
    _datedepartController = _datedepartController;
    _datearriveController = _datearriveController;
  }

  @override
  void dispose() {
    _datedepartController.dispose();
    _datearriveController.dispose();
    super.dispose();
  }



  Future<void> _selectDateTime(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setState(() {
          selectedDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            selectedTime.hour,
            selectedTime.minute,
          );
          _datedepartController.text = selectedDateTime.toString();
          widget.onSaved(selectedDateTime);
          _datearriveController.text = selectedDateTime.toString();
          widget.onSaved(selectedDateTime);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter Vol'),
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
                  'assets/images/vol.png',
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: 200.0,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller:_compagnieController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Compagnie',
                  hintText: 'Entrez le nom de compagnie',
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
              const SizedBox(height: 8),
              TextField(
                controller:_departController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Départ',
                  hintText: 'Entrez la ville de Départ ',
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
              const SizedBox(height: 8),
              TextField(
                controller:_arriveController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Arrivé',
                  hintText: 'Entrez la ville d\'Arrivé',
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
              const SizedBox(height: 8),
              TextField(
                controller:_datedepartController,
                onTap: () => _selectDateTime(context),
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Date départ',
                  hintText: 'Entrez la Date départ',
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
              const SizedBox(height: 8),
              TextField(
                controller:_datearriveController,
                onTap: () => _selectDateTime(context),
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Date d\'arrivé',
                  hintText: 'Entrez la Date d\'arrivé',
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
              const SizedBox(height:8),
              TextField(
                controller:_classeController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Classe',
                  hintText: 'Entrez la classe',
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
              const SizedBox(height: 8),
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
              const SizedBox(height: 8),
              TextField(
                controller:_imageController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  labelText: 'Image',
                  hintText: 'Entrez lien de l\' image',
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
              const SizedBox(height: 8),
              ElevatedButton(
                child: const Text('Confirmer'),
                onPressed: () {

                  String arrive = _arriveController.text;
                  String classe = _classeController.text;
                  String compagnie = _compagnieController.text;
                  String depart = _departController.text;
                  String nom = _nomController.text;
                  String prix = _prixController.text;
                  String image = _imageController.text;
                  DateTime dt_dep =  _datedepartController.text as DateTime;
                  DateTime dt_arr = _datearriveController.text as DateTime;



                  Map<String, dynamic> user = {
                    'nom': nom,
                    'depart': depart,
                    'image ': image,
                    'prix': prix,
                    'classe':classe,
                    'compagnie':compagnie,
                    'arrive':arrive,
                    'dt_dep':dt_dep,
                    'dt_arr':dt_arr,


                  };

                  FirebaseFirestore.instance
                      .collection('vols')
                      .add(user)
                      .then((_) {
                    setState(() {
                      _message = 'vols ajouté avec succès!';
                    });
                  }).catchError((error) {
                    print('Error adding vols: $error');
                    setState(() {
                      _message =
                      'Une erreur s\'est produite lors de l\'ajout du vols.';
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
