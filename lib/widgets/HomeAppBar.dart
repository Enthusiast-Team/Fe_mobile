import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(56.0); // Tinggi AppBar
  final String title; // Tambahkan parameter untuk judul
  HomeAppBar(this.title); // Konstruktor untuk menerima judul
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 20,
            ),
            child: Text(
               title,
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Spacer(),
          // child: InkWell(
          //   onTap: (){
          //     Navigator.pushNamed(context, "search")
          //   },
          // ),
          // child: 
          // Icon(
          //   Icons.search, // This adds the search icon
          //   size: 30,
          //   color: Color(0xFF4C53A5),
          // ),
        ],
      ),
    );
  }
}
