//import 'package:applicationpef/auth/starting2.dart';
//import 'package:applicationpef/auth/starting3.dart';
//import 'package:applicationpef/auth/signup.dart';
//import 'package:applicationpef/auth/formulaireguide.dart';
//import 'package:applicationpef/auth/login.dart';
//import 'package:applicationpef/auth/ForgotPass.dart';
//import 'package:applicationpef/auth/home.dart';
//import 'package:applicationpef/auth/home.dart';
//import 'package:applicationpef/mainscreen.dart';
//import 'package:applicationpef/searchbar.dart';
//import 'package:applicationpef/mainscreen.dart';
//import 'package:applicationpef/widgets/searchbar.dart';
//import 'package:applicationpef/auth/home.dart';
//import 'package:applicationpef/groups.dart';
//import 'package:applicationpef/mainscreen.dart';
//import 'package:applicationpef/EditProfile.dart';
//import 'package:applicationpef/mainscreen.dart';
//import 'package:applicationpef/mainscreen.dart';
//import 'package:applicationpef/profil.dart';
//import 'package:applicationpef/hosting.dart';
//import 'package:applicationpef/groups.dart';
//import 'package:applicationpef/hosting.dart';
//import 'package:applicationpef/auth/starting1.dart';
//import 'package:applicationpef/listchat.dart';
import 'package:applicationpef/pages/firstpages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Pages()
    );
  }
}

