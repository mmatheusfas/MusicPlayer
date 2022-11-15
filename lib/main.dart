import 'package:app_musicplayer1/firebase_options.dart';
import 'package:app_musicplayer1/service/service_locator.dart';
import 'package:app_musicplayer1/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async{
  
  WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform 
    );

    serviceLocator();

  runApp(
    const MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    )
  );

}