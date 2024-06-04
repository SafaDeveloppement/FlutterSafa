import 'package:applicationpef/auth/ForgotPass.dart';
import 'package:applicationpef/auth/signup.dart';
import 'package:applicationpef/mainscreen.dart';
import 'package:applicationpef/services/Auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/loginUser.dart';

final _formKey = GlobalKey<FormState>();
// Cette ligne définit une clé globale (GlobalKey) de type FormState 
// qui est utilisée pour identifier et manipuler le formulaire 

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
//Cette classe définit un widget d'état (StatefulWidget) appelé login 
//qui gère l'état de la page de connexion.

UserApiCall _userApiCall = UserApiCall();
//Cette ligne crée une instance de la classe UserApiCall 
//pour appeler les fonctions liées à l'API utilisateur.

class _loginState extends State<login> {
  late String username = '';
  bool isObsecured = false;

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? '';
    });
  }
  //sharedPreferences stock des données 
  //Cette méthode asynchrone récupère le nom d'utilisateur enregistré dans les SharedPreferences et met à jour l'état de username.
  late TextEditingController _emailcntrl;
  late TextEditingController _passwordcntrl;
  @override
  void initState() {
    super.initState();
    _emailcntrl = TextEditingController();
    _passwordcntrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailcntrl.dispose();
    _passwordcntrl.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Text(
                  "Login",
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
                  height: 160,
                ),
                // Divider(),

                TextFormField(
                  controller: _emailcntrl,
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
                    hintText: "Email",
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
                  height: 40,
                ),

                TextFormField(
                  controller: _passwordcntrl,
                  obscureText: !isObsecured,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    //fontWeight: FontWeight.bold
                  ),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black, //countouring
                    hintText: "Password  ",
                    hintStyle:
                        const TextStyle(fontSize: 14, color: Colors.white),
                    fillColor: const Color(0xFFDECFCF),
                    filled: true,
                    suffixIcon: IconButton(
                      icon: isObsecured? const Icon(CupertinoIcons.eye) : const Icon(CupertinoIcons.eye_slash),
                      color: Colors.black,
                      onPressed:(){
                        setState(() {
                          isObsecured = !isObsecured;
                          print(isObsecured); 
                        });
                      },
                      splashRadius: 12,
                    ),
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
                    const Text(
                      "Forgot",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ForgotPass()),
                        );
                      },
                      child: const Text(
                        "Password ?",
                        style: TextStyle(
                          color: Color(0xFFE1928D),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          decoration:
                              TextDecoration.underline, // Add an underline
                          decorationColor: Color(0xFFE1928D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // Si le formulaire est valide, essayez de vous connecter
                          String? errorMessage =
                              await _userApiCall.loginUser(UserLogin(
                            email: _emailcntrl.text,
                            password: _passwordcntrl.text,
                          ));

                          // Si errorMessage est null, cela signifie que la connexion a réussi
                          if (errorMessage == null) {
                            // La méthode _loadUsername récupère le nom d'utilisateur à partir de SharedPreferences
                            await _loadUsername();

                            // Si la connexion réussit, naviguez vers une autre page
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const mainscreen()),
                            );
                          } else {
                            // Sinon, affichez une SnackBar avec le message d'erreur
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(errorMessage)),
                            );
                            
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      child: const Text(
                        " Login ",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    )
                  ],
                ),
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
                          MaterialPageRoute(
                              builder: (context) => const signup()),
                        );
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFFE1928D),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFE1928D),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
