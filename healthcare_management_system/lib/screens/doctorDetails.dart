import 'package:flutter/material.dart';
import '../components/customAppBar.dart';
import '../utils/config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({Key? key, /*required this.doctor, required this.isFav*/})
        : super(key: key);

  /*final Map<String, dynamic> doctor;
  final isFav;*/

  @override
  State<DoctorDetails> createState() => DoctorDetailsState();
}

class DoctorDetailsState extends State<DoctorDetails> {
  //Map<String, dynamic> doctor = {};
  bool isFav = false;

  /*@override
  void initState() {
    doctor = widget.doctor;
    isFav = widget.isFav;
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Doctor Details",
        icon: const Icon(Icons.arrow_back_ios),
        //icon: const Icon(FontAwesomeIcons.arrowUpFromBracket),
        actions: [
          IconButton(
            onPressed: () async {
              setState(() {
                isFav = !isFav;
              });
            },
            icon: Icon(
              //icon: FaIcon(
              //isFav ? Icons.favourite_rounded : Icons.favourite_outline,
              isFav ? Icons.favorite : Icons.favorite_border_outlined,
              color: Colors.red,
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

  Button({required double width, required String title, required Null Function() onPressed, required bool disable}) {}
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
              //backgroundImage: AssetImage("Assets/doctor_9.jpg"),
              backgroundImage: NetworkImage("http://172.29.32.1:80${doctor['doctor_profile']}",),
              backgroundColor: Colors.white,
            ),
            Config.spaceMedium,
            Text(
              //"Dr. Wasana Kumari",
              "${doctor['doctor_name']}",
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
                //"MBBS (International Medical University, Russia), MRCP (Royal College of Physicians, United Kingdom)",
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
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          DoctorInfo(
            patients: doctor["patients"],
            exp: doctor["experience"],
          ),
          Config.spaceMedium,
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
                  //height: 1.5,
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
            //value: "98",
            value: "$patients",
        ),
        const SizedBox(width: 15,),
        InfoCard(
          label: "Experience",
          //value: "6 Years",
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
