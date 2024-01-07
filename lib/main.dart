import 'package:banget/pages/Chatbot.dart';
import 'package:banget/pages/Homepage.dart';
import 'package:banget/pages/VisiOn.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';



void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  List<Widget> _pages = [];

  @override
  void initState() {
    _pages = [HomePage(),  Vision(), Chatbot() ];
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        height: 70,
        color: Color(0xFF4C53A5),
        items: [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.camera_alt,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.chat_bubble,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
