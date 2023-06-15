import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Put Your Topic Here'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
      ),
      body: Center(),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.blue,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home, color: Colors.white), label: "Home"),
          NavigationDestination(icon: Icon(Icons.message, color: Colors.blueGrey), label: "Messages"),
          NavigationDestination(icon: Icon(Icons.calendar_month, color: Colors.blueGrey), label: "Schedule"),
          NavigationDestination(icon: Icon(Icons.settings, color: Colors.blueGrey), label: "Settings"),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
