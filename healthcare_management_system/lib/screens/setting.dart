import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {

          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white, fontSize: 32),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 2.5 * 16.0,
            color: Colors.blue,
          ),
          SizedBox(height: 2.0 * 16.0),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                TopicTile(icon: Icons.account_circle, label: 'Account'),
                TopicTile(icon: Icons.notifications, label: 'Notifications'),
                TopicTile(icon: Icons.privacy_tip, label: 'Privacy'),
                TopicTile(icon: Icons.settings, label: 'General'),
                TopicTile(icon: Icons.info, label: 'About Us'),
              ],
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          ),
          TopicTile(icon: Icons.logout, label: 'Log Out'),
          Spacer(),
          Container(
            height: 5 * 16.0,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NavigationIconButton(icon: Icons.home, label: 'Home'),
                NavigationIconButton(icon: Icons.message, label: 'Messages'),
                NavigationIconButton(icon: Icons.schedule, label: 'Schedule'),
                NavigationIconButton(icon: Icons.settings, label: 'Settings'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopicTile extends StatelessWidget {
  final IconData icon;
  final String label;

  TopicTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(icon, color: Colors.white),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
      onTap: () {

      },
    );
  }
}

class NavigationIconButton extends StatelessWidget {
  final IconData icon;
  final String label;

  NavigationIconButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.white),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SettingsPage(),
  ));
}
