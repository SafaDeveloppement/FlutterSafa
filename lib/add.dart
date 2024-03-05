import 'package:applicationpef/auth/home.dart';
import 'package:applicationpef/mainscreen.dart';
//limport 'package:applicationpef/profil.dart';
import 'package:applicationpef/widgets/addpost.dart';
import 'package:flutter/material.dart';

class add extends StatefulWidget {
  const add({super.key});

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Center(
          child: Text(
            "New Post",
            style: TextStyle(
              fontSize: 40,
              fontFamily: "flu",
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // icône du menu ou de retour
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  const mainscreen()),
            );
            // Gérer l'action du bouton Leading ici
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Home()), //change to galerie
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 231, 226, 226),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: const Text(
                    "Galerie",
                    style: TextStyle(
                        fontSize: 20, color: Color.fromARGB(255, 19, 19, 19)),
                  ),
                ),
                
              ],
            ),
            const AddPost(
                  asset:"assets/images/12.jpg", 
                  photos:"assets/images/13.jpg",
                  ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),

      ),
    );
  }
}
