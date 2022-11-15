import 'package:app_musicplayer1/controllers/controller_favorites.dart';
import 'package:app_musicplayer1/service/service_locator.dart';
import 'package:app_musicplayer1/widgets/music_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:lottie/lottie.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  var favoritesController = getIt<FavoritesController>();

  @override
  Widget build(BuildContext context) {

    var height =MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.do_not_touch, color: Colors.black,),
        title: const Text(
            "Favorites",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),

      body: Container(
        color: Colors.grey.shade900,
        child: FutureBuilder(
          future: favoritesController.recuperarFavorites(),
          builder: (_, snapshot){
            switch (snapshot.connectionState) {
                      case ConnectionState.active:
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case ConnectionState.done:
                        return Observer(builder:(context) {
                          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                          return Expanded(
                            child: ListView.builder(
                                  itemCount: snapshot.data!.length,
                                  itemBuilder: (context, index){
                                    var music = snapshot.data![index];
                                    return Dismissible(
                                      direction: DismissDirection.endToStart,
                                      onDismissed: ((direction) {
                                        favoritesController.removeFavorites(music.id, music.favorite!);
                                      }),
                                      background: Container(
                                        color: Colors.red,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: const <Widget> [
                                            Icon(Icons.delete, size: 50)
                                          ],
                                        ),
                                      ),
                                      key: Key(music.artistName), 
                                      child: MusicContainer(music)
                                    );
                                  }
                                )
                          );
                        }else {
                          return Center(
                              child: Lottie.network(
                                "https://assets2.lottiefiles.com/packages/lf20_ydo1amjm.json",
                                height:  height * 0.3,
                                width:  width ,
                                fit: BoxFit.fill
                              ),
                            );
                        }
                        });
                    }
            }
          )
        ),
      );
  }
}