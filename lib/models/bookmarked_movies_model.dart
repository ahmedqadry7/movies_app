class BookMarkedMoviesModel {
  String id;
  String title;
  String releaseDate;
  String backdropPath;

  BookMarkedMoviesModel({
    this.id = "",
    required this.backdropPath,
    required this.releaseDate,
    required this.title,
  });

  BookMarkedMoviesModel.fromJson(Map<String, dynamic> json)
    : this(
      backdropPath: json['backdropPath'],
      releaseDate: json['releaseDate'],
      title: json['title'],
      id: json['id'],
    );

  // BookMarkedMoviesModel fromJson(Map<String, dynamic> json) {
  //   return BookMarkedMoviesModel(
  //     backdropPath: json['backdropPath'],
  //     releaseDate: json['releaseDate'],
  //     title: json['title'],
  //     id: json['id'],
  //   );
  // }

  Map<String, dynamic> toJson() {
    return {
      "backdropPath": backdropPath,
      "releaseDate": releaseDate,
      "title": title,
      "id": id,
    };
  }
}
