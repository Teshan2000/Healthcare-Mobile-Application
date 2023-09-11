import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:healthcare_management_system/utils/config.dart';

class ChatInputField extends StatefulWidget {
  final Function(String, FileType?) onSendMessage;

  const ChatInputField({
    Key? key, 
    required this.onSendMessage,
  }) : super(key: key);

  @override
  _ChatInputFieldState createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  final TextEditingController _messageController = TextEditingController();
  FileType? _fileType;

  Future<void> _openFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4', 'pdf', 'doc'],
    );

    if (result != null) {
      PlatformFile file = result.files.first;
      setState(() {
        _fileType = file.extension == 'pdf' ? FileType.custom : null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Config.defaultPadding,
        vertical: Config.defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 32,
            color: const Color(0xFF087949).withOpacity(0.08),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.attach_file),
              onPressed: _openFilePicker,
            ),
            const SizedBox(width: Config.defaultPadding),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Config.defaultPadding * 0.75,
                ),
                decoration: BoxDecoration(
                  color: Config.primaryColor.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: Config.defaultPadding / 4),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          hintText: "Type message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.send,
                color: Config.primaryColor,
              ),
              onPressed: () {
                String message = _messageController.text.trim();
                widget.onSendMessage(message, _fileType);
                _messageController.clear();
                setState(() {
                 _fileType = null;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}
