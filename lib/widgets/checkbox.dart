import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black, // Couleur de la bordure noire
            width: 2.0, // Largeur de la bordure
          ),
          borderRadius: BorderRadius.circular(4.0), // Rayon de la bordure
          color: isChecked ? Colors.black : Colors.white, // Couleur du fond en fonction de l'état de la case à cocher
        ),
        width: 24.0, // Largeur de la case à cocher
        height: 24.0, // Hauteur de la case à cocher
        child: isChecked
            ? Icon(
                Icons.check,
                size: 18.0, // Taille de l'icône de coche
                color: Colors.white, // Couleur de l'icône de coche
              )
            : null,
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: CustomCheckbox(),
        ),
      ),
    ),
  );
}
