import 'package:flutter/material.dart';
import '../services/chat_client_manager.dart'; // Import the gRPC client wrapper

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<String> _messages = []; // List to store chat messages
  final TextEditingController _messageController = TextEditingController();
  final ChatClientManager _chatService = ChatClientManager(); // gRPC client

  @override
  void initState() {
    super.initState();
    // Start listening for incoming messages
    _listenToMessages();
  }

  // Function to listen for incoming messages
  void _listenToMessages() {
    _chatService.enterChat("User").listen((chatMessage) {
      setState(() {
        _messages.add("Server: ${chatMessage.message}");
      });
    }).onError((error) {
      print("Error receiving messages: $error");
    });
  }

  // Function to send a message
  void _sendMessage() {
    final message = _messageController.text.trim();
    if (message.isEmpty) return;

    setState(() {
      _messages.add("Me: $message"); // Add the message locally
    });

    _chatService.sendMessage(message).then((_) {
      print("Message sent successfully.");
    }).catchError((error) {
      print("Error sending message: $error");
    });

    _messageController.clear(); // Clear the input field
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display chat messages
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _messages[index],
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          // Input area for sending messages
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      labelText: 'Enter your message',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: const Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose(); // Dispose the controller
    super.dispose();
  }
}
