import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pfe/pages/GestionClient/signin_screen.dart';
import '../../widgets/my_button.dart';


class Forgotpassword  extends StatefulWidget {
  static const String screenRoute ='Forgotpassword';
   Forgotpassword ({Key? key}) : super(key: key);

  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword > {
  TextEditingController forgetPasswordController= TextEditingController();
  bool secourText = true;
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height:175),
              SizedBox(
                height: 30,
                child: Text(' Mot de passe Oublié !',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height:40),
              SizedBox(
                height:200,
                child: Image.asset('assets/images/Daco_4813615.png'),
              ),
              const SizedBox(height:30),
              TextFormField(
                controller: forgetPasswordController,
                textAlign: TextAlign.center,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Entrez votre email',
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
                onPressed: () async {
                  var forgotEmail = forgetPasswordController.text.trim();

                  try{
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: forgotEmail)
                        .then((value)=>{print("Email Envoyer !"),
                      Get.off(()=> SignInScreen()),
                    });
                  } on FirebaseAuthException catch (e){
                    print("Error $e");
                  }


                }, onTap: () {  }, text: '', textColor: Colors.white,
              ),
            ],

          ),
        ),
      ),
    );
  }
}






































