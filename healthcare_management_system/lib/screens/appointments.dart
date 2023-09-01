import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';
import '../components/customAppbar.dart';
import '../utils/config.dart';

class Appointments extends StatefulWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  State<Appointments> createState() => AppointmentsState();
}
enum FilterStatus { Upcoming, Completed, Canceled }

class AppointmentsState extends State<Appointments> {
  FilterStatus status = FilterStatus.Upcoming; 
  Alignment _alignment = Alignment.centerLeft;
  List<dynamic> schedules = [
    {
      "doctorName":"Kasun Perera",
      "doctorProfile":"Assets/doctor_2.jpg",
      "category":"Cardiology",
      "status":FilterStatus.Upcoming,
    },
    {
      "doctorName":"Hana Gamage",
      "doctorProfile":"Assets/doctor_4.jpg",
      "category":"Dental",
      "status":FilterStatus.Upcoming,
    },
    {
      "doctorName":"Kalum Weerasiri",
      "doctorProfile":"Assets/doctor_8.jpg",
      "category":"Diabetics",
      "status":FilterStatus.Completed,
    },
    {
      "doctorName":"Wasana Kumari",
      "doctorProfile":"Assets/doctor_9.jpg",
      "category":"Eye Care",
      "status":FilterStatus.Canceled,
    },
    {
      "doctorName":"Nishantha Kumara",
      "doctorProfile":"Assets/doctor_3.jpg",
      "category":"Fever",
      "status":FilterStatus.Canceled,
    }
  ];

  @override
  Widget build(BuildContext context) {

    List<dynamic> filteredSchedules = schedules.where((var schedule) {
      /*switch (schedule['status']) {
        case 'upcoming':
          schedule['status'] = FilterStatus.Upcoming;
          break;
        case 'completed':
          schedule['status'] = FilterStatus.Completed;
          break;
        case 'canceled':
          schedule['status'] = FilterStatus.Canceled;
          break;
      }*/
      return schedule['status'] == status;
    }).toList();

    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Your Appointments",
        //icon: const FaIcon(Icons.arrow_back_ios),
        icon: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () async {},
            icon: const Icon(
              //icon: FaIcon(
              //isFav ? Icons.favourite_rounded : Icons.favourite_outline,
              //isFav ? Icons.favorite : Icons.favorite_border_outlined,
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
                                } else if (filterStatus == FilterStatus.Completed) {
                                  status = FilterStatus.Completed;
                                  _alignment = Alignment.center;
                                } else if (filterStatus == FilterStatus.Canceled) {
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
            //AppointmentCard(),
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
                    /*shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),*/
                    margin: !isLastElement
                        ? const EdgeInsets.only(bottom: 20)
                        : EdgeInsets.zero,
                    child: Padding(  //this is it
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    schedule["doctorProfile"]
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    schedule['doctorName'],
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    schedule['category'],
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
                          ScheduleCard(),
                          /*ScheduleCard(
                            date: schedule['date'],
                            day: schedule['day'],
                            time: schedule['time'],
                          ),*/
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
                                              }
                                          );
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
      child: Row(
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


/*class ScheduleCard extends StatelessWidget {
  const ScheduleCard(
      {Key? key, required this.date, required this.day, required this.time})
      : super(key: key);
  final String date;
  final String day;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
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
            color: Config.primaryColor,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            '$day, $date',
            style: const TextStyle(
              color: Config.primaryColor,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          const Icon(
            Icons.access_alarm,
            color: Config.primaryColor,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Flexible(
              child: Text(
                time,
                style: const TextStyle(
                  color: Config.primaryColor,
                ),
              ))
        ],
      ),
    );
  }
}*/

