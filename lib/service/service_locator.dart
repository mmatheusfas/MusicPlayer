import 'package:app_musicplayer1/controllers/controller_favorites.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

serviceLocator (){
  getIt.registerLazySingleton<FavoritesController>(() => FavoritesController());
}