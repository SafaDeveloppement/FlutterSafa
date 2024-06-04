import 'dart:io';
import 'package:applicationpef/constante/constante.dart';
import 'package:applicationpef/models/post.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class PostService {
  Future<void> addPost(Post post, File imageFile) async {
    try {
      // Récupérer l'ID de l'utilisateur à partir de SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('_id');

      if (userId == null) {
        print('User ID not found');
        return;
      }

      // Créez une requête multipart
      var request = http.MultipartRequest(
          'POST', Uri.parse('$URL/post/addPost'));

      // Ajoutez les champs du formulaire
      request.fields['description'] = post.description ??
          ''; // Utilisez une chaîne vide comme valeur par défaut si la description est nulle
      request.fields['post_country'] = post.postCountry ??
          ''; // Utilisez une chaîne vide comme valeur par défaut si postCountry est nul

      request.fields['date'] = post.date.toIso8601String();
      request.fields['owner'] =
          userId; // Utilisez l'ID de l'utilisateur comme valeur pour l'attribut "owner"

      // Ajoutez le fichier image
      var image =
          await http.MultipartFile.fromPath('image_post', imageFile.path);
      request.files.add(image);

      // Envoyez la requête
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      // Vérifiez la réponse
      if (response.statusCode == 200) {
        print('Post added successfully');
      } else {
        print('Failed to add post: ${response.statusCode}');
        print(responseBody.toString());
      }
    } catch (error) {
      print('Error adding post: $error');
    }
  }
}
