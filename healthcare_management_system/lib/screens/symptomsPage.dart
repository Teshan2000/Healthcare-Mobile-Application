import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_management_system/screens/symptoms.dart';
import '../components/customAppbar.dart';
import '../main.dart';
import '../utils/config.dart';

class SymptomsPage extends StatefulWidget {
  const SymptomsPage({Key? key}) : super(key: key);

  @override
  State<SymptomsPage> createState() => _SymptomsPageState();
}

class _SymptomsPageState extends State<SymptomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Select Your Symptoms",
        icon: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),        
        child: GestureDetector(
          child: GridView.count(
            crossAxisCount: 2, 
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: <Widget>[
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/fever.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Fever",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/dental.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Dental",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/cardiology.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Cardiology",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/dermatology.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Dermatology",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/cholesterol.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Cholesterol",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/diabetes.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Diabetes",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/respirations.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Respirations",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/eyecare.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Eye Care",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/stress.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Stress",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: [
                    Flexible(
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              'Assets/symptoms/virus.png',
                              width: 80,
                              height: 80,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Virus",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          onTap: () {
            // MyApp.navigatorKey.currentState!.push(MaterialPageRoute(
            //     builder: (_) => Symptoms()));
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Symptoms(),
              ),
            );
          },
        ),
      ),
    );
  }
}
