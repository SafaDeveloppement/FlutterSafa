import 'dart:convert';
import 'package:applicationpef/constante/constante.dart';
import 'package:http/http.dart' as http;

class CountryServices {

  
  static const String baseUrl = '$URL/country';

  static Future<List<dynamic>> searchCountryByName(String countryName) async {
    final response = await http.get(Uri.parse('$baseUrl/search?countryName=$countryName'));

    if (response.statusCode == 200) {
      // Si la requête est réussie, convertissez la réponse JSON en une liste dynamique et retournez-la
      return jsonDecode(response.body);
    } else {
      // Si la requête a échoué, lancez une exception avec le message d'erreur
      throw Exception('Failed to search country: ${response.statusCode}');
    }
  }
}