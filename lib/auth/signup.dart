import 'package:applicationpef/auth/formulaireguide.dart';
import 'package:applicationpef/mainscreen.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<signup> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text("Sign Up!", 
                style: TextStyle(
                  color: Colors.black, 
                  fontWeight: FontWeight.bold, 
                  fontSize: 45,shadows: [
                    Shadow(
                      offset: Offset(2, 2),
                      color: Colors.grey,
                      blurRadius: 3,
                    ),
                  ],),
                  ),
                const SizedBox( height: 30,),
                TextFormField(
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "First Name ",
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
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Last Name ",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: Color(0xFFDECFCF),
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
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Email ",
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
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                   prefixIcon: const Icon(
                    Icons.lock_open,
                    color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Password ",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: Color(0xFFDECFCF),
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
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                    Icons.lock,
                    color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: Color(0xFFDECFCF),
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
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                    Icons.flag,
                    color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Country",
                    hintStyle: TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: Color(0xFFDECFCF),
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
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                    Icons.date_range,
                    color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "BirthDate", 
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
                  height: 35,
                ),
              
                  TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => guideform()),
                    );
                    
                  },
                  child: const Text(
                    'cklick here if you are a guide ',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),),
                  const Text('You must fill in the blanks first.'),
                  const SizedBox(
                  height: 25,
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
                          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
                          
                        ),
                      ),
                    ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
