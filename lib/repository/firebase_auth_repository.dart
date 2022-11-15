import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class AuthRepository{
  
  var auth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;

  cadastrar(String email, String senha, String usuario) async{

  return await auth.createUserWithEmailAndPassword(email: email, password: senha).then((value) {
    var usuarioAdd = {
      'email' : email,
      'usuario' : usuario
    };
    firestore.collection('usuarios').add(usuarioAdd);
  }
  );

  }

  logar(String email, String senha) async{
    return await auth.signInWithEmailAndPassword(email: email, password: senha).then((value) => true);
  }

  logout()async{
    await auth.signOut();
  }




}