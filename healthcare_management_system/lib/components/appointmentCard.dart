import 'package:healthcare_management_system/main.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../screens/appointments.dart';
import '../utils/config.dart';

class AppointmentCard extends StatefulWidget {
  // const AppointmentCard({Key? key, required this.doctor, required this.color})
  //     : super(key: key);

  // final Map<String, dynamic> doctor;
  // final Color color;

  @override
  State<AppointmentCard> createState() => _AppointmentCardState();
}

class _AppointmentCardState extends State<AppointmentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              //insert Row here
              const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage(
                        "Assets/richard.jpg"), //insert doctor profile
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Dr Richard',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        'Dental',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ],
              ),

              Config.spaceSmall,
              // Schedule info here
              ScheduleCard(),
              Config.spaceSmall,
              //action button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return RatingDialog(
                                  initialRating: 1.0,
                                  title: const Text(
                                    'Rate the Doctor',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  message: const Text(
                                    'Please help us to rate our Doctor',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  image: const FlutterLogo(
                                    size: 100,
                                  ),
                                  submitButtonText: 'Submit',
                                  commentHint: 'Your Reviews',
                                  onSubmitted: (response) async {
                                    // final SharedPreferences prefs =
                                    // await SharedPreferences.getInstance();
                                    // final token =
                                    //     prefs.getString('token') ?? '';
                                    //
                                    // final rating = await DioProvider()
                                    //     .storeReviews(
                                    //     response.comment,
                                    //     response.rating,
                                    //     widget.doctor['appointments']
                                    //     ['id'], //this is appointment id
                                    //     widget.doctor[
                                    //     'doc_id'], //this is doctor id
                                    //     token);

                                    //if successful, then refresh
                                    // if (rating == 200 && rating != '') {
                                    //   MyApp.navigatorKey.currentState!
                                    //       .pushNamed('main');
                                    // }
                                  });
                            });
                      },
                      child: const Text(
                        'Completed',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

//Schedule Widget
class ScheduleCard extends StatelessWidget {
  // const ScheduleCard({Key? key, required this.appointment}) : super(key: key);
  // final Map<String, dynamic> appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "Monday, 2023/09/10",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            width: 20,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '2.00 PM',
            style: TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
