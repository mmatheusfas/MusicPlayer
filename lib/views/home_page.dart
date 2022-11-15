import 'package:app_musicplayer1/controllers/controller_home.dart';
import 'package:app_musicplayer1/models/genre_model.dart';
import 'package:app_musicplayer1/models/radio_model.dart';
import 'package:app_musicplayer1/views/music_results.dart';
import 'package:app_musicplayer1/widgets/genre_container.dart';
import 'package:app_musicplayer1/widgets/radio_container.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = HomeController();
  var querry = '';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.grey.shade900,
                        child: Column(
                          children: <Widget>[

                            Container(
                              //height: height * 0.2,
                              //width: width * 0.2,
                              decoration: BoxDecoration(
                                border:const Border(
                                  bottom: BorderSide(width: 2, color:  Colors.white),
                                  top: BorderSide(width: 2, color:  Colors.white),
                                  left: BorderSide(width: 2, color:  Colors.white),
                                  right: BorderSide(width: 2, color:  Colors.white),
                                ),
                                borderRadius: BorderRadius.circular(20)
                              ),
                              child:const Icon(Icons.person, size: 80),
                            ),

                            SizedBox(
                              height: height * 0.2,
                            ),

                            ElevatedButton(
                                onPressed: () {
                                  homeController.signOut();
                                  Navigator.of(context).popUntil((route) => route.isFirst);
                                },
                                child:const Text("SignOut")),
                          ],
                        ),
                      );
                    });
              },
              icon: const Icon(
                  Icons.person,
                  size: 35,
                  color: Colors.white,
                )
              ),
          title: const Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          color: Colors.grey.shade900,
          height: height,
          width: width,
          child: Stack(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white.withOpacity(0.3)),
                      padding:const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: TextField(
                        controller: homeController.textController,
                        cursorColor: Colors.white,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          label: const Text(
                            "O que você quer ouvir?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          suffixIcon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Future(() async{
                                  await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MusicResults(querry: homeController.textController.text),
                                    ));
                                }).then((_) => homeController.textController.text ='');
                              },
                              icon: const Icon(Icons.search)),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "Genres",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    FutureBuilder<List<GenreModel>>(
                        future: homeController.getGenreApi(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.active:
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            case ConnectionState.done:
                              if (snapshot.hasData) {
                                return Container(
                                  padding: const EdgeInsets.only(
                                      right: 10, top: 10, bottom: 10),
                                  height: 200,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        List<GenreModel> genres =
                                            snapshot.data!;
                                        GenreModel genre = genres[index];

                                        return GenreContainer(genre);
                                      }),
                                );
                              }
                          }
                          throw Exception();
                        }),
                  ],
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Radios",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      FutureBuilder<List<RadioModel>>(
                          future: homeController.getRadiosApi(),
                          builder: (context, snapshot) {
                            switch (snapshot.connectionState) {
                              case ConnectionState.active:
                              case ConnectionState.none:
                              case ConnectionState.waiting:
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              case ConnectionState.done:
                                if (snapshot.hasData) {
                                  return Container(
                                    padding: const EdgeInsets.only(
                                        right: 10, top: 10, bottom: 10),
                                    height: 200,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, index) {
                                          List<RadioModel> radios =
                                              snapshot.data!;
                                          RadioModel radio = radios[index];

                                          return RadioContainer(radio);
                                        }),
                                  );
                                }
                            }

                            throw Exception();
                          })
                    ],
                  ),
                )
              ],
            )
          ]),
        )
      );
  }
}
