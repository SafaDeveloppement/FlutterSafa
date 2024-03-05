import 'package:flutter/material.dart';

class hosters extends StatelessWidget {
  final nom,pays,  profil;
  const hosters({super.key, required this.nom, required this.pays, required this.profil});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:1.0),
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            children: [
              Column(
                children: [
                 Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(profil),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              
                ]
              ),
              SizedBox(width: 30,),
              Column(
                children: [
                Text(
                nom,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
               SizedBox(height: 7,),
              Text(
                pays,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
                ]
              ),
               SizedBox(width: 150,),
              Column(
                children: [
                  Container(   color: Color(0xFF9BAB7C),child: Icon(Icons.home)),
                  const SizedBox(height: 6,),
                 Container( color: Color(0xFF9BAB7C),
                   child: IconButton(
                          icon: const Icon(Icons.message_rounded , size: 10,),
                          onPressed: () {},
                        ),
                 ),
                ]
              ),
              
            ],
          ),
        )
        ),
    );

    
  }
}