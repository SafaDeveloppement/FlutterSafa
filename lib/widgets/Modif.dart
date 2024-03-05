import 'package:flutter/material.dart';



class Modif extends StatelessWidget {
  const Modif({
    Key? key,
    this.label = "",
    this.hint = "",
    this.uneIcone,
    this.TypeClavier = TextInputType.text,
    this.valider, this.taille, this.tailleh,
  }) : super(key: key);
  final double ? taille;
  final double ? tailleh;
  final String label;
  final String hint;
  final IconData? uneIcone;
  final TextInputType? TypeClavier;
  final String? Function(String?)? valider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: tailleh,
      width:taille,
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        keyboardType: TypeClavier,
        style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(fontSize: 18, color: Colors.grey),
          hintText: hint,
          hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
          border: InputBorder.none, // Remove border
          filled: true,
          fillColor: Colors.white,
          errorStyle: TextStyle(fontSize: 18),
        ),
        validator: valider,
      ),
    );
  }
}
