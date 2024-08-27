import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Education',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/usc.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            'University of South California',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 16, 14, 14)),
          ),
          subtitle: Text(
            'Bachelor of Information Technology',
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          trailing: IconButton(
            icon: Image.asset(
              'assets/edit_icon.png',
              //  color: Color.fromARGB(255, 112, 110, 110),
            ),
            iconSize: 22,
            onPressed: () {
              // Navigate to edit screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditEducationScreen()),
              );
            },
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}

class EditEducationScreen extends StatefulWidget {
  @override
  _EditEducationScreenState createState() => _EditEducationScreenState();
}

class _EditEducationScreenState extends State<EditEducationScreen> {
  TextEditingController _universityController = TextEditingController();
  TextEditingController _degreeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Education'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit your education details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _universityController,
              decoration: InputDecoration(
                labelText: 'University',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _degreeController,
              decoration: InputDecoration(
                labelText: 'Degree',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save the edited details
                Navigator.pop(context); // Close the edit screen
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
