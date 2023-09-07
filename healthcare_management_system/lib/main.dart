import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/screens/appointments.dart';
import 'package:healthcare_management_system/screens/auth/login_page.dart';
import 'package:healthcare_management_system/layout.dart';
import 'package:healthcare_management_system/screens/auth/register_page.dart';
import 'package:healthcare_management_system/screens/home.dart';
import 'package:healthcare_management_system/screens/schedule.dart';
import 'package:healthcare_management_system/screens/splash_screen.dart';
import 'package:healthcare_management_system/screens/symptoms.dart';
import 'package:healthcare_management_system/utils/config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medi Care',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // theme settings
        inputDecorationTheme: const InputDecorationTheme(
          focusColor: Config.primaryColor,
          border: Config.outlinedBorder,
          focusedBorder: Config.focusBorder,
          errorBorder: Config.errorBorder,
          enabledBorder: Config.outlinedBorder,
          floatingLabelStyle: TextStyle(color: Config.primaryColor),
          prefixIconColor: Colors.black38,
        ),
        scaffoldBackgroundColor: Color.fromRGBO(209, 228, 230, 1),
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
        "/": (context) => SplashScreen(),
        "login": (context) => const LoginPage(),
        "regidter": (context) => const RegisterPage(),
        "main": (context) => const Layout(),
        "Home": (context) => const Home(),
        'symptoms': (context) => const Symptoms(),
        //'doctor': (context) => const DoctorDetails(),
        'appointment': (context) => const Schedule(),
        "appointment_page": (context) => const Appointments(),
      },
    );
  }
}




// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:healthcare_management_system/screens/auth/login_page.dart';
// import 'package:healthcare_management_system/screens/doctorDetails.dart';
// import 'package:healthcare_management_system/screens/home.dart';
// import 'package:healthcare_management_system/screens/schedule.dart';
// import 'package:healthcare_management_system/screens/symptoms.dart';
// import 'package:healthcare_management_system/shared/constants.dart';
// import 'package:healthcare_management_system/utils/config.dart';
// import 'package:healthcare_management_system/layout.dart';
// import 'package:healthcare_management_system/screens/appointments.dart';

// Future<void> main() async {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   static final navigatorKey = GlobalKey<NavigatorState>();

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Healthcare App - Flutter',
//       navigatorKey: navigatorKey,
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         inputDecorationTheme: const InputDecorationTheme(
//           focusColor: Config.primaryColor,
//           border: Config.outlinedBorder,
//           focusedBorder: Config.focusBorder,
//           errorBorder: Config.errorBorder,
//           enabledBorder: Config.outlinedBorder,
//           floatingLabelStyle: TextStyle(color: Config.primaryColor),
//           prefixIconColor: Colors.black38,
//         ),
//         scaffoldBackgroundColor: Colors.white,
//         bottomNavigationBarTheme: BottomNavigationBarThemeData(
//           backgroundColor: Config.primaryColor,
//           selectedItemColor: Colors.white,
//           showSelectedLabels: true,
//           showUnselectedLabels: false,
//           unselectedItemColor: Colors.grey.shade700,
//           elevation: 10,
//           type: BottomNavigationBarType.fixed,
//         ),
//         primarySwatch: Colors.blue,
//       ),

      // initialRoute: '/',
      // routes: {
      //   "/": (context) => const Layout(),
      //   "main": (context) => const Home(),
      //   'symptoms': (context) => const Symptoms(),
      //   //'doctor': (context) => const DoctorDetails(),
      //   'appointment': (context) => const Schedule(),
      //   "appointment_page": (context) => const Appointments(),
      // },
//       //home: const MyHomePage(title: 'Home Page'),
//     );
//   }
// }
