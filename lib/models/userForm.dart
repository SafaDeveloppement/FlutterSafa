// To parse this JSON data, do
//
//     final userForm = userFormFromJson(jsonString);

import 'dart:convert';

UserForm userFormFromJson(String str) => UserForm.fromJson(json.decode(str));

String userFormToJson(UserForm data) => json.encode(data.toJson());

class UserForm {
    String firstname;
    String lastname;
    DateTime birthdate;

    UserForm({
        required this.firstname,
        required this.lastname,
        required this.birthdate,
    });

    factory UserForm.fromJson(Map<String, dynamic> json) => UserForm(
        firstname: json["firstname"],
        lastname: json["lastname"],
        birthdate: DateTime.parse(json["birthdate"]),
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "birthdate": "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
    };
}
