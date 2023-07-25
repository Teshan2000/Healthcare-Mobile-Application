import 'package:flutter/material.dart';
import '../utils/config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
