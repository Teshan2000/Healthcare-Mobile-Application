import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:healthcare_management_system/providers/dioProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/customAppbar.dart';
import '../components/doctorCard.dart';
import '../utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  
  List<Map<String, dynamic>> medCat = [
    {
      "icon": FontAwesomeIcons.thermometer,
      "category": "  Fever  ",
    },
    {
      "icon": FontAwesomeIcons.tooth,
      "category": "  Dental  ",
    },
    {
      "icon": FontAwesomeIcons.solidEye,
      "category": "Eye Care",
    },
    {
      "icon": FontAwesomeIcons.headSideVirus,
      "category": "  Stress  ",
    },
    {
      "icon": FontAwesomeIcons.heartPulse,
      "category": "Cardiology",
    },
    {
      "icon": FontAwesomeIcons.handDots,
      "category": "Dermatology",
    },
    {
      "icon": FontAwesomeIcons.lungs,
      "category": "Respirations",
    },
    {
      "icon": FontAwesomeIcons.disease,
      "category": "Cholesterol",
    },
    {
      "icon": FontAwesomeIcons.fireFlameSimple,
      "category": "Diabetics",
    },
    {
      "icon": FontAwesomeIcons.virus,
      "category": "Virus",
    },
  ];

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    if (token.isNotEmpty && token != '') {
      final response = await DioProvider().getUser(token);
      if (response != null) {
        setState(() {
          user = json.decode(response);
          print(user);
        });
      }
    }
  }

  @override
  void initState() {    
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Welcome User!",
        icon: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              //icon: FaIcon(
              //isFav ? Icons.favourite_rounded : Icons.favourite_outline,
              //isFav ? Icons.favorite : Icons.favorite_border_outlined,
              Icons.favorite_border_outlined,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: user.isEmpty 
        ? const Center(
            child: CircularProgressIndicator(),
          )
      : Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage("Assets/profile1.jpg"),
                      ),
                    ),
                    Text( 
                      "Amanda",
                      //user['name'],
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "22 Years Old",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Config.spaceMedium,
                Text(
                  "Choose Your Symptoms",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Config.spaceSmall,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 180,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                    List<Widget>.generate(medCat.length, (index) {
                      return Card(
                        elevation: 5,
                        color: Colors.white,
                        child: Column(
                          children: [
                            Flexible(
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      medCat[index]['icon'],
                                      color: Config.primaryColor,
                                    ),
                                    Config.spaceSmall,
                                    Text(
                                      medCat[index]['category'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                Config.spaceMedium,
                Text(
                  "Choose Your Doctor",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: List.generate(5, (index) {
                    return const DoctorCard();
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
