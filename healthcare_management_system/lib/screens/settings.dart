import 'package:flutter/material.dart';
import '../components/customAppbar.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appTitle: "Settings",
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
      body: Column(
        children: [
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
        Navigator.of(context).pushNamed("user",);
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Settings(),
  ));
}