import 'package:applicationpef/chat.dart';
import 'package:flutter/material.dart';

class group extends StatelessWidget {

  final nomgroupe ,  profil;
  const group({super.key,   required  this.nomgroupe, this.profil});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical:1.0),
      child: Card(
        color: Color.fromARGB(255, 255, 255, 255),
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
              const SizedBox(width: 30,),
              Column(
                children: [
                Text(
                nomgroupe,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
               const SizedBox(height: 7,),
              
                ]
              ),
               const SizedBox(width: 60,),
              Column(
                children: [
                  const SizedBox(height: 6,),
                 IconButton(
                        icon: const Icon(Icons.add , size: 20,),
                        onPressed: () {


                           Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const chat()),
                    );        
                        },
                      ),
                      Text("Join"),
                ]
              ),
              
            ],
          ),
        )
        ),
    );
  }
}