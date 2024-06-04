
import 'package:applicationpef/constante/constante.dart';
import 'package:flutter/material.dart';
import 'package:applicationpef/models/CountryModel.dart';
import 'package:applicationpef/services/CountryServices.dart';

class country extends StatefulWidget {
  @override
  _countryState createState() => _countryState();
}

class _countryState extends State<country> {
  CountryServices  _CountryServices = CountryServices();
  List<Country> searchResults = [];
  Future<void> searchCountry(String countryName) async {
    try {
      final List<dynamic> results = await CountryServices.searchCountryByName(countryName);
      setState(() {
        searchResults = results.map((result) => Country.fromJson(result)).toList();
      });
    } catch (error) {
      print('Error searching country: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ma Page'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              onChanged: (value) {
                searchCountry(value);
              },
              decoration: InputDecoration(
                hintText: 'Rechercher...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                // Check if index is within bounds
                if (index < searchResults.length) {
                  // Access the current country
                  final Country country = searchResults[index];
                  // Check if cities is not null and not empty
                  if (country.cities != null && country.cities.isNotEmpty) {
                    return Column(
                      children: [
                        // Display all cities for the current country
                        for (int i = 0; i < country.cities.length; i += 2)
                          Row(
                            children: [
                              Expanded(
                                child: Card(
                                  child: Column(
                                    children: [
                                      // Display the image using Image.network
                                      country.cities[i].imageCity != null
                                          ? Image.network(
                                              "$URL/${country.cities[i].imageCity}",
                                              width: double.infinity, // adjust as needed
                                              height: 160, // adjust as needed
                                              fit: BoxFit.cover,
                                            )
                                          : Text('No image available'),
                                      // Display the cityName
                                      Text(country.cities[i].cityName),
                                    ],
                                  ),
                                ),
                              ),
                              if (i + 1 < country.cities.length)
                                Expanded(
                                  child: Card(
                                    child: Column(
                                      children: [
                                        // Display the image using Image.network
                                        country.cities[i + 1].imageCity != null
                                            ? Image.network(
                                                "$URL/${country.cities[i + 1].imageCity}",
                                                width: double.infinity, // adjust as needed
                                                height: 160, // adjust as needed
                                                fit: BoxFit.cover,
                                              )
                                            : Text('No image available'),
                                        // Display the cityName
                                        Text(country.cities[i + 1].cityName),
                                      ],
                                    ),
                                  ),
                                ),
                            ],
                          ),
                      ],
                    );
                  } else {
                    // Handle case where cities is null or empty
                    return Card(
                      child: Center(
                        child: Text('No city data available'),
                      ),
                    );
                  }
                } else {
                  // Handle case where index is out of bounds
                  return Card(
                    child: Center(
                      child: Text('Index out of bounds'),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}