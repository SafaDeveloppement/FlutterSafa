import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String title, asset, profil ,place,name,date;
  final Function? onTap, onFav;

  const Post({
    Key? key,
    required this.title,
    required this.place,
    required this.asset,
    required this.profil,
    required this.name,
    required this.date,
    this.onTap,
    this.onFav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: 500,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            const SizedBox(height: 7,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               // const SizedBox(height: 30, width: 20,), ------------------------
                Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(profil),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
           
           const SizedBox(width:5,),
            Text(
              name,
              style: const TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width:200),
            Text(
              date,
              style: const TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
            ),
              ],),
            const SizedBox(
              height: 1,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                color: Color(0xFF168C85),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                asset,
                height: 230,
                width: 380,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.place,
                    color: Colors.black,
                  ),
                ),

                Text(place),
                const SizedBox(width: 65),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.comment,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
