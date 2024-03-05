//import 'package:applicationpef/widgets/group.dart';
import 'package:applicationpef/mainscreen.dart';
import 'package:applicationpef/widgets/group.dart';
import 'package:applicationpef/widgets/searchbar.dart';
import 'package:flutter/material.dart';

class groups extends StatefulWidget {
  const groups({super.key});

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
       title:const Center(
         child: const Text("Group",
               style:TextStyle(
               fontSize: 40,
               fontWeight: FontWeight.bold,),
               ),
       ) ,
      leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // icône du menu ou de retour
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
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Gérer l'action du bouton de recherche ici
            },
          ),
          IconButton(
            icon: Icon(Icons.message),
            onPressed: () {
              // Gérer l'action du bouton de paramètres ici
            },
          ),
        ],
      ),
      body: Column(

        children: [
          SizedBox(height: 20,),
           Row(
             children: [
               Container( height:50, width:330, child: searchbar()),
               IconButton(
                        icon: const Icon(Icons.group_add_outlined),
                        onPressed: () {},
                      ),
             ],
           ),
            SizedBox(height: 30,),
           group(nomgroupe: "les bon voyageurs" , profil: "assets/images/9.jpg",)
       
       
       
       

      
        ],
      ),
    );
  }
}