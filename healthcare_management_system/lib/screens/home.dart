//import 'package:basic/models/auth_model.dart';
// import 'package:basic/screens/messages.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/screens/messages.dart';

// import 'package:basic/components/appointmentCard.dart';
// import 'package:basic/utils/config.dart';
// import 'package:basic/components/symptomsCard.dart';
// import 'package:basic/components/doctorCard.dart';

import '../components/symptomsCard.dart';
import '../utils/config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget columns() {
    return Container(
      //color: Colors.blue,
      height: 62.0,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/photo.jpg',
            ),
          ),
          Text(
            'Amanda Weerasiri',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  //list<dynamic> favList = [];
  List<Map<String, dynamic>> medCat = [
    {
      "icon": Icons.savings,
      "category": "Dental",
    },
    {
      "icon": Icons.heart_broken,
      "category": "Cardiology",
    },
    {
      "icon": Icons.back_hand_rounded,
      "category": "Dermatology",
    },
    {
      "icon": Icons.pregnant_woman,
      "category": "Gynecology",
    },
    {
      "icon": Icons.lunch_dining_sharp,
      "category": "Respirations",
    },
  ];

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    //user = Provider.of<AuthModel>(context, listen: false).getUser;
    //doctor = Provider.of<AuthModel>(context, listen: false).getAppointments;
    //favList = Provider.of<AuthModel>(context, listen: false).getFav;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("assets/photo.jpg"),
                      ),
                    ),
                    Text(
                      "Amanda",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Config.spaceSmall,
                    Text(
                      "22 Years Old | Female",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Config.spaceSmall,
                const Center(
                  child: Text(
                    "Hello Amanda!",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Config.spaceSmall,
                const Center(
                  child: Text(
                    "What are your Symptoms?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                        children: [
                          Messages(),
                          Messages(),
                          Messages(),
                          Messages(),
                          Messages(),
                        ]
                    ),
                    Column(
                        children: [
                          Messages(),
                          Messages(),
                          Messages(),
                          Messages(),
                          Messages(),
                        ]
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
