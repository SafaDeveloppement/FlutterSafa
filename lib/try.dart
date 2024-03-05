import 'package:flutter/material.dart';

class VotrePageActuelle extends StatefulWidget {
  @override
  _VotrePageActuelleState createState() => _VotrePageActuelleState();
}

class _VotrePageActuelleState extends State<VotrePageActuelle> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Votre Page Actuelle"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Switch(
            value: isSwitched,
            activeColor: Color(0xFF9BAB7C),
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          if (isSwitched)
            Row(
              children: [
                Text("Length of stay "),
                SizedBox(width: 45),
                CustomCheckbox(),
                SizedBox(width: 30),
              ],
            ),
        ],
      ),
    );
  }
}

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
            color: Colors.black,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(4.0),
          color: isChecked ? Colors.black : Colors.white,
        ),
        width: 24.0,
        height: 24.0,
        child: isChecked
            ? Icon(
                Icons.check,
                size: 18.0,
                color: Colors.white,
              )
            : null,
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: VotrePageActuelle(),
    ),
  );
}
