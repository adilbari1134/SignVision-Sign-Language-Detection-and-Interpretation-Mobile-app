import 'package:flutter/material.dart';
import 'package:sign_vision/common/appbar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'About Us'),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(235, 234, 234, 1),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'At SignVision, we are committed to transforming the communication experiences for individuals of all abilities. We understand the importance of inclusive communication, especially for those using sign languge. Our app has been meticulously designed to offer effortlessly detect and translate sign language, ensuring smooth interaction for everyone, wether at work, home, or out and about.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 20),
                Text(
                  'Our Mission',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Text(
                  'Our mission is clear - to empower seamless communication for individuals of diverse abilities by providing a reliable and instance sign language detection service. SignVision aims to break down communication barriers, fostering inclusivity and connection in everyday interactions for people of all backgroud and abilities.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
