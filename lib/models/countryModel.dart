import 'dart:convert';

List<Country> countryFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
    List<City> cities;
    String id;
    String countryName;
  

    Country({
        required this.cities,
        required this.id,
        required this.countryName,
        
    });

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
        id: json["_id"],
        countryName: json["countryName"],
      
    );

    Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
        "_id": id,
        "countryName": countryName,
    
    };
}

class City {
    String id;
    String cityName;
    String imageCity;
    String evaluationCity;
    String ownerCountry;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    City({
        required this.id,
        required this.cityName,
        required this.imageCity,
        required this.evaluationCity,
        required this.ownerCountry,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"],
        cityName: json["cityName"],
        imageCity: json["image_city"],
        evaluationCity: json["evaluation_city"],
        ownerCountry: json["ownerCountry"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cityName": cityName,
        "image_city": imageCity,
        "evaluation_city": evaluationCity,
        "ownerCountry": ownerCountry,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}