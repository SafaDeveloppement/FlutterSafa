import 'package:applicationpef/auth/login.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 150,
              ),
              const Text(
                "Forgot",
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
                height: 10
                ),
              const Text(
                "Password ?",
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
              const SizedBox(height: 50),
              TextFormField(
                style: 
                const TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                   prefixIcon: const Icon(
                    Icons.mail,
                    color: Colors.black,
                  ),
                  hintText: "Email",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
                  fillColor: const Color(0xFFDECFCF),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter something';
                  }
                  return null;
                },
              ),
              const SizedBox( 
                height: 30,
                ),
      
              ElevatedButton( onPressed:() {},
              style: ElevatedButton.styleFrom( 
                primary: const Color.fromARGB(255, 0, 0, 0),), 
                child: const Text("Submit" ,
                style: TextStyle(
                  color: Colors.white ,
                  fontSize: 20 ),
                  ),
                   ),
      
              Row( 
                 mainAxisAlignment: MainAxisAlignment.end
                  ,children: [ 
                   const Text("Back To", 
                      style: TextStyle(
                      color: Colors.black, 
                      fontSize: 14, 
                      fontWeight: FontWeight.bold),),
                      TextButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => login()),
                    );  
                  }, 
                      child: const  Text("Login", 
                      style: TextStyle(
                        color: Color(0xFFE1928D), 
                        fontSize: 18, 
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,  // Add an underline
                        decorationColor: Color(0xFFE1928D),
                        ),),  // Color for the underline
                ),],
                      )
              
            ],
          ),
        ),
      ),);
  }
}