import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/customAppBar.dart';
import 'package:healthcare_management_system/components/doctorCard.dart';
import 'package:healthcare_management_system/providers/dioProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/config.dart';

class Symptoms extends StatefulWidget {
  final String symptomName;

  Symptoms({
    Key? key,
    required this.symptomName,
  }) : super(key: key);

  @override
  State<Symptoms> createState() => SymptomsState();
}

class SymptomsState extends State<Symptoms> {

  List<dynamic> filteredDoctors = [];
  Map<String, dynamic> doctor = {};
  Map<String, dynamic> user = {};

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

  // void filterDoctors() {
  //   filteredDoctors = user['doctor']
  //       .where((doctor) => doctor['category'] == widget.symptomName)
  //       .toList();
  // }

  void filterDoctors() {
    if (user['doctor'] != null) {
      filteredDoctors = user['doctor']
          .where((doctor) => doctor['category'] == widget.symptomName)
          .toList();
    }
  }

  // @override
  // void initState() {
  //   getData();
  //   filterDoctors();
  //   super.initState();
  // }

  @override
  void initState() {
    super.initState();
    getData().then((_) {
      filterDoctors();
    });
  }


  @override
  void didUpdateWidget(covariant Symptoms oldWidget) {
    if (oldWidget.symptomName != widget.symptomName) {
      filterDoctors();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: widget.symptomName,
        icon: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              Icons.thermostat,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18),
                  child: Center(
                    child: const Text(
                      "If you have Fever,",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    "                 Measure Your Temperature",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    "                 Take Paracetamol pills",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    "                 Take some rest",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Config.spaceSmall,                
                Text(
                  "   Choose Your Doctor",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Column(
                //   children: List.generate(5, (index) {
                //     return DoctorCard(route: '', doctor: {},);
                //   }),
                //   children: List.generate(user['doctor'].length, (index) {
                //     return DoctorCard(
                //       route: 'doctor',
                //       doctor: user['doctor'][index],
                //     );
                //   }),
                // )

                // if (user['doctor'] != null)
                //   Column(
                //     children: List.generate(user['doctor'].length, (index) {                      
                //       return DoctorCard(
                //         route: 'doctor',
                //         doctor: user['doctor'][index],
                //       );                                           
                //     }),
                //   )

                //if (filteredDoctors.isNotEmpty)
                if (filteredDoctors != null && filteredDoctors.isNotEmpty)

                  Column(
                    children: List.generate(filteredDoctors.length, (index) {
                      return DoctorCard(
                        route: 'doctor',
                        doctor: filteredDoctors[index],
                      );
                    }),
                  ),
                if (filteredDoctors.isEmpty)
                  Center(
                    child: Text(
                      "No doctors available for ${widget.symptomName}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ]),
        ),
      ),
    );
  }
}
