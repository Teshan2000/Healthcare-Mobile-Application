import 'package:flutter/material.dart';
import 'package:healthcare_management_system/screens/auth.dart';

class AppDrawer extends StatelessWidget {
  //AuthService authService = AuthService();

  final String userName; // User's name
  final String profilePictureUrl; // URL to the user's profile picture
  final Function() onProfilePressed; // Function to navigate to the profile page
  final Function() onLogoutPressed;
  final Function() onAppointmentPressed;
  final Function() onSymptomsPressed;
  final Function() onNotificationsPressed;
  final Function() onSettingsPressed;

  AppDrawer({
    required this.userName,
    required this.profilePictureUrl,
    required this.onProfilePressed,
    required this.onLogoutPressed,
    required this.onAppointmentPressed,
    required this.onSymptomsPressed,
    required this.onNotificationsPressed,
    required this.onSettingsPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: null, // Add user's email here if needed
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(profilePictureUrl),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('View Profile'),
            onTap: onProfilePressed,
          ),
          ListTile(
            leading: Icon(Icons.schedule_send_outlined),
            title: Text('Appointments'),
            onTap: onAppointmentPressed,
          ),
          ListTile(
            leading: Icon(Icons.sick),
            title: Text('Symptoms'),
            onTap: onSymptomsPressed,
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: onSymptomsPressed,
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: onSettingsPressed,
          ),
          ListTile(
            onTap: () async {
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          //await authService.signOut();
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ),
                            (route) => false,
                          );
                        },
                        icon: const Icon(
                          Icons.done,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            leading: const Icon(Icons.exit_to_app),
            title: const Text(
              "Logout",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
