class Game {
  int? id;
  String? title;
  String? thumbnail;
  String? shortDescription;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;

  Game(
      {this.id,
      this.title,
      this.thumbnail,
      this.shortDescription,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl});

  Game.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    shortDescription = json['short_description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = Map<dynamic, dynamic>();
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['short_description'] = shortDescription;
    data['game_url'] = gameUrl;
    data['genre'] = genre;
    data['platform'] = platform;
    data['publisher'] = publisher;
    data['developer'] = developer;
    data['release_date'] = releaseDate;
    data['freetogame_profile_url'] = freetogameProfileUrl;
    return data;
  }
}
