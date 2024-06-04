import 'dart:convert';
import 'dart:io';
import 'package:applicationpef/constante/constante.dart';
import 'package:applicationpef/models/forgotPass.dart';
import 'package:applicationpef/models/guide.dart';
import 'package:applicationpef/models/loginUser.dart';
import 'package:flutter/material.dart'; // Importation ajoutée
import 'package:shared_preferences/shared_preferences.dart';
import '../models/User.dart';
import 'package:http/http.dart' as http;

class UserApiCall {
  Future<void> postUser(User user, BuildContext context) async {
    try {
      const url = '$URL/users/signupUser';
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User created successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        final errorMessage = _mapErrorMessage(jsonDecode(response.body));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error creating user: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> SinupGuide(Guide guide, File imageFile) async {
    try {
      final url = '$URL/users/signupGuide';

      // Créez une requête multipart
      var request = http.MultipartRequest('POST', Uri.parse(url));

      // Ajoutez les champs du guide à la requête
      request.fields['firstName'] = guide.firstName;
      request.fields['lastName'] = guide.lastName;
      request.fields['email'] = guide.email;
      request.fields['password'] = guide.password;
      request.fields['confirmPassword'] = guide.confirmPassword;
      request.fields['country'] = guide.country;
      request.fields['birthdate'] = guide.birthdate.toIso8601String();
      request.fields['phoneNumber'] = guide.phoneNumber;
      request.fields['ID_card'] = guide.idCard;

      // Ajoutez le fichier image à la requête
      var imageStream = http.ByteStream(imageFile.openRead());
      var length = await imageFile.length();
      var multipartFile = http.MultipartFile(
        'image_attest',
        imageStream,
        length,
        filename: imageFile.path,
      );
      request.files.add(multipartFile);

      // Envoyez la requête et récupérez la réponse
      var response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        print('User created successfully');
      } else {
        print('Failed to create user: ${response.body}');
      }
    } catch (error) {
      print('Error creating user: $error');
    }
  }
  Future<String?> loginUser(UserLogin userLogin) async {
    try {
      const url = '$URL/users/login';
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(userLogin.toJson()),
      );

      if (response.statusCode == 200) {
        // Si la connexion réussit, analysez la réponse JSON et récupérez le nom d'utilisateur et l'ID de l'utilisateur
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        String? firstName = responseBody['user']['firstName'];
        String? userId = responseBody['user']['_id'];

        // Enregistrez le nom d'utilisateur et l'ID de l'utilisateur dans SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', firstName ?? '');
        prefs.setString('_id', userId ?? '');

        print('User logged in successfully');
        return null; // Aucun message d'erreur
      } else {
        print('Failed to login user: ${response.statusCode}');
        print(response.body.toString());
        // Extraire et renvoyer le message d'erreur du JSON
        Map<String, dynamic> responseBody = jsonDecode(response.body);
        return responseBody['erreur'];
      }
    } catch (error) {
      print('Error logging in user: $error');
      return 'Une erreur s\'est produite lors de la connexion'; // Message d'erreur générique
    }
  }

  Future<void> ForgotPass(BuildContext context, ForgotPassword user) async {
    try {
      const url = '$URL/users/forgetPassword';
      final response = await http.put(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: forgotPasswordToJson(user),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset email sent successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('The email address or password is incorrect')),
        );
        print('The email address or password is incorrect: ${response.statusCode}');
        print(response.body.toString());
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
      print('Error sending password reset email: $error');
    }
  }

  String mapErrorToMessage(dynamic errorCode) {
    switch (errorCode) {
      case 'The email address or password is incorrect':
        return 'Invalid password or email. Please check your password and email and try again.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }

  String _mapErrorMessage(dynamic errorResponse) {
    // Mapping des messages d'erreur du backend à des messages conviviaux
    final error = errorResponse['message'];
    if (error.contains('Mot de passe')) {
      if (error.contains('au moins 8 caractères')) {
        return 'Le Mot de passe doit contenir au moins 8 caractères';
      } else if (error.contains('majuscule') &&
          error.contains('minuscule') &&
          error.contains('chiffre') &&
          error.contains('symbole')) {
        return 'Le Mot de passe doit contenir au moins une lettre majuscule, une lettre minuscule, un chiffre et un symbole';
      } else {
        return 'Mot de passe invalide';
      }
    } else if (error.contains('email')) {
      if (error.contains('non valide')) {
        return 'Format d\'email invalide';
      } else if (error.contains('déjà utilisé')) {
        return 'Cet email est déjà utilisé';
      } else {
        return 'Erreur de validation de l\'email';
      }
    } else if (error.contains('Nom')) {
      // Exemple de personnalisation du message d'erreur pour le nom
      return 'Le nom doit contenir entre 3 et 15 caractères';
    } else if (error.contains('Le prénom')) {
      // Exemple de personnalisation du message d'erreur pour le prénom
      return 'Le prénom doit contenir entre 3 et 15 caractères';
    } else if (error.contains('pays')) {
      // Exemple de personnalisation du message d'erreur pour le pays
      return 'Le pays est requis';
    } else if (error.contains('date de naissance')) {
      // Exemple de personnalisation du message d'erreur pour la date de naissance
      return 'La date de naissance est requise';
    } else {
      // Par défaut, afficher un message générique
      return 'Une erreur est survenue';
    }
  }
}
