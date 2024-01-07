import 'package:flutter/material.dart';

class Chatcoll extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:20, vertical: 15 ),
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Text input field
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                
                // Send button
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle send button press
                    // Add your logic to send the message
                  },
                ),
              ],
            ),
          ],
        ),
      ),
        );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final String sender;

  ChatMessage(this.text, this.sender);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Text(sender[0]),
          ),
          SizedBox(width: 14.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                sender,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4.0),
              Text(text),
            ],
          ),
        ],
      ),
    );
  }
}