import 'package:flutter/material.dart';

class ContactInfo extends StatefulWidget {
  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  String emailAddress = 'samanthasmith@gmail.com';
  String mobileNumber = '8564972318';

  void editContactInfo() {
    TextEditingController emailController =
        TextEditingController(text: emailAddress);
    TextEditingController phoneController =
        TextEditingController(text: mobileNumber);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Contact Info'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'Enter email address'),
              ),
              TextField(
                controller: phoneController,
                decoration: InputDecoration(hintText: 'Enter mobile number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  emailAddress = emailController.text;
                  mobileNumber = phoneController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: ImageIcon(
                AssetImage('assets/edit_icon.png'),
                size: 25,
                color: Color.fromARGB(255, 112, 110, 110),
              ),
              onPressed: editContactInfo,
              padding: EdgeInsets.all(8.0), // Adjust padding as needed
              constraints:
                  BoxConstraints(), // Removes default constraints to allow custom padding
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Email Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          emailAddress,
          style: TextStyle(
            color: const Color.fromARGB(255, 102, 101, 101),
            fontSize: 13,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Mobile Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        Text(
          mobileNumber,
          style: TextStyle(
            color: const Color.fromARGB(255, 102, 101, 101),
            fontSize: 13,
          ),
        ),
        SizedBox(height: 12),
        Divider(
          color: Colors.grey,
          thickness: 0.5, // Adjust thickness as needed
        ),
      ],
    );
  }
}
