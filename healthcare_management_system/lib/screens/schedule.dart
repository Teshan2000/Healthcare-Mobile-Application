import 'package:healthcare_management_system/components/button.dart';
import 'package:healthcare_management_system/components/customAppbar.dart';
import 'package:healthcare_management_system/main.dart';
import 'package:healthcare_management_system/models/dateTimeConvert.dart';
import 'package:healthcare_management_system/providers/dioProvider.dart';
import 'package:healthcare_management_system/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  State<Schedule> createState() => ScheduleState();
}

class ScheduleState extends State<Schedule> {

  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool _isWeekend = false;
  bool _dateSelected = false;
  bool _timeSelected = false;
  String? token;

  Future<void> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token') ?? '';
  }

  @override
  void initState() {
    getToken();
    super.initState();
  }

    Widget _tableCalendar() {
      return TableCalendar(
        focusedDay: _focusDay,
        firstDay: DateTime.now(),
        lastDay: DateTime(2023, 12, 31),
        calendarFormat: _format,
        currentDay: _currentDay,
        rowHeight: 48,
        calendarStyle: const CalendarStyle(
          todayDecoration:
          BoxDecoration(color: Config.primaryColor, shape: BoxShape.circle),
        ),
        availableCalendarFormats: const {
          CalendarFormat.month: 'Month',
        },
        onFormatChanged: (format) {
          setState(() {
            _format = format;
          });
        },
        onDaySelected: ((selectedDay, focusedDay) {
          setState(() {
            _currentDay = selectedDay;
            _focusDay = focusedDay;
            _dateSelected = true;

            if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
              _isWeekend = true;
              _timeSelected = false;
              _currentIndex = null;
            } else {
              _isWeekend = false;
            }
          });
        }),
      );
    }

    @override
    Widget build(BuildContext context) {
    Config().init(context);
    final doctor = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Schedule Your Appointment",
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                  child: Center(
                    child: Text(
                      'Select Appointment Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                _tableCalendar(),
                Config.spaceSmall,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  child: Center(
                    child: Text(
                      'Select Appointment Time',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _isWeekend
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    alignment: Alignment.center,
                    child: Center(
                      child: const Text(
                        'Weekend is not available, please select another date',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
              )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return InkWell(
                        splashColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                            _timeSelected = true;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index
                                ? Config.primaryColor
                                : null,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            '${index + 9}:00 ${index + 9 > 11 ? "PM" : "AM"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color:
                              _currentIndex == index ? Colors.white : null,
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: 8,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4, childAspectRatio: 1.5
                  ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                  child: Button(
                    width: double.infinity,
                    title: 'Schedule Appointment',
                    onPressed: () async {
                      final getDate = DateConverted.getDate(_currentDay);
                      final getDay = DateConverted.getDay(_currentDay.weekday);
                      final getTime = DateConverted.getTime(_currentIndex!);

                      final booking = await DioProvider()
                          .bookAppointment(getDate, getDay, getTime, doctor['doctor_id'], token!);

                      if (booking == 200) {
                        MyApp.navigatorKey.currentState!.pushNamed("payment");
                      }                  
                    },
                    disable: _timeSelected && _dateSelected ? false : true,
                  ),
                ),
              ),
        ]
      )
    );
  }
}
