
import 'package:applicationpef/auth/ForgotPass.dart';
import 'package:applicationpef/auth/signup.dart';
import 'package:flutter/material.dart';


final _formKey = GlobalKey<FormState>();

class  login extends StatelessWidget {
 const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: const EdgeInsets.all(30.0),
      child: Form(
         key: _formKey,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [ 
            const SizedBox(
              height: 70,
            ),
             const Text("Login", 
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
          const SizedBox( height: 160,),
          // Divider(),
          
                 TextFormField(
                         style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold
                      ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Username",
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
                height: 40,
                ),
      
                TextFormField(
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      //fontWeight: FontWeight.bold
                      ),
                  decoration: InputDecoration(
                    prefixIcon: 
                    const Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                  prefixIconColor: Colors.black, //countouring
                  hintText: "Password  ",
                    hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor:const  Color(0xFFDECFCF),
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
                  height: 10,
                  ),
                  Row(   
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Forgot", 
                        style: TextStyle(
                        color: Colors.black, 
                        fontSize: 14, 
                        fontWeight: FontWeight.bold),),
                        TextButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPass()),
                         );  
                         }, 
                        child: const  Text("Password ?", 
                        style: TextStyle(
                          color: Color(0xFFE1928D), 
                          fontSize: 16, 
                          fontWeight: FontWeight.bold,decoration: TextDecoration.underline,  // Add an underline
                          decorationColor: Color(0xFFE1928D),),),
                  ),],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
      
                 Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
               ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: const Text(
                          " Login ",
                          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
                          
                        ),
                      ),
                    ],),
                    const SizedBox(
                      height: 10,
                      ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const signup()),
                      );                   
                    },
                    child: 
                    const Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFFE1928D),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFE1928D),
                      ),
                    ),),
                  ],
                ),
         ],),   
      ),  
      ),
    );
  }
}