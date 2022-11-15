import 'dart:convert';
import 'package:app_musicplayer1/models/music_model.dart';
import 'package:http/http.dart' as http;

const URL_BASE = "https://api.deezer.com/search?q=";

class SearchRepository {

  Future <List <MusicModel>> searchResults (String querry) async{

    var url = Uri.parse(URL_BASE + querry);
    var response = await http.get(url);

    if (response.statusCode == 200){

      Map <String, dynamic> dadosJson = jsonDecode(response.body);

      try {
        List <MusicModel> musics = dadosJson["data"].map<MusicModel>(
          (map){
            return MusicModel.fromJson(map);
          }
        ).toList();

        return musics;
      } catch (e) {
        throw Exception();
      }

    }

    throw Exception();

  }
  
}