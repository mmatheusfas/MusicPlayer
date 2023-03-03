import 'package:app_musicplayer1/models/music_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'controller_favorites.g.dart';

class FavoritesController = _FavoritesControllerBase with _$FavoritesController;

abstract class _FavoritesControllerBase with Store {
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @observable
  ObservableList <MusicModel> favoritesMusics = ObservableList.of([]);
  
   Future <ObservableList<MusicModel>> recuperarFavorites () async{

    String? currentUser = auth.currentUser?.email;

    var querySnapshot =  await db.collection(currentUser!).get();

    if (querySnapshot.docs.isEmpty) {
      return favoritesMusics;
    }

    try {
      for (var item in querySnapshot.docs) {
        var adicionarMusica = MusicModel.fromJsonFirebase(item);
        adicionarMusica.id = item.id;
        favoritesMusics.add(adicionarMusica);
      }

      return favoritesMusics;
    } catch (e) {
      throw Exception(); 
    }
  }

  //criando e adicionando uma musica nas favoritas usando Firebase
  @action
  addFavorites (MusicModel music) async{

    var favoritada = false;

    for (var item in favoritesMusics) {
      if (music.artistName == item.artistName && music.musicTitle == item.musicTitle){
        favoritada = true;
        break;
      }
    }

    if (!favoritada){
      music.favorite = true;

      try {
        var ref = await db.collection(auth.currentUser!.email.toString())
        .add({
          "Artist Name" : music.artistName,
          "Music Title" : music.musicTitle,
          "Album Cover" : music.albumCover,
          "Music Preview" : music.musicPreview,
          "Album Name" : music.albumName,
        });

        favoritesMusics.add(music);

        return "Adicionada";
      } catch (e) {
        throw Exception();
      }
    }
  }

    @action
    removeFavorites(String? id, bool favorite){
      favorite = !favorite;
      db.collection(auth.currentUser!.email!).doc(id).delete();
    }
}



