import 'package:banget/widgets/VisionAppBar.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          VisionAppBar(),
        ],
      ),
    );
  }
}