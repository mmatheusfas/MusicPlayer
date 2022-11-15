import 'dart:async';
import 'package:app_musicplayer1/controllers/controller_favorites.dart';
import 'package:app_musicplayer1/service/service_locator.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../models/music_model.dart';
part 'controller_player_mobx.g.dart';

class PlayerController = _PlayerControllerBase with _$PlayerController;

abstract class _PlayerControllerBase with Store {

  @observable
  bool isPlaying = false;


  @observable
  int totalSeconds = 0;

  var audioplayer = AudioPlayer();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var favoritesController = getIt<FavoritesController>();

  //Dar play na musica
  @action
  playMusic (String url) async{

    isPlaying = !isPlaying;

    await audioplayer.setSourceUrl(url);
    audioplayer.resume(); 
  }

  @action
  pauseMusic(String url) async {

    isPlaying = !isPlaying;

    await audioplayer.setSourceUrl(url);
    audioplayer.pause();
  }

  @action
  stopMusic (String url) async{
    isPlaying = !isPlaying;

    await audioplayer.setSourceUrl(url);
    audioplayer.stop();
  }

  @action
  updateSeconds (){
    if (isPlaying){
      Timer.periodic(const Duration(seconds: 1), (timer){
        totalSeconds++;

        if (!isPlaying || totalSeconds == 30){
          timer.cancel();
        }
       }
      );
    }
  }

  Icon iconPlayPause (){
    if (isPlaying) {
      return const Icon(Icons.pause_circle_filled_outlined);
    } 

    return const Icon(Icons.play_circle_outlined);
  }

  //Formantando os seconds (1 = 01)
  String formatSec(int seconds){

    String formatedSeconds = (totalSeconds % 60).toString();

    if (formatedSeconds.length == 1){
      formatedSeconds = "0$formatedSeconds";
    }

    return formatedSeconds;
  }

  //adicionando uma musica nas favoritas usando Firebase
  void addFavorites (MusicModel music) async{
    favoritesController.addFavorites(music);
  }

  Icon iconFavorite (MusicModel music){
    if (music.favorite!) {
      return const Icon(Icons.favorite);
    }

    return const Icon(Icons.favorite_border);
  }



  

}