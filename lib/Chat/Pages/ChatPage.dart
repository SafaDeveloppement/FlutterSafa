import 'package:flutter/material.dart';
import 'package:applicationpef/models/chatModel.dart';
import 'package:applicationpef/chatCustomUI/CustomCard.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required List<ChatModel> chatModels});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> Chats = [
    ChatModel(
      name: "David",
      isGroup: false,
      currentMessage: "Hi David",
      time: "4:00",
      icon:"person.svg", status: '',
    ),
    ChatModel(
      name: "john",
      isGroup: false,
      currentMessage: "Hi john",
      time: "10:00",
      icon:"person.svg", status: '',
    ),
    ChatModel(
      name: "Globe Trotters",
      isGroup: true,
      currentMessage: "Hi Evryone in this group",
      time: "12:00",
      icon:"groups.svg", status: '',
    ),
    ChatModel(
      name: "Sana",
      isGroup: false,
      currentMessage: "Hi Sana",
      time: "2:00",
      icon:"person.svg", status: '',
    ),
    ChatModel(
      name: "Friends",
      isGroup: true,
      currentMessage: "Hi Buddy",
      time: "20:00",
      icon:"groups.svg", status: '',
    ), 
  ];
  @override
  Widget build(BuildContext ccustontext) {
    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.chat),
        ),
        body: ListView.builder(
          itemCount: Chats.length,
          itemBuilder: (context, index) => CustomCard(
            chatModel: Chats[index],
          )
        ),
    );
  }
}