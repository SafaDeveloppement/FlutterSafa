
import 'package:flutter/material.dart';

class Listchat extends StatelessWidget {
  const Listchat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title:Text("chat"), backgroundColor: Color(0xFFF5F5F5),
     leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
     
     actions: [IconButton(onPressed:(){}, icon: Icon(Icons.search_sharp))],
     
     
     ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: <Widget>[
                  Container( 
                    padding: EdgeInsets.all(2),
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      //shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                        )
                      ]
                    ),
                    child: const CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/chat1.jpg"),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding:EdgeInsets.only(left: 20,),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Menyar Lahwaya",style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),),
                            Text("12:30pm", style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w300,
                              color: Colors.black54,
                            ),),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text('hello how are you hello how are you hello how are you hello how are you hello how are you', style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        ) ,),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(child: Text('data') ,),
            Container(child: Text('data') ,),
            Container(child: Text('data') ,),

          ],
        )
        
    );
  }
}