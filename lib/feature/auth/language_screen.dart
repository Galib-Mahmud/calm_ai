import 'package:flutter/material.dart';

class LanguageScreen extends StatefulWidget {
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Language'),
        actions: [
          TextButton(
            onPressed: () {
              // Implement Skip functionality
            },
            child: Text('Skip', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text(
              'Select Language',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Select your preferable language',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            DropdownButton<String>(
              value: selectedLanguage,
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedLanguage = newValue!;
                });
              },
              items: <String>['English', 'Farsi', 'Norwegian']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Icon(Icons.language),
                      SizedBox(width: 10),
                      Text(value),
                    ],
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Implement Next button functionality
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0099A6), // Custom color
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 16),
                //this is ana de armas
              ),
            ),
          ],
        ),
      ),
    );
  }
}
