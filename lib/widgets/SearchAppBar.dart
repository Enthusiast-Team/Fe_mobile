import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SearchAppBar(),
        ],
      ),
    );
  }
}