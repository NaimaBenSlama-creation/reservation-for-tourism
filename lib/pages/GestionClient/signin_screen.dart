import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pfe/pages/GestionClient/registration_screen.dart';
import 'package:pfe/widgets/my_button.dart';
import '../../home/tabs_screen.dart';
import 'package:pfe/pages/GestionAdmin/profil_Admin.dart';
import '../GestionPartenaire/profilpartenaire.dart';
import 'Forgot_password.dart';


class SignInScreen extends StatefulWidget {
  static const String screenRoute = 'SignInScreen';

  SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool obscureText = true;

  late User? signedInUser;
  String? userRole; // Initialize with null
  List<String> rolesList = [];

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        await getUserRole(); // Wait for role retrieval before redirecting
        redirectToInterface();
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getUserRole() async {
    final userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(signedInUser!.uid)
        .get();

    if (userSnapshot.exists) {
      setState(() {
        userRole = userSnapshot.get('role');
      });
    }
  }

  Future<void> signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // Wait for the authentication process to complete
      await Future.delayed(Duration(seconds: 1));

      getCurrentUser();
    } catch (e) {
      print(e);
    }
  }


  void redirectToInterface() {
    if (userRole == 'admin') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(),
        ),
      );
    } else if (userRole == 'client') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const TabsScreen(),
        ),
      );
    } else if (userRole == 'partenaire') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>  profilpartenaire(),
        ),
      );
    } else {
      // Rôle non reconnu ou non défini
      // Gérer cette situation en conséquence
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white60,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: Colors.blue,
              size: 30,
            ),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 40),
              Text(
                'Se Connecter',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 200,
                child: Image.asset('assets/images/—Pngtree—seaside travel essentials_6169555.png'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_rounded),
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
              const SizedBox(height: 10),
              TextField(
                controller: _passwordController,
                obscureText: obscureText,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_rounded),
                  labelText: 'Mot de passe',
                  hintText: 'Entrer votre mot de passe',
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.orange,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      obscureText ? Icons.visibility : Icons.visibility_off,
                      color: obscureText ? Colors.grey : Colors.blue,
                    ),
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Forgotpassword()),
                  );
                },
                child: const Text(
                  'Mot de passe oublié?',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MyButton(
                text: 'Se connecter',
                color: Colors.blue,
                onPressed: signIn,
                title: 'Se connecter',
                onTap: () {},
                textColor: Colors.white,
              ),
              const SizedBox(height: 10),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Vous n'avez pas de compte ?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegistrationScreen.screenRoute);
                    },
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
