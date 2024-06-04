import 'package:applicationpef/mainscreen.dart';
import 'package:applicationpef/widgets/hosters.dart';
import 'package:applicationpef/widgets/searchbar.dart';
import 'package:flutter/material.dart';


class hosting extends StatefulWidget {
  const hosting({super.key});

  @override
  State<hosting> createState() => _hostingState();
}

class _hostingState extends State<hosting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFFF5F5F5),
       appBar: AppBar(
      backgroundColor: const Color(0xFFF5F5F5),
       title:const Center(
         child:  Text("Hosting",
               style:TextStyle(
               fontSize: 40,
               fontFamily: "flu",
               fontWeight: FontWeight.bold,),
               ),
       ) ,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios), // icône du menu ou de retour
          onPressed: () {
             Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const mainscreen()),
                    );        
            // Gérer l'action du bouton Leading ici
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
          
       const SizedBox(height: 30,),
        Container(height: 50,child: const searchbar() ,),
       const SizedBox(height: 30,),
       const  hosters(
        profil:"assets/images/8.jpg",
        nom: "minyar",
        pays: "Tunisia")
        ],
      ),
    );
  }
}