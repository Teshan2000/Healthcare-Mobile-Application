// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:healthcare_management_system/screens/auth.dart';


// class SplashScreen extends StatefulWidget {
//   @override
//   SplashScreenState createState() => SplashScreenState();
// }

// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _startSplashTimer();
//   }

//   void _startSplashTimer() {
//     const splashDuration =
//         Duration(seconds: 3); // Adjust the duration as needed

//     Timer(splashDuration, () {
//       SchedulerBinding.instance.addPostFrameCallback((_) {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (BuildContext context) {
//               return const AuthPage(); // Navigate to the login screen
//             },
//           ),
//         );
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(
//           209, 228, 230, 1), // You can set your own background color
//       body: Center(
//         child: Image.asset(
//           'Assets/animated_logo.gif', // Your animated GIF asset path
//           fit: BoxFit.cover, // Adjust the BoxFit as needed
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//         ),
//       ),
//     );
//   }
// }

