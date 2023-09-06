import 'package:healthcare_management_system/main.dart';
import 'package:healthcare_management_system/screens/doctorDetails.dart';
import 'package:healthcare_management_system/utils/config.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({
    Key? key,
    /*required this.doctor,
    required this.isFav,*/
  }) : super(key: key);

  /*final Map<String, dynamic> doctor;
  final bool isFav;*/

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      height: 150,
      child: GestureDetector(
        child: Card(
          elevation: 5,
          color: Colors.white,
          child: Row(
            children: [
              SizedBox(
                width: Config.widthSize * 0.28,
                child: Image.asset(
                  "Assets/doctor_3.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              Flexible(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        "Dr. Nishantha Kumara",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        "Fever",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 16,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Text('4.5'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('Reviews'),
                          Spacer(
                            flex: 1,
                          ),
                          Text('(20)'),
                          Spacer(
                            flex: 7,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          MyApp.navigatorKey.currentState!.push(MaterialPageRoute(
              builder: (_) => const DoctorDetails(
                    /*doctor: doctor,
                    isFav: isFav,*/
              )
          ));
        },
      ),
    );
  }
}
