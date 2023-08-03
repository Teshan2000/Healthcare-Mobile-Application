import 'package:flutter/material.dart';
import 'package:healthcare_management_system/screens/doctorDetails.dart';
import 'package:healthcare_management_system/screens/home.dart';
import 'package:healthcare_management_system/screens/schedule.dart';
import 'package:healthcare_management_system/screens/symptoms.dart';
import 'package:healthcare_management_system/utils/config.dart';
import 'package:healthcare_management_system/utils/layout.dart';
import 'package:healthcare_management_system/screens/appointments.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare App - Flutter',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),

        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Config.primaryColor,
          selectedItemColor: Colors.white,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey.shade700,
          elevation: 10,
          type: BottomNavigationBarType.fixed,
        ),
        primarySwatch: Colors.blue,
      ),

      initialRoute: '/',
      routes: {
        "/": (context) => const Layout(),
        "main": (context) => const Home(),
        'symptoms': (context) => const Symptoms(),
        //'doctor': (context) => const DoctorDetails(),
        'appointment': (context) => const Schedule(),
        "appointment_page": (context) => const Appointments(),
      },
      //home: const MyHomePage(title: 'Home Page'),
    );
  }
}
