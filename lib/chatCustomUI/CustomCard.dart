import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:applicationpef/models/chatModel.dart';
import 'package:applicationpef/Chat/Screens/IndividualPage.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, required this.chatModel}) : super(key: key);

  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => IndividualPage(
              chatModel: chatModel,
            ),
          ),
        );
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatModel.isGroup == true ? "assets/icons/groups.svg" : "assets/icons/person.svg",
                color: Colors.white,
                height: 36,
                width: 36,
              ),
            ),
            title: Text(
              chatModel.name ?? '', // Utilisez ?? pour fournir une valeur par défaut
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [
                Icon(Icons.done_all),
                SizedBox(width: 3),
                Text(
                  chatModel.currentMessage ?? '', // Utilisez ?? pour fournir une valeur par défaut
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            trailing: Text(chatModel.time ?? ''), // Utilisez ?? pour fournir une valeur par défaut
          ),
          Padding(
            padding: EdgeInsets.only(left: 80, right: 20),
            child: Divider(
              thickness: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
