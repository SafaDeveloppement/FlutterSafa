import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  final String asset,photos;

  const AddPost({Key? key, required this.asset, required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 200,
                width: 380,
              child: Image.asset(
                asset,
                fit: BoxFit.cover,
          ),
            ),

          ],



        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width:95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            

          ],
 ),
 Row(
          children: [
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width:95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            

          ],



        ),
        Row(
          children: [
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width:95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            

          ],



        ),
        Row(
          children: [
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width:95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            

          ],



        ),Row(
          children: [
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width: 95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            Container(
              height: 80,
                width:95,
              child: Image.asset(
                photos,
                fit: BoxFit.cover,
          ),
            ),
            

          ],



        )
        





        

      ],
    );
  }
}
