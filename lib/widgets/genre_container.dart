import 'package:app_musicplayer1/models/genre_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenreContainer extends StatelessWidget {
  GenreModel genre;
  GenreContainer(this.genre, {super.key});

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: const EdgeInsets.only(right: 15, left: 1, top: 15, bottom: 15),
      child: Container(
        width: width * 0.32,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(genre.picture), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white.withOpacity(0.2)
            ),
            child: Text(genre.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          )
        ),
      ),
    );
  }
}