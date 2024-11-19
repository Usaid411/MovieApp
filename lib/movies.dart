import 'dart:convert';

List<Welcome> welcomeFromJson(String str) =>
    List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  int id;
  String movie;
  double rating;
  String image;
  String imdbUrl;

  Welcome({
    required this.id,
    required this.movie,
    required this.rating,
    required this.image,
    required this.imdbUrl,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["id"],
        movie: json["movie"],
        rating: json["rating"]?.toDouble(),
        image: json["image"],
        imdbUrl: json["imdb_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "movie": movie,
        "rating": rating,
        "image": image,
        "imdb_url": imdbUrl,
      };
}
