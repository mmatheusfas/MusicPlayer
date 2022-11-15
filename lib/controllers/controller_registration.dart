import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegistrationController {

  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassoword= TextEditingController();


  void createNewUser(String email, String password) async {
    
    FirebaseAuth auth = FirebaseAuth.instance;

    auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value) {
        print("Usuario cadastrado!");
        auth.signOut();
      }).catchError((error) {
        print("Erro");
      });
  }
}
