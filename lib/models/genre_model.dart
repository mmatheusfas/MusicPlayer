class GenreModel {
  
  String name;
  String picture;

  GenreModel(
    this.name,
    this.picture
  );

  factory GenreModel.fromJson (Map <String, dynamic> json){
    return GenreModel(
      json["name"], 
      json["picture"]
    );
  }


}