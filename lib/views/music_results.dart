import 'package:app_musicplayer1/controllers/controller_music_results.dart';
import 'package:app_musicplayer1/models/music_model.dart';
import 'package:app_musicplayer1/widgets/music_container.dart';
import 'package:flutter/material.dart';

class MusicResults extends StatefulWidget {
  int? radioId = 0;
  String? querry = '';

  MusicResults({
    this.querry,
    this.radioId,
  });

  @override
  State<MusicResults> createState() => _MusicResultsState();
}

MusicResultsController musicResultsController = MusicResultsController();

class _MusicResultsState extends State<MusicResults> {
  @override
  Widget build(BuildContext context) {
    if (widget.radioId != null) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Select your music...",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Container(
            color:  Colors.grey.shade900,
            child: Column(children: <Widget>[
              FutureBuilder<List<MusicModel>>(
                  future: musicResultsController.getRadioTrack(widget.radioId),
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
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                List<MusicModel> musics = snapshot.data!;
                                MusicModel music = musics[index];
                          
                                return MusicContainer(music);
                              },
                            ),
                          );
                        }
                    }
                    throw Exception();
                  })
            ]),
          )
        );
    }else{
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              "Select your music...",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Container(
            color:  Colors.grey.shade900,
            child: Column(children: <Widget>[
              FutureBuilder<List<MusicModel>>(
                  future: musicResultsController.getMusics(widget.querry!),
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
                          return Expanded(
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                List<MusicModel> musics = snapshot.data!;
                                MusicModel music = musics[index];
                          
                                return MusicContainer(music);
                              },
                            ),
                          );
                        }
                    }
                    throw Exception();
                  })
            ]),
          )
        );
    }
    throw Exception();
  }
}
