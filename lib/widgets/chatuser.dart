import 'package:flutter/material.dart';

class chatUser extends StatefulWidget {
  const chatUser({super.key});

  @override
  State<chatUser> createState() => _chatUserState();
}

class _chatUserState extends State<chatUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
          Container(
            padding:const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/images/chat1.jpg"),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20),
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Safa'),
                      Text('12:30pm'),
                    ],
                  
                  
                  ),
            
                ),
              ],
            ),
          ),
          Container(child: const Text("hi how are youu sdfghjklsdfghjkldfgn,;dfghjkfgtftfghftyfygtyugtyugvhguuibghgvggtrftyuiokl,njhgfdsxcvbn,; nbvcxdrtyuhjn,bvgvhfrygfyh'grhfdgrhjrbyhurvgihovgjkh", style:TextStyle( fontSize: 13,color:Colors.black45),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          )
          
          ,),
        ],
        ),
      ),
    );
  }
}
