import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Chatbot extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<Chatbot> {
  TextEditingController _messageController = TextEditingController();
  List<Map<String, String?>> chatHistory = [];

  _sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('http://4.145.90.55:8000/chatbot'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'message': message}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String botResponse = data['response'];
      setState(() {
        chatHistory.add({'role': 'user', 'message': message});
        chatHistory.add({'role': 'bot', 'message': botResponse});
      });
    } else {
      print('Failed to fetch data. Error: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatHistory.length,
              itemBuilder: (context, index) {
                Map<String, String?> chat = chatHistory[index];
                return ListTile(
                  title: Align(
                    alignment: chat['role'] == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color:
                            chat['role'] == 'user' ? Colors.blue : Colors.green,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (chat['role'] == 'user') Icon(Icons.person),
                          SizedBox(width: 8),
                          Expanded(
                            child: Wrap(
                              // Menggunakan Wrap untuk menyesuaikan teks pesan sebaik mungkin
                              children: [
                                Text(
                                  chat['message'] ?? '',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                if (chat['role'] == 'bot') SizedBox(width: 8),
                                if (chat['role'] == 'bot') Icon(Icons.android),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan Anda...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = _messageController.text.trim();
                    if (message.isNotEmpty) {
                      _sendMessage(message);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}