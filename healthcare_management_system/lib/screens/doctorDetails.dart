import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:healthcare_management_system/utils/config.dart';
import 'package:healthcare_management_system/components/custom_appbar.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key, required this.doctor, required this.isFav}) 
        : super(key: key);
  final Map<String, dynamic> doctor;
  final bool isFav;

  @override
  State<DoctorDetails> createState() => DoctorDetailsState();
}

class DoctorDetailsState extends State<DoctorDetails> {
  Map<String, dynamic> doctor = {};
  bool isFav = false;

  @override
  void initState() {
    doctor = widget.doctor;
    isFav = widget.isFav;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Doctor Details Page",
        icon: const FaIcon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: FaIcon(
              isFav ? Icons.favourite_rounded : Icons.favourite_outline,
              color: Colors.red,
            ),
          )
        ]
      ),
      body: SafeArea(
        child: Column(
          children: <widget>[
            AboutDoctor(
              doctor:doctor,
            ), 
            DetailBody(
              doctor:doctor,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: "Book a Doctor",
                onPressed: () {
                  Navigator.of(context).pushNamed("Booking Name",
                      arguments: {"doc_id": doctor["doc_id"]});
                },
                disable: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutDoctor extends StatelessWidget {
  const AboutDoctor({Key? key, required this.doctor}) : super(key: key);

  final Map<dynamic, dynamic> doctor;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      width: double.infinity,
      child: Column(
          children: <widget>[
            CircleAvatar(
              radius: 65.0,
              backgroundImage: AssetImage(assets/doctor.jpg),
              backgroundColor: Colors.white,
            ),
            Config.spaceMedium,
            const Text(
              "Dr. Nishantha Kumara",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: const Text(
                "MBBS (University of Colombo)",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: const Text(
                "Colombo General Hospital",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            )
          ],
      ),
    );
  }
}

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.strech,
        children: <widget>[Config.spaceSmall,],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
        children: <widget>[
          Expanded(child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Config.primaryColor,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 15
            ),
            child: Column(
            children: const <widget>[
              Text(
                "Patients",
                style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "109",
                style: TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ))
        ]
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
