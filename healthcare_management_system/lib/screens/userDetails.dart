import 'package:flutter/material.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String firstName = "";
  String lastName = "";
  String email = "";
  String contactNumber = "";
  String dateOfBirth = "";
  String gender = "";
  String bloodGroup = "";
  String maritalStatus = "";
  String height = "";
  String weight = "";

  bool isEditing = false; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: <Widget>[
          isEditing
              ? IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    // Save the updated user information
                    // Implement your save logic here
                    setState(() {
                      isEditing = false; 
                    });
                  },
                )
              : IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    setState(() {
                      isEditing = true; 
                    });
                  },
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage(
                    'Assets/profile1.jpg'
                ), // Replace with user's profile picture URL
              ),
              SizedBox(height: 20.0),
              // Arrange user information fields in two columns, filling first and third
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: buildTextFormField(
                      "First Name",
                      firstName,
                      "Enter first name",
                      isEditing
                          ? (val) => setState(() => firstName = val)
                          : null,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: buildTextFormField(
                      "Last Name",
                      lastName,
                      "Enter last name",
                      isEditing
                          ? (val) => setState(() => lastName = val)
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: buildTextFormField(
                      "Email",
                      email,
                      "Enter email",
                      isEditing ? (val) => setState(() => email = val) : null,
                    ),
                  ),
                  SizedBox(width: 10.0), 
                  Expanded(
                    child: buildTextFormField(
                      "Contact Number",
                      contactNumber,
                      "Enter contact number",
                      isEditing
                          ? (val) => setState(() => contactNumber = val)
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: buildTextFormField(
                      "Date of Birth",
                      dateOfBirth,
                      "Enter date of birth",
                      isEditing
                          ? (val) => setState(() => dateOfBirth = val)
                          : null,
                    ),
                  ),
                  SizedBox(width: 10.0), 
                  Expanded(
                    child: buildTextFormField(
                      "Gender",
                      gender,
                      "Enter gender",
                      isEditing ? (val) => setState(() => gender = val) : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: buildTextFormField(
                      "Blood Group",
                      bloodGroup,
                      "Enter blood group",
                      isEditing
                          ? (val) => setState(() => bloodGroup = val)
                          : null,
                    ),
                  ),
                  SizedBox(width: 10.0), 
                  Expanded(
                    child: buildTextFormField(
                      "Marital Status",
                      maritalStatus,
                      "Enter marital status",
                      isEditing
                          ? (val) => setState(() => maritalStatus = val)
                          : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: buildTextFormField(
                      "Height",
                      height,
                      "Enter height",
                      isEditing ? (val) => setState(() => height = val) : null,
                    ),
                  ),
                  SizedBox(width: 10.0), 
                  Expanded(
                    child: buildTextFormField(
                      "Weight",
                      weight,
                      "Enter weight",
                      isEditing ? (val) => setState(() => weight = val) : null,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              if (isEditing)
                ElevatedButton(
                  onPressed: () {
                    // Save the updated user information
                    // Implement your save logic here
                    setState(() {
                      isEditing = false; 
                    });
                  },
                  child: Text("Save"),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(String label, String value, String hintText,
      ValueChanged<String>? onChanged) {
    return TextFormField(
      initialValue: value,
      enabled: isEditing,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
      ),
    );
  }
}
