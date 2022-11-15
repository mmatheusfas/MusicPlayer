import 'package:app_musicplayer1/models/music_model.dart';
import 'package:app_musicplayer1/repository/radio_tracks_repository.dart';
import 'package:app_musicplayer1/repository/search_repository.dart';

class MusicResultsController {
  
  SearchRepository searchRepository = SearchRepository();
  RadioTracksRepository radioTracksRepository = RadioTracksRepository();
 
  Future <List<MusicModel>> getMusics (String querry){
    try {
      return searchRepository.searchResults(querry);
    } catch (e) {
      throw Exception();
    }
  }

  Future <List<MusicModel>> getRadioTrack (int? id){
    try {
      return radioTracksRepository.getRadioTracks(id!);
    } catch (e) {
      throw Exception();
    }
  }





}