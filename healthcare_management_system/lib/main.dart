import 'package:flutter/material.dart';
import 'package:healthcare_management_system/models/authModel.dart';
import 'package:healthcare_management_system/screens/auth.dart';
import 'package:healthcare_management_system/screens/doctorDetails.dart';
import 'package:healthcare_management_system/screens/home.dart';
import 'package:healthcare_management_system/screens/login_page.dart';
import 'package:healthcare_management_system/screens/payment.dart';
import 'package:healthcare_management_system/screens/schedule.dart';
import 'package:healthcare_management_system/screens/settings.dart';
import 'package:healthcare_management_system/screens/success.dart';
import 'package:healthcare_management_system/screens/symptoms.dart';
import 'package:healthcare_management_system/utils/config.dart';
import 'package:healthcare_management_system/layout.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthModel>(
      create: (context) => AuthModel(),
      child: MaterialApp(
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
          '/': (context) => LoginPage(),
          'login': (context) => const Home(),
          'login': (context) => const Layout(),
          'symptoms': (context) => Symptoms(),
          'doctor': (context) => const DoctorDetails(),
          'schedule': (context) => const Schedule(),
          'payment': (context) => const Payment(),
          'success': (context) => const Success(),
          'settings': (context) => Settings(),
        },
      ),
    );
  }
}
