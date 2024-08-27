import 'package:flutter/material.dart';

class Skills extends StatefulWidget {
  final List<String> skills;
  final void Function() addSkill;

  Skills({required this.skills, required this.addSkill});

  @override
  _SkillsState createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  void _addSkill() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController skillController = TextEditingController();
        return AlertDialog(
          title: Text('Add New Skill'),
          content: TextField(
            controller: skillController,
            decoration: InputDecoration(hintText: 'Enter skill name'),
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
                  widget.skills.add(skillController.text);
                });
                Navigator.of(context).pop();
              },
              child: Text('Add'),
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
          padding: const EdgeInsets.fromLTRB(5.0, 8.0, 12.0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Skills',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                child: FloatingActionButton(
                  onPressed: _addSkill,
                  mini: true,
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                    side: BorderSide(
                      color: Colors.grey.shade300,
                      
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Wrap(
            spacing: 6.0,
            runSpacing: 6.0,
            children: widget.skills
                .map((skill) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(
                          color: Colors.grey.shade300,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 1.0,
                            spreadRadius: 0.5,
                            offset: Offset(0.5, 0.5),
                          ),
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      child: Text(
                        skill,
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                            fontWeight:
                                FontWeight.w500 // Setting the font size to 13
                            ),
                      ),
                    ))
                .toList(),
          ),
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
