import 'package:flutter/material.dart';

class AddExperienceScreen extends StatefulWidget {
  @override
  _AddExperienceScreenState createState() => _AddExperienceScreenState();
}

class _AddExperienceScreenState extends State<AddExperienceScreen> {
  final TextEditingController _toDateController = TextEditingController();
  final TextEditingController _positionController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _fromDateController = TextEditingController();
  bool _currentlyWorking = false;

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8.0),
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade300,
          spreadRadius: 1,
          blurRadius: 4,
          offset: Offset(0, 2), // changes position of shadow
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(String hint, {Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,
      hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 18),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
      ),
      suffixIcon: suffixIcon,
    );
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light(),
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: child!,
            ),
          ),
        );
      },
    );

    if (picked != null) {
      controller.text = '${picked.day}/${picked.month}/${picked.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: Center(
          child: Text(
            'Add Experience',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Currently working here',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Checkbox(
                    value: _currentlyWorking,
                    onChanged: (bool? value) {
                      setState(() {
                        _currentlyWorking = value!;
                        if (_currentlyWorking) {
                          _toDateController.clear();
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: child,
                  );
                },
                child: !_currentlyWorking
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'To Date',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            decoration: _containerDecoration(),
                            child: TextField(
                              controller: _toDateController,
                              decoration: _inputDecoration(
                                'Enter To Date',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _selectDate(context, _toDateController);
                                  },
                                  child: Icon(
                                    Icons.calendar_today,
                                    color: Color.fromARGB(255, 5, 60, 105),
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Designation',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: _containerDecoration(),
                child: TextField(
                  controller: _positionController,
                  decoration: _inputDecoration('Enter Designation'),
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Company Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: _containerDecoration(),
                child: TextField(
                  controller: _companyController,
                  decoration: _inputDecoration('Enter Company Name'),
                ),
              ),
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'From Date',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: _containerDecoration(),
                child: TextField(
                  controller: _fromDateController,
                  decoration: _inputDecoration(
                    'Enter From Date',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _selectDate(context, _fromDateController);
                      },
                      child: Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 5, 60, 105),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle adding the experience
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    backgroundColor: const Color.fromARGB(255, 15, 59, 95),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Add Experience',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
