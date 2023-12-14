import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:healthcare_management_system/main.dart';
import 'package:healthcare_management_system/providers/dioProvider.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/customAppbar.dart';
import '../utils/config.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key, required this.doctor}) : super(key: key);

  final Map<String, dynamic> doctor;

  @override
  State<Appointments> createState() => AppointmentsState();
}

enum FilterStatus { Upcoming, Completed, Canceled }

class AppointmentsState extends State<Appointments> {
  FilterStatus status = FilterStatus.Upcoming;
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [];

  Future<void> getAppointments() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token') ?? '';

    final appointment = await DioProvider().getAppointments(token);
    if (appointment != 'Error') {
      setState(() {
        schedules = json.decode(appointment);
        print(schedules);
      });
    }
  }

  @override
  void initState() {
    getAppointments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      switch (schedule['status']) {
        case 'upcoming':
          schedule['status'] = FilterStatus.Upcoming;
          break;
        case 'completed':
          schedule['status'] = FilterStatus.Completed;
          break;
        case 'canceled':
          schedule['status'] = FilterStatus.Canceled;
          break;
      }
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Your Appointments",
        icon: const Icon(Icons.menu),
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
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Config.spaceSmall,
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (FilterStatus filterStatus in FilterStatus.values)
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (filterStatus == FilterStatus.Upcoming) {
                                  status = FilterStatus.Upcoming;
                                  _alignment = Alignment.centerLeft;
                                } else if (filterStatus ==
                                    FilterStatus.Completed) {
                                  status = FilterStatus.Completed;
                                  _alignment = Alignment.center;
                                } else if (filterStatus ==
                                    FilterStatus.Canceled) {
                                  status = FilterStatus.Canceled;
                                  _alignment = Alignment.centerRight;
                                }
                              });
                            },
                            child: Center(
                              child: Text(filterStatus.name),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                AnimatedAlign(
                  alignment: _alignment,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Config.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        status.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Config.spaceSmall,
            Config.spaceSmall,
            Expanded(
              child: ListView.builder(
                itemCount: filteredSchedules.length,
                itemBuilder: ((context, index) {
                  var schedule = filteredSchedules[index];
                  bool isLastElement = filteredSchedules.length + 1 == index;
                  return Card(
                    elevation: 5,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(
                                  //schedule["doctorProfile"]
                                  "http://192.168.43.214:8000${schedule['doctor_profile']}",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    //schedule['doctorName'],
                                    "Dr. ${schedule['doctor_name']}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    //schedule['category'],
                                    "${schedule['category']}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ScheduleCard(
                            date: schedule['date'],
                            day: schedule['day'],
                            time: schedule['time'],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                  ),
                                  child: const Text(
                                    'Completed',
                                    style: TextStyle(color: Colors.white),
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
                                                final SharedPreferences prefs =
                                                    await SharedPreferences
                                                        .getInstance();
                                                final token =
                                                    prefs.getString('token') ??
                                                        '';

                                                final rating = await DioProvider()
                                                    .storeReviews(
                                                        response.comment,
                                                        response.rating,
                                                        widget.doctor['appointments']['id'],
                                                        widget.doctor['doctor_id'],
                                                        token);

                                                if (rating == 200 &&
                                                    rating != '') {
                                                  MyApp.navigatorKey
                                                      .currentState!
                                                      .pushNamed('login');
                                                }
                                              });
                                        }
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                  ),
                                  child: const Text(
                                    'Canceled',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  const ScheduleCard(
      {Key? key, required this.date, required this.day, required this.time
      })
      : super(key: key);

  final String date;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: <Widget>[
          const Icon(
            Icons.calendar_today,
            color: Colors.white,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$day, $date',
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Colors.white,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
            '$time',
            style: const TextStyle(color: Colors.white),
          ))
        ],
      ),
    );
  }
}
