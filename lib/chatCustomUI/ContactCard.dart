import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:applicationpef/models/chatModel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({Key? key, this.contact}) : super(key: key);

  final ChatModel? contact;

  @override
  Widget build(BuildContext context) {
    if (contact == null) {
      return Container(); // Gérer le cas où le contact est nul
    }

    return ListTile(
      leading: Container(
        width: 50,
        height: 53,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 23,
              child: SvgPicture.asset(
                "assets/icons/groups.svg",
                color: Colors.white,
                height: 30,
                width: 30,
              ),
              backgroundColor: Colors.blueGrey[200],
            ),
            if (contact!.isSelected) // Utilisation du champ isSelected
              Positioned(
                bottom: 4,
                right: 5,
                child: CircleAvatar(
                  backgroundColor: Colors.teal,
                  radius: 11,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
      title: Text(
        contact!.name ??
            '', // Utilisation de ?? pour fournir une valeur par défaut si name est null
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        contact!.status, // Utilisation de ?? pour fournir une valeur par défaut si status est null
        style: TextStyle(
          fontSize: 13,
        ),
      ),
    );
  }
}
