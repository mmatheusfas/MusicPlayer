import 'package:app_musicplayer1/models/radio_model.dart';
import 'package:app_musicplayer1/views/music_results.dart';
import 'package:flutter/material.dart';

class RadioContainer extends StatelessWidget {
  RadioModel radio;
  RadioContainer(this.radio, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(right: 15, left: 1, top: 15, bottom: 15),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MusicResults(radioId: radio.id)));
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.32,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(radio.picture), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20)
          ),
          child: Center(
            child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white.withOpacity(0.2)
            ),
            child: Text(radio.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          )
          ),
        ),
      ),
    );
  }
}