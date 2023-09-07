import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:healthcare_management_system/screens/auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    const splashDuration =
        Duration(seconds: 3); // Adjust the duration as needed

    Timer(splashDuration, () {
      SchedulerBinding.instance.addPostFrameCallback((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return const LoginPage(); // Navigate to the login screen
            },
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
          209, 228, 230, 1), // You can set your own background color
      body: Center(
        child: Image.asset(
          'Assets/animated_logo.gif', // Your animated GIF asset path
          fit: BoxFit.cover, // Adjust the BoxFit as needed
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }
}


// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with TickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToLogin(); // Navigate to the login screen
//   }

//   Future<void> _navigateToLogin() async {
//     await Future.delayed(
//         Duration(seconds: 30)); // Adjust the duration as needed
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//         builder: (BuildContext context) {
//           return const LoginPage(); // Navigate to the login screen
//         },
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // You can set your own background color
//       body: Center(
//         child: GifImage(
//           controller:
//               FlutterGifController(vsync: this), // Use FlutterGifController
//           fit: BoxFit.fill, // Adjust the BoxFit as needed
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           image: const AssetImage(
//               'assets/animated_logo.gif'), // Your animated GIF asset
//         ),
//       ),
//     );
//   }
// }
