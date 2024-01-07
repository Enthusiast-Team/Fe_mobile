import 'package:banget/widgets/HomeAppBar.dart';
import 'package:banget/widgets/ChatAppBar.dart';
import 'package:banget/widgets/Chatbox.dart';
import 'package:banget/widgets/Chatcoll.dart';
import 'package:flutter/material.dart';

class Chatbot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar("Chatbot"),
      body: ListView(
        children: [
          // ChatAppBar(),
          Container(
            height: 700,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )),
              child: Column(children: [
                Chatbox(),
              ],),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit?',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
          
//           SizedBox(height: 12.0),

//           // Another chat message
//           Container(
//             padding: EdgeInsets.all(20.0),
//             decoration: BoxDecoration(
//               color: Colors.grey,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             child: Text(
//               'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod temporincididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.  ',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           // Input area
//           Container(
//             alignment: Alignment.bottomCenter,
//             padding: EdgeInsets.all(20.0),
//             child: Row(
//               children: [
//                 // Text input field
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: 'Type your message...',
//                     ),
//                   ),
//                 ),
                
//                 // Send button
//                 IconButton(
//                   icon: Icon(Icons.send),
//                   onPressed: () {
//                     // Handle send button press
//                     // Add your logic to send the message
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   final String text;
//   final String sender;

//   ChatMessage(this.text, this.sender);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.bottomCenter,
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             child: Text(sender[0]),
//           ),
//           SizedBox(width: 14.0),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 sender,
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               SizedBox(height: 4.0),
//               Text(text),
//             ],
//           ),
//         ],
//       ),
            ),
        ],
            ),
            bottomNavigationBar: Chatcoll(),
    );
  }
}
