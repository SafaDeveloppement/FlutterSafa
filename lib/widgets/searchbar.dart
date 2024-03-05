import 'package:flutter/material.dart';

class searchbar extends StatelessWidget {

  final recherche;
  const searchbar({super.key,  this.recherche});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
           TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 5.0,),
                      border: OutlineInputBorder(
        
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: recherche ,
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30.0,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {},
                      ),
                    ),
                  ),
    ]
    ),
    );
  }
}