import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/my_button.dart';
import 'otp-sceen.dart';

class Forgotpassword  extends StatefulWidget {
  static const String screenRoute ='Forgotpassword ';
  const Forgotpassword ({Key? key}) : super(key: key);

  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword > {
  bool secourText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Container(
              height: 150,
              child: const Text('Mot de passe Oublie !',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              child: Image.asset('assets/icons/Forgot password-amico.svg'),
            ),
            const SizedBox(height: 20),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (value) {},
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: 'Email',
                hintText: 'Entrez votre email',
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
            const SizedBox(height:10),
            const SizedBox(height: 10),
            MyButton(
              color: Colors.blue,
              title: 'Envoyer',
              onPressed: () { Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OTPScreen()
                  )
              );}, onTap: () {},
            ),
          ],

        ),
      ),
    );
  }


}






































