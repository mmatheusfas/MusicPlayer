import 'package:flutter/material.dart';

class RadioModel {

  int id;
  String title;
  String picture;

  RadioModel(
    this.id,
    this.title,
    this.picture
  );

  factory RadioModel.fromJson (Map <String, dynamic> json){
    return RadioModel(
      json["id"], 
      json["title"], 
      json["picture"]
    );
  }
  
}