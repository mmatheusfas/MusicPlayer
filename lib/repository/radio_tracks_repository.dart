import 'dart:convert';

import 'package:app_musicplayer1/models/music_model.dart';
import 'package:http/http.dart' as http;

class RadioTracksRepository {
  
  Future <List<MusicModel>> getRadioTracks (int id) async{

    var url = Uri.parse("https://api.deezer.com//radio//$id//tracks?limit=20");
    var response = await http.get(url);

    if (response.statusCode == 200){

      var dadosJson = jsonDecode(response.body);

      try {
        List <MusicModel> radioTracks = dadosJson["data"].map<MusicModel>(
          (map){
            return MusicModel.fromJson(map);
          }
        ).toList();

        return radioTracks;
      } catch (e) {
        throw Exception();
      }
    } 

    throw Exception();
  }


}