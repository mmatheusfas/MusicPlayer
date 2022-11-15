import 'package:app_musicplayer1/models/music_model.dart';
import 'package:app_musicplayer1/repository/search_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  SearchRepository searchRepository = SearchRepository();

  test("Testar se o metodo searchResults está funcionando corretamente", () async{ 
    List <MusicModel> musics = await searchRepository.searchResults("djonga");

    expect(musics, isNotEmpty);
    expect(musics[0].musicTitle, 'bode');
   });
}