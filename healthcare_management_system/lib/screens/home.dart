import 'package:flutter/material.dart';
import '../utils/config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return const Scaffold(
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
