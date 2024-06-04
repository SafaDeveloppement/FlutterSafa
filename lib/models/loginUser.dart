
import 'dart:convert';

UserLogin userLoginFromJson(String str) => UserLogin.fromJson(json.decode(str));

String userLoginToJson(UserLogin data) => json.encode(data.toJson());

class UserLogin {
  String email;
  String password;
  String? firstName;
  String? id; // Ajoutez le champ username

  UserLogin({
    required this.email,
    required this.password,
    this.firstName,
    this.id // Initialisez-le à null par défaut
  });

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      email: json['email'],
      password: json['password'],
      firstName: json['firstName'],
        id: json['id'], // Assurez-vous que le champ username existe dans la réponse JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName, 
      'id': id,// Assurez-vous que le champ username est inclus lors de la conversion en JSON
    };
  }
}
