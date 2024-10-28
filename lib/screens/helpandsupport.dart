import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  const HelpAndSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help and Support'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(235, 234, 234, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        color: Color.fromRGBO(235, 234, 234, 1),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Help and Support',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Text(
                  'Contact Information',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff786CF8)),
                ),
                SizedBox(height: 20),
                Text(
                  'For any inquiries or assistance, reach out to us:',
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Email: support@signvision.com',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone: +9234567890',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
