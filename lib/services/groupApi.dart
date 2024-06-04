import 'dart:io';

//import 'package:applicationpef/constante/constante.dart';
import 'package:applicationpef/constante/constante.dart';
import 'package:applicationpef/models/group.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GroupService {
  Future<void> Creategroup(
      Group group, File imageFile, BuildContext context) async {
    try {
      // Récupérer l'ID de l'utilisateur à partir de SharedPreferences
       SharedPreferences prefs = await SharedPreferences.getInstance();
       String? userId = prefs.getString('_id');

      if (userId == null) {
         print('User ID not found');
         return;
       }

      // Créez une requête multipart

      var request =
          http.MultipartRequest('POST', Uri.parse('$URL/group/addgroup'));

      // Ajoutez les champs du formulaire
      request.fields['groupName'] = group.groupName ?? '';
      // Utilisez une chaîne vide comme valeur par défaut si la description est nulle
      // request.fields['post_country'] = post.post_country ??
      //     ''; // Utilisez une chaîne vide comme valeur par défaut si postCountry est nul

      //request.fields['date'] = post.date.toIso8601String();
      request.fields['owner'] =userId; // Utilisez l'ID de l'utilisateur comme valeur pour l'attribut "owner"

      // Ajoutez le fichier image
      var image =await http.MultipartFile.fromPath('image_group', imageFile.path);
      request.files.add(image);

      var response = await request.send();
      var responseBody = await response.stream.bytesToString();

      // Vérifiez la réponse
      if (response.statusCode == 200) {
        print('Post added successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Create group successfully'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        print('Failed to Create group: ${response.statusCode}');
        print(responseBody.toString());
      }
    } catch (error) {
      print('Error Creating Group: $error');
    }
  }
}

// import 'dart:convert';
// import 'package:applicationpef/constante/constante.dart';
// //import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:applicationpef/models/group.dart';

// class GroupApiCall {
//   Future<void> postGroup(Group group) async {
//     try {
//       const url = '$URL/group/addgroup';
//       final response = await http.post(
//         Uri.parse(url),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(group.toJson()),
//       );

//       if (response.statusCode == 200) {
//         print("Group created Succefully");
//       } else {
//         final errorMessage = _mapErrorMessage(response.body);
//          print('Error creating group: $errorMessage');
//       }
//     } catch (error) {
//       print('error: $error');
//     }
//   }

//   String _mapErrorMessage(String responseBody) {
//     try {
//       final decodedBody = jsonDecode(responseBody);
//       if (decodedBody.containsKey('error')) {
//         return decodedBody['error'];
//       }
//     } catch (e) {
//       return 'An error occurred';
//     }
//     return 'An unexpected error occurred';
//   }
// }