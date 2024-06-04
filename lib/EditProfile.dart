import 'package:applicationpef/profil.dart';
import 'package:applicationpef/widgets/Modif.dart';
import 'package:flutter/material.dart';

class EDIT extends StatefulWidget {
  const EDIT({super.key});

  @override
  State<EDIT> createState() => _EDITState();
}

class _EDITState extends State<EDIT> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F5),
        title: const Center(
          child: Text(
            "Edit profil",
            style: TextStyle(
              fontSize: 45,
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
              MaterialPageRoute(builder: (context) => const profil()),
            );
            // Gérer l'action du bouton Leading ici
          },
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(
                height: 50,
              ),
               Text(
                "Gmail",
                style: TextStyle(fontSize: 20, 
                fontWeight: FontWeight.bold),
              ),
               SizedBox(
                height: 20,
              ),
               Modif(
                tailleh: 50,
                hint: "Meryam@gmail.com",
              ),
               SizedBox(
                height: 30,
              ),
               Text(
                " Phone Number",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
               SizedBox(
                height: 20,
              ),
               Modif(
                tailleh: 50,
                hint: "+216 99 312 297",
              ),
               SizedBox(
                height: 20,
              ),
               Text(
                "Country",
                style: TextStyle(fontSize: 20, 
                fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Modif(
                taille: 50,
                hint: "Tunisia",
              ),
               SizedBox(
                height: 30,
              ),
               Text(
                "Language",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.bold
                  ),
              ),
               SizedBox(
                height: 20,
              ),
               Modif(
                tailleh: 50,
                hint: "English",
              ),
               SizedBox(
                height: 20,
              ), 
            ],
          ),
        ),
      ),
    );
  }
}
