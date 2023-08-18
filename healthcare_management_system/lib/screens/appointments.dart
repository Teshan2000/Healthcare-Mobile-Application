import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
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
        child: Text("Appointments Page"),
      ),
    );
  }
}
