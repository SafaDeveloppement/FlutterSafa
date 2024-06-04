

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String firstName;
    String lastName;
    String email;
    String password;
    String confirmPassword;
    String country;
    DateTime birthdate;
    //int ?phoneNumber;
    //int? idCard;
    //String? imageAttest;
    //Role role;

    User({
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.country,
        required this.birthdate,
        //this.phoneNumber,
        //this.idCard,
        //this.imageAttest,
        //required this.role,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        country: json["country"],
        birthdate: DateTime.parse(json["birthdate"]),
       
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "country": country,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
       
    };
}

