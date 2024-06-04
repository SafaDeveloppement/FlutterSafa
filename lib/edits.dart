import 'package:flutter/material.dart';

class edits extends StatelessWidget {
  const edits({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Center(
          child: Text(
            "Edit",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255), // Couleur de fond du Scaffold (body)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch, // Étirer les enfants en largeur
          children: [
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action lorsque le bouton "Edit Profil" est appuyé
                      // Naviguer vers la page d'édition de profil
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color(0xFFDECFCF), // Couleur du texte
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordures arrondies
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person, size: 40, color: Colors.white),
                        SizedBox(width: 16),
                        Text(
                          "Edit Profil",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 16), // Espacement entre les boutons
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Action lorsque le bouton "Edit Hosting" est appuyé
                      // Naviguer vers la page d'édition de l'hébergement
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white, backgroundColor: Color(0xFFDECFCF), // Couleur du texte
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Bordures arrondies
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.home, size: 40, color: Colors.white),
                        SizedBox(width: 16),
                        Text(
                          "Edit Hosting",
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80), // Espacement entre les boutons et l'image
            Image.asset(
              'assets/images/world.png', // Chemin de l'image depuis le dossier d'assets
              width: 150, // Largeur de l'image
              height: 150, // Hauteur de l'image
            ),
          ],
        ),
      ),
    );
  }
}
