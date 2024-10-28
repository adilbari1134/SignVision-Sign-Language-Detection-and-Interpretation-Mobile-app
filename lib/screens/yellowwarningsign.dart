import 'package:flutter/material.dart';
import 'homescreen.dart';

class Yellowwarningsign extends StatelessWidget {
  const Yellowwarningsign({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Warning signs (yellow background)',
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(color: Colors.grey, width: 2.0)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Image.asset(
                      'assets/warning_symbols/yellowwarningsign.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  'hevron alignment signs are road signs used to indicate a sharp change in the direction of the road, such as a curve or bend. A distinctive chevron-shaped arrow points in the direction of the upcoming curve',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 20),
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
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Home Screen",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(114, 204, 253, 1),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
