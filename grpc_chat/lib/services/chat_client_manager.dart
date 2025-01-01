import 'package:grpc/grpc.dart';
import '../protos/chat.pbgrpc.dart';

class ChatClientManager {
  final ChatClient client;

  ChatClientManager()
      : client = ChatClient(
          ClientChannel(
            'localhost', // Adjust for your setup
            port: 7173,
            options: const ChannelOptions(
              credentials:
                  ChannelCredentials.secure(), // Use secure credentials
            ),
          ),
        );

  // Function to send a message
  Future<void> sendMessage(String message) async {
    try {
      final chatMessage = ChatMessage()
        ..message = message; // Set the 'message' field
      final response =
          await client.sendMessage(chatMessage); // Call the SendMessage RPC
      print(
          'Server response: ${response.ok ? "Message sent successfully" : "Message failed"}');
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  // Function to join a chat and listen to messages
  Stream<ChatMessage> enterChat(String name) async* {
    try {
      final request = EnterRequest()..name = name; // Set the 'name' field
      final responseStream =
          client.enterChat(request); // Call the EnterChat RPC
      await for (final message in responseStream) {
        yield message; // Emit each received message
      }
    } catch (e) {
      print('Error entering chat: $e');
      rethrow;
    }
  }
}
