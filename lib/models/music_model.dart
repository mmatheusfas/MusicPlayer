import 'package:cloud_firestore/cloud_firestore.dart';

class MusicModel {

  String musicTitle;
  String artistName;
  String albumCover;
  String musicPreview;
  String albumName;
  String? id;
  bool? favorite = false;

  MusicModel(
    this.musicTitle,
    this.artistName,
    this.albumCover,
    this.musicPreview,
    this.albumName,
  );

  factory MusicModel.fromJson (Map<String, dynamic> json) {

    return MusicModel(
      json["title"], 
      json["artist"]["name"], 
      json["album"]["cover_xl"], 
      json["preview"],
      json["album"]["title"],
    );
  }

  factory MusicModel.fromJsonFirebase (QueryDocumentSnapshot<Map<String, dynamic>> json) {

    return MusicModel(
      json["Music Title"], 
      json["Artist Name"], 
      json["Album Cover"], 
      json["Music Preview"],
      json["Album Name"],
    );
  }
  
}