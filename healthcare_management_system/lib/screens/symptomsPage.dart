import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
            crossAxisCount: 2, // Number of columns
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.thermometer,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.tooth,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.heartPulse,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.handDots,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.disease,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.fireFlameSimple,
                              color: Config.primaryColor,
                              size: 36,
                            ),
                            Config.spaceSmall,
                            Text(
                              "Diabetics",
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.lungs,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.solidEye,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.headSideVirus,
                              color: Config.primaryColor,
                              size: 36,
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.virus,
                              color: Config.primaryColor,
                              size: 36,
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
            MyApp.navigatorKey.currentState!.push(MaterialPageRoute(
                builder: (_) => const Symptoms()));
          },
        ),
      ),
    );
  }
}
