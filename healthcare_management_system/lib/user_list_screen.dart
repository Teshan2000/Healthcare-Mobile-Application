import 'package:flutter/material.dart';
import 'user_details_screen.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserDetailsScreen()),
            );
          },
          child: Text('Add User Details'),
        ),
      ),
    );
  }
}
