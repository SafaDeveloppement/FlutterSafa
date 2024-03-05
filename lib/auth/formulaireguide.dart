import 'package:applicationpef/mainscreen.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class guideform extends StatelessWidget {
  const guideform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Guide Form!",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                  shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      color: Colors.grey,
                      blurRadius: 3,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextFormField(
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  prefixIconColor: Colors.black, //countouring
                  hintText: "Phone number",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
                  fillColor: const Color(0xFFDECFCF),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter something';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  //fontWeight: FontWeight.bold
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.card_membership,
                    color: Colors.black,
                  ),
                  prefixIconColor: Colors.black, //countouring
                  hintText: "ID card Number  ",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
                  fillColor: const Color(0xFFDECFCF),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter something';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ' "Scan your certificate validating your experience as a guide"',
              ),
              const SizedBox(
                height: 350,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const mainscreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
