import 'package:flutter/material.dart';
import 'package:applicationpef/mainscreen.dart';
import 'package:applicationpef/widgets/group.dart';
import 'package:applicationpef/widgets/searchbar.dart';
import 'groupChat.dart'; // Importez la classe groupChat

class groups extends StatefulWidget {
  const groups({Key? key}) : super(key: key);
  @override
  State<groups> createState() => _groupsState();
}

class _groupsState extends State<groups> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Center(
          child: Text(
            "Group",
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // icône du menu ou de retour
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const mainscreen()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Gérer l'action du bouton de recherche ici
            },
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              // Gérer l'action du bouton de paramètres ici
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Container(
                height: 50,
                width: 330,
                child: searchbar(),
              ),
              IconButton(
                icon: const Icon(Icons.group_add_outlined),
                onPressed: () {
                  // Naviguer vers la page groupChat lors de l'appui sur l'IconButton
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  Creategroup()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          // Exemple de widget group
          const group(
            nomgroupe: "les bon voyageurs",
            profil: "assets/images/9.jpg",
          ),
        ],
      ),
    );
  }
}
