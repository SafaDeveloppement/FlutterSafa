
import 'dart:convert';

Guide guideFromJson(String str) => Guide.fromJson(json.decode(str));

String guideToJson(Guide data) => json.encode(data.toJson());

class Guide {
    String firstName;
    String lastName;
    String email;
    String password;
    String confirmPassword;
    String country;
    DateTime birthdate;
    String phoneNumber;
    String idCard;
    String imageAttest;
    //String role;

    Guide({
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.confirmPassword,
        required this.country,
        required this.birthdate,
        required this.phoneNumber,
        required this.idCard,
        required this.imageAttest,
        //required this.role,
    });

    factory Guide.fromJson(Map<String, dynamic> json) => Guide(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
        country: json["country"],
        birthdate: DateTime.parse(json["birthdate"]),
        phoneNumber: json["phoneNumber"],
        idCard: json["ID_card"],
        imageAttest: json["image_attest"],
        //role: json["role"],
    );

    Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword,
        "country": country,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "phoneNumber": phoneNumber,
        "ID_card": idCard,
        "image_attest": imageAttest,
        //"role": role,
    };
}
