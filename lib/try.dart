import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';  //Dépendance pour afficher la carte
import 'package:latlong2/latlong.dart';         // Dépendance pour gérer les coordonnées géographiques
import 'package:url_launcher/url_launcher.dart';  // Dépendance pour lancer des URLs


class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenStreetMap'),
      ),
      body: buildMap(context),
    );
  }

@override
Widget buildMap(BuildContext context) {
  return FlutterMap(
    options: MapOptions(
      initialCenter: LatLng(51.509364, -0.128928),
      initialZoom: 9.2,
    ),
    children: [
      TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.app',
      ),
      RichAttributionWidget(
        attributions: [
          TextSourceAttribution(
            'OpenStreetMap contributors',
            onTap: () => launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
          ),
        ],
      ),
    ],
  );
}
}