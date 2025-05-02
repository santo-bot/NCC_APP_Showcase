import 'package:flutter/material.dart';
import 'package:nccapp/CustomShapes/CatagoryContainer.dart';
import 'package:nccapp/CustomShapes/homehlwcon.dart';

import 'ProfilePAge.dart' show ProfilePage;

class HomePage extends StatefulWidget {
  final String username;  // Declare username
  const HomePage({Key? key, required this.username}) : super(key: key);  // Pass username to the constructor

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String _searchQuery = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Handle navigation based on index
    switch (index) {
      case 0:
        break;  // Home
      case 1:
      // Pass username to ProfilePage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(username: widget.username),
          ),
        );
        break;
      case 2:
        Navigator.pushNamed(context, '/settings'); // Example: go to settings
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              HomeCont(
                username: widget.username,
                searchQuery: _searchQuery,
                onSearchChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CatContainer(img: 'assets/images/study.png', onpressed: () {
                    Navigator.pushNamed(context, '/study_resources');
                  }, title: 'Study Resources',),
                  CatContainer(img: "assets/images/navigation.png", onpressed: () {
                    Navigator.pushNamed(context, '/campus_navigation');
                  }, title: 'Navigation',),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CatContainer(img: 'assets/images/events.png', onpressed: () {
                    Navigator.pushNamed(context, '/events');
                  }, title: 'Events',),
                  CatContainer(img: "assets/images/food.png", onpressed: () {
                    Navigator.pushNamed(context, '/cafeteria');
                  }, title: 'Cafeteria',),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CatContainer(img: 'assets/images/lostfound.png', onpressed: () {
                    Navigator.pushNamed(context, '/lost_and_found');
                  }, title: 'Lost and Found',),
                  const SizedBox(width: 160), // Placeholder to align single item
                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
