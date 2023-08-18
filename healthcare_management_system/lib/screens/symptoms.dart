import 'package:flutter/material.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return const Scaffold(
=======
    // ignore: prefer_const_constructors
    return Scaffold(
      // ignore: prefer_const_constructors
>>>>>>> Stashed changes
      body: Center(
        // ignore: prefer_const_constructors
        child: Text("Symptoms Page"),
      ),
    );
  }
}
