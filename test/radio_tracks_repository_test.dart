import 'package:app_musicplayer1/models/music_model.dart';
import 'package:app_musicplayer1/repository/radio_tracks_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  
  RadioTracksRepository radioTracksRepository = RadioTracksRepository();

  test("Testar se o metodo getRadioTracks está funcionando corretament", () async{
    List <MusicModel> radioTracks = await radioTracksRepository.getRadioTracks(35285);

    expect(radioTracks, isNotEmpty);
  });

}