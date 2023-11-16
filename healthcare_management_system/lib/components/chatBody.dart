import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/chatinputField.dart';
import 'package:file_picker/file_picker.dart';
import 'package:healthcare_management_system/utils/config.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Message> messages = []; 

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
            final receivedMessage = Message(
              text: message,
              fileType: fileType,
              isSender: true, 
            );

            setState(() {
              messages.add(receivedMessage);
            });
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
            ? Alignment.centerRight 
            : Alignment.centerLeft, 
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Config.primaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            crossAxisAlignment: message.isSender
                ? CrossAxisAlignment.end 
                : CrossAxisAlignment.start, 
            children: [
              Text(message.text),
              if (message.fileType != null) 
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Attached ${message.fileType} file',
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.blue,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String text;
  final FileType? fileType;
  final bool isSender; 

  Message({
    required this.text,
    this.fileType,
    this.isSender = false, 
  });
}
