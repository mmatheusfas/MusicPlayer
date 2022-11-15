import 'package:app_musicplayer1/models/music_model.dart';
import 'package:app_musicplayer1/views/player_page.dart';
import 'package:flutter/material.dart';

class MusicContainer extends StatelessWidget {
  MusicModel music;
  MusicContainer(this.music, {super.key});

  @override
  Widget build(BuildContext context) {

     var height = MediaQuery.of(context).size.height - AppBar().preferredSize.height;
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> Player(music)));
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            Container(
              height: height * 0.15,
              width: width * 0.22,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(music.albumCover))),
            ),
            SizedBox(width: width * 0.03,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: width * 0.7,
                  child: Text(
                    music.musicTitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25
                    ),
                  ),
                ),
    
                Text(
                  music.artistName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
