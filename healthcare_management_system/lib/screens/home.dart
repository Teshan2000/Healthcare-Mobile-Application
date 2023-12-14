import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/appDrawer.dart';
import 'package:healthcare_management_system/providers/dioProvider.dart';
import 'package:healthcare_management_system/screens/appointments.dart';
import 'package:healthcare_management_system/screens/messages.dart';
import 'package:healthcare_management_system/screens/settings.dart';
import 'package:healthcare_management_system/screens/symptomsPage.dart';
import 'package:healthcare_management_system/screens/userDetails.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/customAppbar.dart';
import '../components/doctorCard.dart';
import '../utils/config.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  int _currentPage = 0;
  List<String> bannerImages = [
    'Assets/banner/1.jpg',
    'Assets/banner/2.jpg',
    'Assets/banner/3.jpg',
  ];

  Map<String, dynamic> user = {};
  Map<String, dynamic> doctor = {};
  
  List<Map<String, dynamic>> medCat = [
    {
      "imageAsset": 'Assets/symptoms/fever.png',
      "category": "  Fever  ",
    },
    {
      "imageAsset": 'Assets/symptoms/dental.png',
      "category": "  Dental  ",
    },
    {
      "imageAsset": 'Assets/symptoms/eyecare.png',
      "category": "Eye Care",
    },
    {
      "imageAsset": 'Assets/symptoms/stress.png',
      "category": "  Stress  ",
    },
    {
      "imageAsset": 'Assets/symptoms/cardiology.png',
      "category": "Cardiology",
    },
    {
      "imageAsset": 'Assets/symptoms/dermatology.png',
      "category": "Dermatology",
    },
    {
      "imageAsset": 'Assets/symptoms/respirations.png',
      "category": "Respirations",
    },
    {
      "imageAsset": 'Assets/symptoms/cholesterol.png',
      "category": "Cholesterol",
    },
    {
      "imageAsset": 'Assets/symptoms/diabetes.png',
      "category": "Diabetes",
    },
    {
      "imageAsset": 'Assets/symptoms/virus.png',
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
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () async {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.blue,
            ),
          )
        ],
      ),
      drawer: AppDrawer(
        userName: "Uma Priyani",
        //user['name'],
        profilePictureUrl: 'Assets/profile1.jpg',
        onProfilePressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserDetails(),
            ),
          );
        },
        onAppointmentPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Appointments(doctor: {},),
            ),
          );
        },
        onSymptomsPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SymptomsPage(),
            ),
          );
        },
        onNotificationsPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Messages(),
            ),
          );
        },
        onSettingsPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Settings(),
            ),
          );
        },
        onLogoutPressed: () {},
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
                Container(
                  height: 150,
                  child: PageView.builder(
                    itemCount: bannerImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    bannerImages.length,
                    (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.blue
                              : Colors.grey.withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
                Config.spaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose Your Symptoms",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SymptomsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SymptomsPage(),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        medCat[index]['imageAsset'],
                                        width: 80,
                                        height: 80,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        medCat[index]['category'],
                                        style: TextStyle(
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
                  children: List.generate(user['doctor'].length, (index) {
                    return DoctorCard(
                      route: 'doctor', 
                      doctor: user['doctor'][index],
                    ); 
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
