import 'package:app_musicplayer1/models/genre_model.dart';
import 'package:app_musicplayer1/models/radio_model.dart';
import 'package:app_musicplayer1/repository/genre_repository.dart';
import 'package:app_musicplayer1/repository/radio_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  
RadioRepository radioRepository = RadioRepository();
TextEditingController textController = TextEditingController();
GenreRepository genreRepository = GenreRepository();
FirebaseAuth auth = FirebaseAuth.instance;

Future <List<RadioModel>> getRadiosApi (){
  try {
    return radioRepository.getRadios();
  } catch (e) {
    throw Exception();
  }
}

Future <List<GenreModel>> getGenreApi (){
  try {
    return genreRepository.getGenres();
  } catch (e) {
    throw Exception();
  }
} 

 void signOut (){
    auth.signOut();
  }



}