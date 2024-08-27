import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  bool isExpanded = false;
  String aboutMeText =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Amet sit ullamcorper quisque eu sollicitudin rhoncus non augue. Sit magna vel magna rhoncus.';

  void toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void editAboutMe() {
    TextEditingController aboutMeController =
        TextEditingController(text: aboutMeText);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit About Me'),
          content: TextField(
            controller: aboutMeController,
            decoration: InputDecoration(hintText: 'Enter about me text'),
            maxLines: null,
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
                  aboutMeText = aboutMeController.text;
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
        Padding(
          padding: const EdgeInsets.only(top: 2.0), // Top padding set to 2
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'About Me',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: ImageIcon(
                  AssetImage('assets/edit_icon.png'),
                  size: 25,
                  color: Color.fromARGB(255, 112, 110, 110),
                ),
                onPressed: editAboutMe,
              ),
            ],
          ),
        ),
        SizedBox(height: 4),
        Text(
          aboutMeText,
          maxLines: isExpanded ? null : 3, // Show all lines if expanded
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Row(
          children: [
            InkWell(
              onTap: toggleExpanded,
              child: Text(
                isExpanded ? 'Read less...' : 'Read more...',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 63, 110),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.work, size: 13, color: Color.fromARGB(255, 72, 71, 71)),
            SizedBox(width: 4),
            Text(
              '4+ Years experience',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
            SizedBox(
                width: 16), // Increased space between experience and location
            Icon(Icons.location_on,
                size: 13, color: Color.fromARGB(255, 72, 71, 71)),
            SizedBox(width: 4),
            Text(
              'California, USA',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 12.0), // Adjust spacing as needed
        Divider(
          color: Colors.grey,
          thickness: 0.5,
        ),
      ],
    );
  }
}
