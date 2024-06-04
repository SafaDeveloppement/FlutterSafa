import 'package:applicationpef/auth/login.dart';
import 'package:applicationpef/models/forgotPass.dart';
import 'package:applicationpef/services/Auth.dart';
import 'package:flutter/material.dart';

final _formKey = GlobalKey<FormState>();

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}
   UserApiCall _userApiCall = UserApiCall();
class _ForgotPassState extends State<ForgotPass> {
  late TextEditingController _emailcntrl;
  @override
  void initState() {
    super.initState();
    _emailcntrl = TextEditingController();
  }
  @override
  void dispose() {
    _emailcntrl.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 100,
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
                Text(
              'Enter your email and we will send you a new password.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: Colors.grey,
              ),
            ),
                const SizedBox(height: 50),
                TextFormField(
                  controller: _emailcntrl,
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
        
                ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      _userApiCall.ForgotPass(context, ForgotPassword(
        email: _emailcntrl.text,
      ));
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const login()),
      // );
    }
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: const Color.fromARGB(255, 0, 0, 0),
  ),
  child: const Text(
    "Submit",
    style: TextStyle(color: Colors.white, fontSize: 20),
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
        ),
      ),);
  }
}