import 'package:applicationpef/add.dart';
import 'package:applicationpef/auth/home.dart';
import 'package:applicationpef/groups.dart';
import 'package:applicationpef/hosting.dart';
import 'package:applicationpef/profil.dart';
import 'package:flutter/material.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  State<mainscreen> createState() => _mainscreenpageState();
}

class _mainscreenpageState extends State<mainscreen> {
  final List<Widget> _screens = [
    const Home(), 
    const hosting(),
    const add(),
    const groups(),
    const profil(),
    
    
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        showSelectedLabels: true,
         backgroundColor: Color(0xFFF5F5F5),
         unselectedItemColor: Colors.black,
         selectedItemColor: Color.fromARGB(255, 43, 42, 42),
         type: BottomNavigationBarType.shifting,
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: "Home", backgroundColor: Color.fromARGB(255, 232, 228, 228) //background color forsineh 
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bed, color: Colors.black),
            label: "Host",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: Colors.black, size: 40),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group, color: Colors.black),
            label: "Group",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: "Profile",
          ),
        ],
        
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: SafeArea(child: _screens[_selectedIndex]),
    );
  }
}
