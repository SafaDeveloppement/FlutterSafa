
//import 'package:applicationpef/edits.dart';
//import 'package:applicationpef/groupChat.dart';
//import 'package:applicationpef/auth/signup.dart';
//import 'package:applicationpef/pages/firstpages.dart';
//import 'package:applicationpef/groups.dart';
//import 'package:applicationpef/country.dart';
//import 'package:applicationpef/try.dart';
//import 'package:applicationpef/Chat/homeScreen.dart';
//import 'package:applicationpef/country.dart';
//import 'package:applicationpef/pages/firstpages.dart';
//import 'package:applicationpef/groupChat.dart';
//import 'package:applicationpef/pages/firstpages.dart';
import 'package:applicationpef/Chat/homeScreen.dart';
import 'package:flutter/material.dart';

import 'Chat/Pages/ChatPage.dart';


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
    return  Scaffold(
      body: HomeScreen()
    );
  }
}

