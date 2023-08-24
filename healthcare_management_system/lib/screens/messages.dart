// import 'package:basic/screens/symptoms.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import '../utils/config.dart';
// import '../utils/config.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      width: 180,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Icon(
                        Icons.heart_broken,
                        color: Config.primaryColor,
                        size: 36,
                      ),
                      Config.spaceSmall,
                      Text(
                        "Dental",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        /*onTap: () {
          MyApp.navigatorKey.currentState!.push(MaterialPageRoute(
              builder: (_) => const Symptoms()));
        }, */
      ),
    );
  }
}
