import 'package:flutter/material.dart';
import 'package:healthcare_management_system/components/app_drawer.dart';
import 'package:healthcare_management_system/components/customAppBar.dart';
import 'package:healthcare_management_system/screens/SymptomsPage.dart';
import 'package:healthcare_management_system/screens/appointments.dart';
import 'package:healthcare_management_system/screens/profile_page.dart';
import 'package:healthcare_management_system/screens/settings.dart';
import '../components/doctorCard.dart';
import '../utils/config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  int _currentPage = 0;
  // Define your banner images here
  List<String> bannerImages = [
    'Assets/banner/1.png',
    'Assets/banner/2.png',
    'Assets/banner/3.png',
  ];

  List<Map<String, dynamic>> medCat = [
    {
      "imageAsset": 'Assets/symptoms/sick.png',
      "category": "  Fever  ",
    },
    {
      "imageAsset": 'Assets/symptoms/dental.png',
      "category": "  Dental  ",
    },
    {
      "imageAsset": 'Assets/symptoms/heart.png',
      "category": "Eye Care",
    },
    {
      "imageAsset": 'Assets/symptoms/skin.png',
      "category": "Stress",
    },
    {
      "imageAsset": 'Assets/symptoms/cholesterol.png',
      "category": "Cardiology",
    },
    {
      "imageAsset": 'Assets/symptoms/sugar.png',
      "category": "Dermatology",
    },
    {
      "imageAsset": 'Assets/symptoms/virus.png',
      "category": "Respirations",
    },
    {
      "imageAsset": 'Assets/symptoms/fear.png',
      "category": "Cholesterol",
    },
    {
      "imageAsset": 'Assets/symptoms/eye.png',
      "category": "Diabetics",
    },
    {
      "imageAsset": 'Assets/symptoms/cancer.png',
      "category": "Virus",
    },
  ];

  // Future<void> getData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token') ?? '';

  //   if (token.isNotEmpty && token != '') {
  //     final response = await DioProvider().getUser(token);
  //     if (response != null) {
  //       setState(() {
  //         user = json.decode(response);
  //         //print(user);
  //       });
  //     }
  //   }
  // }

  // @override
  // void initState() {
  //   getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Config().init(context);
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Welcome User!",
      ),
      drawer: AppDrawer(
        userName: 'Hirun Kolongahapitiya',
        profilePictureUrl:
            'https://th.bing.com/th/id/R.469f512b75a6e3dfca27d3ff0e784b04?rik=v3H1Ojg653JMDg&pid=ImgRaw&r=0&sres=1&sresct=1',
        onProfilePressed: () {
          // Navigate to the user's profile page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfilePage(),
            ),
          );
        },
        onAppointmentPressed: () {
          // Navigate to the user's profile page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Appointments(),
            ),
          );
        },
        onSymptomsPressed: () {
          // Navigate to the user's profile page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SymptomsPage(),
            ),
          );
        },
        onSettingsPressed: () {
          // Navigate to the user's profile page
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Settings(),
            ),
          );
        },
        onLogoutPressed: () {
          // Handle logout here (e.g., clear user session, navigate to login page)
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Banner Slideshow

                Container(
                  height: 200,
                  child: PageView.builder(
                    itemCount: bannerImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),

                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: const <Widget>[
                //       SizedBox(
                //         child: CircleAvatar(
                //           radius: 30,
                //           backgroundImage: AssetImage("assets/profile1.jpg"),
                //         ),
                //       ),
                //       Text(
                //         "Amanda",
                //         style: TextStyle(
                //           fontSize: 24,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Text(
                //         "22 Years Old",
                //         style: TextStyle(
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //     ],
                //   ),

                // Indicator dots for the slideshow
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    bannerImages.length,
                    (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.blue
                              : Colors.grey.withOpacity(0.5),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Choose Your Symptoms",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SymptomsPage(),
                          ),
                        );
                      },
                      child: Text(
                        "View All",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: 180,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List<Widget>.generate(medCat.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SymptomsPage(),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 5,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        medCat[index]['imageAsset'],
                                        width: 80,
                                        height: 80,
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        medCat[index]['category'],
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Choose Your Doctor",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: List.generate(5, (index) {
                    return DoctorCard(); // Assuming DoctorCard is a valid widget
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: Text('Medi Care'),
//       ),
//       drawer: AppDrawer(
//         userName: 'Hirun', // Replace with the user's name
//         profilePictureUrl:
//             'https://th.bing.com/th/id/R.469f512b75a6e3dfca27d3ff0e784b04?rik=v3H1Ojg653JMDg&pid=ImgRaw&r=0&sres=1&sresct=1', // Replace with profile picture URL
//         onProfilePressed: () {
//           // Navigate to the user's profile page
//           // Implement this navigation as per your app's navigation setup
//         },
//         onLogoutPressed: () {
//           // Handle logout here (e.g., clear user session, navigate to login page)
//         },
//       ),
//       body: Center(
//         child: Text('Your Home Page Content Goes Here'),
//       ),
//     );
//   }
// }
