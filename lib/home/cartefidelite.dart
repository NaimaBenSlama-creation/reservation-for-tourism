import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BarcodeScanner extends StatefulWidget {
  @override
  _BarcodeScannerState createState() => _BarcodeScannerState();
}

class _BarcodeScannerState extends State<BarcodeScanner> {
  String result = "Scanner Le Code a Barre de  Carte de fidélité  ";

  Future scanBarcode() async {
    try {
      String result = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Annuler", true, ScanMode.BARCODE);
      setState(() {
        this.result = result;
      });

      // Rechercher le client dans Firebase en utilisant le champ "cardNumber"
      var firebaseResult = await FirebaseFirestore.instance
          .collection('fidelclient')
          .where('cardNumber', isEqualTo: result)
          .get();

      if (firebaseResult.docs.isNotEmpty) {
        var client = firebaseResult.docs.first;
        var nom = client.data()['nom'];
        var email = client.data()['Email'];
        var phone = client.data()['numeroTelephone'];
        var points = client.data()['points'];

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Informations du client'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Nom: $nom'),
                  Text('Email: $email'),
                  Text('Téléphone: $phone'),
                  Text('Niveau de fidélité: $points'),
                ],
              ),
              actions: <Widget>[
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
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Carte de fidélité introuvable'),
              content: Text('Aucun client trouvé pour ce code-barres.'),
              actions: <Widget>[
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
      }
    } catch (e) {
      setState(() {
        this.result = "Erreur: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suivis Nivéaux de Fidélités'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Image.asset('assets/images/cartefidelite.jpg'), // Chemin de votre image locale

              ],
            ),
            SizedBox(height: 20.0),
            Text(
              result,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: scanBarcode,
              child: Text('Scanner un code-barres'),
            ),
          ],
        ),
      ),
    );
  }
}
