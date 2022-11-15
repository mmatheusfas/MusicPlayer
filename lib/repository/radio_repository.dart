import 'dart:convert';

import 'package:app_musicplayer1/models/radio_model.dart';
import 'package:http/http.dart' as http;

const URL_BASE = "https://api.deezer.com/radio/lists";

class RadioRepository {

  Future <List<RadioModel>> getRadios () async{

    var url = Uri.parse(URL_BASE);
    var response = await http.get(url);

    if (response.statusCode == 200){

      var dadosJson = jsonDecode(response.body);

      try {
        List <RadioModel> radios = dadosJson["data"].map<RadioModel>(
          (map){
            return RadioModel.fromJson(map);
          }
        ).toList();

        return radios;
      } catch (e) {
        throw Exception();
      } 
    }

    throw Exception();

  }
  
}