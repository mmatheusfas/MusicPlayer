import 'package:app_musicplayer1/models/genre_model.dart';
import 'package:app_musicplayer1/repository/genre_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  GenreRepository genreRepository = GenreRepository();
  test("Testar se a função getGenres está funcionando corretamente", () async{
    List <GenreModel> genres = await genreRepository.getGenres();

    expect(genres, isNotEmpty);
    expect(genres[0].name, "Todos");
  });


}