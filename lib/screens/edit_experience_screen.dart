// lib/screens/edit_experience_screen.dart

import 'package:flutter/material.dart';

class EditExperienceScreen extends StatefulWidget {
  final String position;
  final String company;
  final String duration;

  EditExperienceScreen({
    required this.position,
    required this.company,
    required this.duration,
  });

  @override
  _EditExperienceScreenState createState() => _EditExperienceScreenState();
}

class _EditExperienceScreenState extends State<EditExperienceScreen> {
  late TextEditingController _positionController;
  late TextEditingController _companyController;
  late TextEditingController _durationController;

  @override
  void initState() {
    super.initState();
    _positionController = TextEditingController(text: widget.position);
    _companyController = TextEditingController(text: widget.company);
    _durationController = TextEditingController(text: widget.duration);
  }

  @override
  void dispose() {
    _positionController.dispose();
    _companyController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Experience'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Enter Position'),
            ),
            TextField(
              controller: _companyController,
              decoration: InputDecoration(labelText: 'Enter Company'),
            ),
            TextField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Enter Duration'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle editing the experience
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
