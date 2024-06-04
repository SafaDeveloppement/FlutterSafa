import 'package:applicationpef/chatCustomUI/AvatarCard.dart';
//import 'package:applicationpef/chatCustomUI/ButtonCard.dart';
import 'package:applicationpef/chatCustomUI/ContactCard.dart';
import 'package:applicationpef/models/chatModel.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget {
  CreateGroup({Key? key}) : super(key: key);

  @override
  _CreateGroupState createState() => _CreateGroupState();
}



class _CreateGroupState extends State<CreateGroup> {
  List<ChatModel> contacts = [
    ChatModel(name: "Dev Stack", ),  //status: "A full stack developer"
    ChatModel(name: "Balram"), //, status: "Flutter Developer..........."
    ChatModel(name: "Saket"),  //, status: "Web developer..."
    ChatModel(name: "Bhanu Dev", ), //status: "App developer...."
    ChatModel(name: "Collins", ), //status: "React developer.."
    ChatModel(name: "Kishor", ), //status: "Full Stack Web"
    ChatModel(name: "Testing1", ), //status: "Example work"
    ChatModel(name: "Testing2", ), //status: "Sharing is caring"
    ChatModel(name: "Divyanshu", ), //status: "....."
    ChatModel(name: "Helper", ), //status: "Love you Mom Dad"
    ChatModel(name: "Tester", ), //status: "I find the bugs"
  ];

  List<ChatModel> groupMember = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "New Group",
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Add participants",
              style: TextStyle(
                fontSize: 13,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              size: 26,
            ),
            onPressed: () {},
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF128C7E),
        onPressed: () {},
        child: Icon(Icons.arrow_forward),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: contacts.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  height: groupMember.isNotEmpty ? 90 : 10,
                );
              }
              return InkWell(
                onTap: () {
                  setState(() {
                    if (contacts[index - 1].isSelected) {
                      groupMember.remove(contacts[index - 1]);
                      contacts[index - 1].isSelected = false;
                    } else {
                      groupMember.add(contacts[index - 1]);
                      contacts[index - 1].isSelected = true;
                    }
                  });
                },
                child: ContactCard(
                  contact: contacts[index - 1],
                ),
              );
            },
          ),
          if (groupMember.isNotEmpty)
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Container(
                    height: 75,
                    color: Colors.white,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: groupMember.length,
                      itemBuilder: (context, index) {
                        if (groupMember[index].isSelected) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                groupMember.remove(groupMember[index]);
                                contacts.firstWhere(
                                  (element) =>
                                      element.name == groupMember[index].name,
                                ).isSelected = false;
                              });
                            },
                            child: AvatarCard(
                              chatModel: groupMember[index],
                            ),
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

