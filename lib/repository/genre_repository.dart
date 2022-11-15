import 'dart:convert';

import 'package:app_musicplayer1/models/genre_model.dart';
import 'package:http/http.dart' as http;

const URL_BASE = "https://api.deezer.com/genre";

class GenreRepository {
  
  Future <List <GenreModel>> getGenres () async{

    var url = Uri.parse(URL_BASE);
    var response = await http.get(url);

    if (response.statusCode == 200){

      Map <String, dynamic> dadosJson = jsonDecode(response.body);

      try {
        List <GenreModel> genres = dadosJson["data"].map<GenreModel>(
          (map){
            return GenreModel.fromJson(map);
          }
        ).toList();

        return genres;
      } catch (e) {
        throw Exception();
      }
    }

    throw Exception();
  }




}