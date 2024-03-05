//import 'package:applicationpef/mainscreen.dart';
import 'package:flutter/material.dart';

class chat extends StatelessWidget {
  const chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar( 
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Center(
          child: Text(
            "les bon voyageur",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "flu",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: Container(
                height: 100,
                width: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage("assets/images/4.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
      actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              
              // Gérer l'action du bouton de recherche ici
            },
          ),
          IconButton(
            icon: const Icon(Icons.image),
            onPressed: () {
              // Gérer l'action du bouton de paramètres ici
            },
          ),
        ],



      ),);
  }
}