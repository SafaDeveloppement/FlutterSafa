import 'dart:convert';

import 'package:applicationpef/models/CountryModel.dart';

List<City> cityFromJson(String str) => List<City>.from(json.decode(str).map((x) => City.fromJson(x)));

String cityToJson(List<City> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class City {
    String id;
    String cityName;
    String imageCity;
    String evaluationCity;
    Country? ownerCountry;

    City({
        required this.id,
        required this.cityName,
        required this.imageCity,
        required this.evaluationCity,
        this.ownerCountry,
    });

    factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["_id"],
        cityName: json["cityName"],
        imageCity: json["image_city"],
        evaluationCity: json["evaluation_city"],
        
        ownerCountry: json["ownerCountry"] == null ? null : Country.fromJson(json["ownerCountry"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cityName": cityName,
        "image_city": imageCity,
        "evaluation_city": evaluationCity,
        "ownerCountry": ownerCountry?.toJson(),
    };
}

