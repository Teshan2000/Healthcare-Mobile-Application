import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return const Scaffold(
      body: Center(
=======
    const center = Center(
>>>>>>> Stashed changes
        child: Text("Payment Page"),
      );
    return const Scaffold(
      body: center,
    );
  }
}
