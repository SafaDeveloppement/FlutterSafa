import 'package:applicationpef/auth/login.dart';
import 'package:applicationpef/auth/signup.dart';
import 'package:flutter/material.dart';

class starting1 extends StatelessWidget {
  const starting1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              "assets/images/1.jpg",
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Magical",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0,
                        0), // Change color to a visually appealing one
                    fontFamily: 'titre', // Use the 'Italianno' font family
                    fontSize: 85,
                    fontWeight: FontWeight.bold, // Make the text bold
                    fontStyle: FontStyle.italic, // Apply italic style
                    letterSpacing: 2.0, // Add some letter spacing
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                const Text(
                  "Travel",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0,
                        0), // Change color to a visually appealing one
                    fontFamily: 'titre', // Use the 'Italianno' font family
                    fontSize: 70,
                    fontWeight: FontWeight.bold, // Make the text bold
                    fontStyle: FontStyle.italic, // Apply italic style
                    letterSpacing: 2.0, // Add some letter spacing
                  ),
                ),
                const SizedBox(
                  height: 250,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const signup()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: const Text(
                        "Sign up!",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const login()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                      ),
                      child: const Text(
                        "Login",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Utiliser Spacer pour pousser les boutons vers le bas
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
