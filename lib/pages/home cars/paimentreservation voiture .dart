import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/visa-logo.jpg',
                  height: 40,
                ),
                Image.asset(
                  'assets/images/master.jpg',
                  height: 40,
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Numéro de carte',
                prefixIcon: Icon(Icons.credit_card),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: expiryDateController,
              decoration: const InputDecoration(
                labelText: 'Date d\'expiration (MM/AA)',
                prefixIcon: Icon(Icons.calendar_today),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: cvvController,
              decoration: const InputDecoration(
                labelText: 'CVV',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logique pour effectuer le paiement
                String cardNumber = cardNumberController.text;
                String expiryDate = expiryDateController.text;
                String cvv = cvvController.text;

                // Appeler une fonction pour traiter le paiement
                processPayment(cardNumber, expiryDate, cvv);

                // Fermer la boîte de dialogue
                Navigator.of(context).pop();

                // Afficher le message de succès
                showSuccessMessage(context);
              },
              child: const Text('Payer'),
            ),
          ],
        ),
      ),
    );
  }

  void processPayment(String cardNumber, String expiryDate, String cvv) {
    // Logique pour traiter le paiement
    print('Paiement effectué avec succès!');
  }

  void showSuccessMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 64.0,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Paiement réussi',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Le paiement a été effectué avec succès.',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
