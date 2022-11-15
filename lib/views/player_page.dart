import 'package:app_musicplayer1/controllers/controller_player_mobx.dart';
import 'package:app_musicplayer1/models/music_model.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

//To Do
//Adicionar favorites e rebuildar a pagina

class Player extends StatefulWidget {
  MusicModel music;
  Player(this.music, {super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  PlayerController playerController = PlayerController();
  bool isPlaying = false;
  var audioplayer = AudioPlayer();
  Duration position = Duration.zero;

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height - AppBar().preferredSize.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            playerController.stopMusic(widget.music.musicPreview);
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back, color: Colors.white,)
        ),
        title: Text(
          widget.music.albumName,
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        color: Colors.black87,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Observer(builder: (context) {
                  return IconButton(
                    iconSize: 50,
                    color: Colors.white,
                    onPressed: () {
                      playerController.addFavorites(widget.music);
                      setState(() {
                        playerController.iconFavorite(widget.music);
                      });
                    },
                    icon: playerController.iconFavorite(widget.music),
                  );
                })
              ],
            ),
            SizedBox(height: height * 0.04,),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.music.albumCover)),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey[700]!,
                        blurRadius: 5,
                        offset: const Offset(3, 4))
                  ]),
            ),
            SizedBox(height: height * 0.04,),
            Container(
              child: Column(
                children: <Widget>[
                  Text(widget.music.musicTitle,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                          Text(
                            widget.music.artistName, 
                            style: const TextStyle(fontSize: 25, color: Colors.white)
                          ),
                ],
              ),
            ),
            SizedBox(height: height * 0.04,),
            Container(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  children: <Widget>[
                    Observer(
                      builder: (context){
                        return LinearProgressIndicator(
                          minHeight: 5,
                          value: playerController.totalSeconds.toDouble()/30,
                          backgroundColor: Colors.white,
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.blue),
                          );
                      }
                    ),
                    
                    Container(
                      padding: const EdgeInsets.only(top: 5),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Observer(
                                builder: (_){
                                  return Text(
                                    "0:${playerController.formatSec(position.inSeconds)}",
                                    style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                  );
                                }
                              ),
                              Expanded(child: Container()),
                              const Text(
                                "0:30",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(Icons.fast_rewind),
                                  iconSize: 75,
                                ),
                                Expanded(
                                  child: Observer(builder: ((context) {
                                    return IconButton(
                                      color: Colors.white,
                                      onPressed: () {

                                        if (playerController.isPlaying){
                                          playerController.pauseMusic(widget.music.musicPreview);
                                        }else{
                                          playerController.playMusic(widget.music.musicPreview);
                                          playerController.updateSeconds();
                                        }
                                      },
                                      icon: playerController.iconPlayPause(),
                                      iconSize: 75,
                                    );
                                  }))
                                ),
                                IconButton(
                                  color: Colors.white,
                                  onPressed: () {},
                                  icon: const Icon(Icons.fast_forward),
                                  iconSize: 75,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
