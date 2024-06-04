import 'package:flutter/material.dart';
import 'package:applicationpef/chatCustomUI/ButtonCard.dart';
import 'package:applicationpef/models/chatModel.dart';
import 'package:applicationpef/Chat/homeScreen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late ChatModel sourceChat;
  List<ChatModel> chatModels = [
    ChatModel(
      name: "Dev Stack",
      isGroup: false,
      currentMessage: "Hi Everyone",
      time: "4:00",
      icon: "person.svg",
      id: 1,
    ),
    ChatModel(
      name: "Kishor",
      isGroup: false,
      currentMessage: "Hi Kishor",
      time: "13:00",
      icon: "person.svg",
      id: 2,
    ),
    ChatModel(
      name: "Collins",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "8:00",
      icon: "person.svg",
      id: 3,
    ),
    ChatModel(
      name: "Balram Rathore",
      isGroup: false,
      currentMessage: "Hi Dev Stack",
      time: "2:00",
      icon: "person.svg",
      id: 4,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: chatModels.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            sourceChat = chatModels[
                index]; // Utilisez chatModels[index] pour obtenir l'élément sélectionné
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (builder) => HomeScreen(
                  chatModels: List.from(chatModels), // Utilisez une copie de la liste pour éviter de modifier l'original
                  sourceChat: sourceChat,
                ),
              ),
            );
          },
          child: ButtonCard(
            key: UniqueKey(),
            name: chatModels[index].name ?? 'Default Name',
            icon: Icons.person,
          ),
        ),
      ),
    );
  }
}
