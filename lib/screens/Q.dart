import 'package:flutter/material.dart';
import 'package:sign_vision/screens/R.dart'; // Import the next screen
import 'package:sign_vision/screens/camerascreen.dart';

class Q extends StatelessWidget {
  const Q({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Language',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(114, 204, 253, 1),
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.close, size: 28)),
      ),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(235, 234, 234, 1),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
            child: Column(
              children: [
                Text(
                  'Level-1: English Alphabets',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.grey),
                ),
                SizedBox(height: 20),
                Text(
                  'Sign for Letter \'Q\'',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border:
                                    Border.all(color: Colors.grey, width: 2.0)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset(
                                'assets/alphabets/Q.png',
                                height: 250,
                                width: 250,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                CameraScreen(nextScreen: R())));
                      },
                      child: Text(
                        "Practice",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(114, 204, 253, 1),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              ],
            ),
          )),
    );
  }
}
