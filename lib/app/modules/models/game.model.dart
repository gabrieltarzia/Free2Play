class Game {
  int? id;
  String? title;
  String? thumbnail;
  String? status;
  String? shortDescription;
  String? description;
  String? gameUrl;
  String? genre;
  String? platform;
  String? publisher;
  String? developer;
  String? releaseDate;
  String? freetogameProfileUrl;
  MinimumSystemRequirements? minimumSystemRequirements;
  List<Screenshots>? screenshots;

  Game(
      {this.id,
      this.title,
      this.thumbnail,
      this.status,
      this.shortDescription,
      this.description,
      this.gameUrl,
      this.genre,
      this.platform,
      this.publisher,
      this.developer,
      this.releaseDate,
      this.freetogameProfileUrl,
      this.minimumSystemRequirements,
      this.screenshots});

  Game.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    title = json['title'];
    thumbnail = json['thumbnail'];
    status = json['status'];
    shortDescription = json['short_description'];
    description = json['description'];
    gameUrl = json['game_url'];
    genre = json['genre'];
    platform = json['platform'];
    publisher = json['publisher'];
    developer = json['developer'];
    releaseDate = json['release_date'];
    freetogameProfileUrl = json['freetogame_profile_url'];
    minimumSystemRequirements = json['minimum_system_requirements'] != null
        ? MinimumSystemRequirements.fromJson(
            json['minimum_system_requirements'])
        : null;
    if (json['screenshots'] != null) {
      screenshots = <Screenshots>[];
      json['screenshots'].forEach((v) {
        screenshots!.add(Screenshots.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['thumbnail'] = thumbnail;
    data['status'] = status;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['game_url'] = gameUrl;
    data['genre'] = genre;
    data['platform'] = platform;
    data['publisher'] = publisher;
    data['developer'] = developer;
    data['release_date'] = releaseDate;
    data['freetogame_profile_url'] = freetogameProfileUrl;
    if (minimumSystemRequirements != null) {
      data['minimum_system_requirements'] =
          minimumSystemRequirements!.toJson();
    }
    if (screenshots != null) {
      data['screenshots'] = screenshots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MinimumSystemRequirements {
  String? os;
  String? processor;
  String? memory;
  String? graphics;
  String? storage;

  MinimumSystemRequirements(
      {this.os, this.processor, this.memory, this.graphics, this.storage});

  MinimumSystemRequirements.fromJson(Map<dynamic, dynamic> json) {
    os = json['os'];
    processor = json['processor'];
    memory = json['memory'];
    graphics = json['graphics'];
    storage = json['storage'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data =  <dynamic, dynamic>{};
    data['os'] = os;
    data['processor'] = processor;
    data['memory'] = memory;
    data['graphics'] = graphics;
    data['storage'] = storage;
    return data;
  }
}

class Screenshots {
  int? id;
  String? image;

  Screenshots({this.id, this.image});

  Screenshots.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}