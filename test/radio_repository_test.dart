import 'package:app_musicplayer1/models/radio_model.dart';
import 'package:app_musicplayer1/repository/radio_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  RadioRepository radioRepository = RadioRepository();

  test("Testar se o metodo getRadios está funcionando corretamente", () async{

    List <RadioModel> radios = await radioRepository.getRadios();

    expect(radios, isNotEmpty);
    expect(radios[0].title, 'Sertanejo');
  });
}