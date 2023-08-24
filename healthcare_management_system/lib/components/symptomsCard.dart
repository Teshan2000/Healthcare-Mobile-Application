import 'package:flutter/material.dart';

class SymptomsCard extends StatelessWidget {
  const SymptomsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.blue, // Fixed the syntax for specifying color
              borderRadius: BorderRadius.circular(20), // Fixed the syntax for specifying borderRadius
            ),
          ),
        ],
      ),
    );
  }
}
