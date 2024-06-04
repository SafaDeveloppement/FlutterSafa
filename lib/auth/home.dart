import 'package:applicationpef/listchat.dart';
import 'package:flutter/material.dart';
import 'package:applicationpef/widgets/post.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String _username;
  @override
  void initState() {
    super.initState();
    _loadUsername();
  }
  Future<void> _loadUsername() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  setState(() {
    _username = prefs.getString('username') ?? '';
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
             "Hello, $_username",
              style: TextStyle(
              color: Colors.black,
              fontSize: 27,
              fontFamily: 'AutofillHints',
                  ),
                  ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.flight, // Placeholder flight icon
                      color: Color.fromARGB(255, 201, 197, 231), // Customize the color as needed
                      size: 30, // Adjust the size of the icon
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    Container(
                      child: const Icon(Icons.notification_add_rounded),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Listchat()),
                    );       
              
              // Gérer l'action du bouton de recherche ici
            },
          ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                      border: OutlineInputBorder(
        
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      hintText: "Search",
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 30.0,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),

                Post(
                  profil: "assets/images/6.jpg",
                  name:"Maria",
                  date:"12 July 2023",
                  title: "Enjoy adventure and make friends !",
                  asset: "assets/images/5.jpg",
                  onTap: () {
                  },
                  onFav: () {
                  },
                place: "china",  
                ),
        
                const SizedBox(height: 30,),
                Post(
                  profil: "assets/images/6.jpg",
                  name:"Maria",
                  date:"12 July 2023",
                  title: "Enjoy adventure and make friends !",
                  asset: "assets/images/5.jpg",
                  onTap: () {
                    // Handle onTap for the Post widget
                  },
                  onFav: () {
                    // Handle onFav for the Post widget
                  },
                place: "china",  
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
