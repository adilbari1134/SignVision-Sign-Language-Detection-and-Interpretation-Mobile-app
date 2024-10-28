import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'singupscreen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Container(
        color: Color.fromRGBO(235, 234, 234, 1),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 40),
                Text(
                  "SignVision is the platform to engage with sign language detection. We hope you will learn a lot!",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 40),
                SizedBox(
                  height: 45,
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              SignUpScreen(createAccount: true)));
                    },
                    child: Text(
                      "Continue",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(114, 204, 253, 1),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
