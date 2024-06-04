import 'dart:convert';

// Classe User pour représenter les données utilisateur
class Login {
  String userName;
  String password;

  Login({
    required this.userName,
    required this.password,
  });

  // Conversion du JSON en objet User
  factory Login.fromJson(Map<String, dynamic> json) => Login(
        userName: json["userName"],
        password: json["password"],
      );

  // Conversion de l'objet User en JSON
  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
      };
}