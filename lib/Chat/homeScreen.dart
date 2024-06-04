import 'package:flutter/material.dart';
import 'package:applicationpef/Chat/Pages/ChatPage.dart';
import 'package:applicationpef/models/chatModel.dart';

class HomeScreen extends StatefulWidget {
  final List<ChatModel>? chatModels;
  final ChatModel? sourceChat;

  const HomeScreen({
    Key? key,
    this.chatModels,
    this.sourceChat,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 130, 65, 173),
        title: Text("Your Chats !"),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          PopupMenuButton<String>(
            onSelected: (value) {
              print(value);
            },
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text("New group"),
                  value: "New group",
                ),
                const PopupMenuItem(
                  child: Text("New broadcast"),
                  value: "New broadcast",
                ),
                const PopupMenuItem(
                  child: Text("Starred messages"),
                  value: "Starred messages",
                ),
                const PopupMenuItem(
                  child: Text("Settings"),
                  value: "Settings",
                ),
              ];
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white.withOpacity(0.5),
          tabs: const [
            Tab(
              icon: Icon(Icons.camera_alt),
            ),
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "STATUS",
            ),
            Tab(
              text: "CALLS",
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          Text("Camera"),
          ChatPage(chatModels: widget.chatModels ?? []), // Utilisez chatModels avec une valeur par défaut
          Text("Status"),
          Text("Calls"),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      fontFamily: "OpenSans",
      primaryColor: Color(0xFFDF8787),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFDF8787)),
    ),
    home: HomeScreen(),
  ));
}
