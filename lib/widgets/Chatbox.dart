import 'package:flutter/material.dart';

class Chatbox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      for(int i = 1; i < 3; i++)
      Container(
        height: 110,
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.  ',               
               style: TextStyle(color: Color(0xFF4C53A5)),
             ),
      ),
    ],);
  }
}