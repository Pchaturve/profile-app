import 'package:flutter/material.dart';
import '../models/experience.dart';
import '../screens/edit_experience_screen.dart';
import '../screens/add_experience_screen.dart';

class WorkExperience extends StatefulWidget {
  @override
  _WorkExperienceState createState() => _WorkExperienceState();
}

class _WorkExperienceState extends State<WorkExperience> {
  final List<Experience> workExperiences = [
    Experience(
      position: 'Jr. Flutter developer',
      company: 'Metricsviews Pvt Ltd',
      duration: '2022-09-06 - 2024-23-05 (1y11m)',
      logo: 'assets/google_logo.png',
    ),
    Experience(
      position: 'Software Engineer',
      company: 'Wilsh and Harvi Pvt Ltd',
      duration: '2024-01-04 - Present (0y3m)',
      logo: 'assets/google_logo.png',
    ),
    Experience(
      position: 'Sr. Golang Developer',
      company: 'Praman Proserv Technologies India Pvt Ltd',
      duration: '2021-09-26 - 2024-09-26 (3y0m)',
      logo: 'assets/google_logo.png',
    ),
    Experience(
      position: 'Sr React Developer',
      company: 'Metricsviews Pvt Ltd',
      duration: '2018-09-06 - 2024-02-05 (5y11m)',
      logo: 'assets/google_logo.png',
    ),
  ];

  void _editExperience(BuildContext context, Experience experience) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditExperienceScreen(
          position: experience.position,
          company: experience.company,
          duration: experience.duration,
        ),
      ),
    );
  }

  void _addExperience(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddExperienceScreen()),
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
              'Work Experience',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: ImageIcon(
                    AssetImage(
                        'assets/edit_icon.png'), // Replace with your edit icon
                    size: 25,
                    color: Color.fromARGB(255, 112, 110, 110),
                  ),
                  onPressed: () {
                    // For now, we are just using the first experience to edit.
                    // This should be replaced with the actual experience you want to edit.
                    _editExperience(context, workExperiences[0]);
                  },
                ),
                SizedBox(width: 8), // Adjust spacing as needed
                IconButton(
                  icon: ImageIcon(
                    AssetImage(
                        'assets/add_icon.png'), // Replace with your add icon
                    size: 25,
                    color: const Color.fromARGB(255, 77, 75, 75),
                  ),
                  onPressed: () => _addExperience(context),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        ...workExperiences.map((experience) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue, // Sky blue background color
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                    border: Border.all(color: Colors.grey), // Border
                  ),
                  child: Image.asset(
                    experience.logo,
                    fit: BoxFit.contain, // Ensure image fits within container
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.position,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        experience.company,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        experience.duration,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}
