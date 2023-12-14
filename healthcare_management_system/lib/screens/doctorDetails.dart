import 'package:flutter/material.dart'
import 'package:healthcare_management_system/components/button.dart';
import '../components/customAppBar.dart';
import '../utils/config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key})
        : super(key: key);

  @override
  State<DoctorDetails> createState() => DoctorDetailsState();
}

class DoctorDetailsState extends State<DoctorDetails> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Doctor Details",
        icon: const Icon(Icons.arrow_back_ios),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border_outlined,
              color: Colors.blue,
            ),
          )     
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            DetailHead(
              doctor:doctor,
            ),
            DetailBody(
              doctor:doctor,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Button(
                width: double.infinity,
                title: "Book Appointment",
                onPressed: () {
                  Navigator.of(context).pushNamed("schedule",
                      arguments: {"doctor_id": doctor["doctor_id"]}
                  );
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

class DetailHead extends StatelessWidget {
  const DetailHead({Key? key, required this.doctor}) : super(key: key);

  final Map<dynamic, dynamic> doctor;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
          children: <Widget>[
            Config.spaceMedium,
            CircleAvatar(
              radius: 65.0,
              backgroundImage: NetworkImage("http://192.168.43.214:8000${doctor['doctor_profile']}",),
              backgroundColor: Colors.white,
            ),
            Config.spaceMedium,
            Text(
              "Dr. ${doctor['doctor_name']}",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: Text(
                "${doctor['bio_data']}",
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Config.spaceSmall,
            SizedBox(
              width: Config.widthSize * 0.75,
              child: const Text(
                "Colombo General Hospital",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
            Config.spaceSmall,
          ],
      ),
    );
  }
}


class DetailBody extends StatelessWidget {
  const DetailBody({Key? key, required this.doctor}) : super(key: key);

  final Map<dynamic, dynamic> doctor;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DoctorInfo(
            patients: doctor["patients"],
            exp: doctor["experience"],
          ),
          Config.spaceSmall,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Channeling Fee",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                softWrap: true,
                textAlign: TextAlign.left,
              ),
              Text(
                "Rs. 350",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                softWrap: true,
                textAlign: TextAlign.right,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({Key? key, required this.patients, required this.exp})
      : super(key: key);

  final int patients;
  final int exp;

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Row(
      children: <Widget>[
        InfoCard(
            label: "Patients",
            value: "$patients",
        ),
        const SizedBox(width: 15,),
        InfoCard(
          label: "Experience",
          value: "$exp Years",
        ),
        const SizedBox(width: 15,),
        const InfoCard(
          label: "Ratings",
          value: "4.5",
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.label, required this.value}) 
      : super(key: key);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Config.primaryColor,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 15
        ),
        child: Column(
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
