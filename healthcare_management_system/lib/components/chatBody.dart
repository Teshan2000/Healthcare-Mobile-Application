import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/chatinputField.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:healthcare_management_system/utils/config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Message> messages = []; // Store messages here

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final message = messages[index];
              return MessageWidget(message: message);
            },
          ),
        ),
        ChatInputField(
          onSendMessage: (message, fileType) {
            // Simulate receiving a message for demonstration purposes
            // In your real implementation, this would be sent to your Laravel backend
            final receivedMessage = Message(
              text: message,
              //fileType: fileType,
              isSender: true, // Set to true for sent messages
            );

            setState(() {
              messages.add(receivedMessage);
            });

            // Save the message to the Laravel database here
            // You can send an HTTP request to your Laravel API to save the message
            // Example: saveMessageToDatabase(message, fileType);
          },
        ),
      ],
    );
  }
}

class MessageWidget extends StatelessWidget {
  final Message message;

  const MessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Align(
        alignment: message.isSender
            ? Alignment.centerRight // Sent messages on the right
            : Alignment.centerLeft, // Received messages on the left
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Config.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: message.isSender
                ? CrossAxisAlignment.end // Align sent messages to the right
                : CrossAxisAlignment.start, // Align received messages to the left
            // children: [
            //   Text(message.text),
            //   if (message.fileType != null) // Check if there's a file attached
            //     Padding(
            //       padding: const EdgeInsets.only(top: 8.0),
            //       child: Text(
            //         'Attached ${message.fileType} file',
            //         style: const TextStyle(
            //           fontStyle: FontStyle.italic,
            //           color: Colors.blue,
            //         ),
            //       ),
            //     ),
            // ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  //final FileType? fileType;
  final bool isSender; // Indicates whether the message is sent or received

  Message({
    required this.text,
    //this.fileType,
    this.isSender = false, // Default to received message
  });
}
