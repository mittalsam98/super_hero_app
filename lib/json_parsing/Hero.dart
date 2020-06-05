import 'dart:convert';

SuperHero superHeroFromJson(String str) {
  return SuperHero.fromJson(json.decode(str));
}

class SuperHero {
  String response;
  String resultsFor;
  List<Result> results;

  SuperHero({
    this.response,
    this.resultsFor,
    this.results,
  });

  factory SuperHero.fromJson(Map<String, dynamic> json) {
    return SuperHero(
      response: json["response"],
      resultsFor: json["results-for"],
      results:
          List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );
  }
}

class Result {
  String id;
  String name;
  Powerstats powerstats;
  Biography biography;
  Image image;

  Result({
    this.id,
    this.name,
    this.powerstats,
    this.biography,
    this.image,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      id: json["id"],
      name: json["name"],
      powerstats: Powerstats.fromJson(json["powerstats"]),
      biography: Biography.fromJson(json["biography"]),
      image: Image.fromJson(json["image"]),
    );
  }
}

class Biography {
  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography({
    this.fullName,
    this.alterEgos,
    this.aliases,
    this.placeOfBirth,
    this.firstAppearance,
    this.publisher,
    this.alignment,
  });

  factory Biography.fromJson(Map<String, dynamic> json) => Biography(
        fullName: json["full-name"],
        alterEgos: json["alter-egos"],
        aliases: List<String>.from(json["aliases"].map((x) => x)),
        placeOfBirth: json["place-of-birth"],
        firstAppearance: json["first-appearance"],
        publisher: json["publisher"],
        alignment: json["alignment"],
      );

  Map<String, dynamic> toJson() => {
        "full-name": fullName,
        "alter-egos": alterEgos,
        "aliases": List<dynamic>.from(aliases.map((x) => x)),
        "place-of-birth": placeOfBirth,
        "first-appearance": firstAppearance,
        "publisher": publisher,
        "alignment": alignment,
      };
}

class Image {
  String url;

  Image({
    this.url,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
      );
}

class Powerstats {
  String intelligence;
  String strength;
  String speed;
  String durability;
  String power;
  String combat;

  Powerstats({
    this.intelligence,
    this.strength,
    this.speed,
    this.durability,
    this.power,
    this.combat,
  });

  factory Powerstats.fromJson(Map<String, dynamic> json) => Powerstats(
        intelligence: json["intelligence"],
        strength: json["strength"],
        speed: json["speed"],
        durability: json["durability"],
        power: json["power"],
        combat: json["combat"],
      );
}
