import 'package:app_musicplayer1/repository/firebase_auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {

  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassoword = TextEditingController();
  var firebaseAuth = AuthRepository();
  String errorLogin = '';
 
  Future <String> signInFirebase (String email, String password) async{
    try {
      var result = await firebaseAuth.logar(email, password);
      if (result) {
        return "Logado";
      } 
    } on FirebaseAuthException catch (e) {
      
       if (e.code == "invalid-email"){
        return "Invalid e-mail or password";
      }
      if (e.code == "user-disabled"){
        return "Invalid e-mail or password";
      }
      if (e.code == "user-not-found"){
        return "User not found";
      }
      if (e.code == "wrong-password"){
        return "Invalid e-mail or password";
      }
    }
    throw Exception();
  }

   void currentUser (){
    var usuarioAtual = auth.currentUser;
    try {
      print(usuarioAtual!.email);
      auth.signOut();
    } catch (e) {
      print("NULL");
    }
  }

  void resetTextFormField (){
    controllerEmail.text = '';
    controllerPassoword.text = '';
  }

}