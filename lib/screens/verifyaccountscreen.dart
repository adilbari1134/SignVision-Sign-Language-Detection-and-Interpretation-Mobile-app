import 'package:flutter/material.dart';
import 'package:sign_vision/screens/homescreen.dart';

class VerifiedAccountScreen extends StatelessWidget {
  const VerifiedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(235, 234, 234, 1),
      ),
      body: Container(
        color: Color.fromRGBO(235, 234, 234, 1),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Account Created",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w700)),
                  SizedBox(height: 30),
                  Image.asset(
                    'assets/verify_account_2.png',
                    width: 250,
                    height: 200,
                    // fit: BoxFit.cover,
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Your account has been created successfully!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 45,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => HomeScreen()));
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                            (Route<dynamic> route) => false);
                      },
                      child: Text(
                        "Go to Dashboard",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
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
      ),
    );
  }
}
