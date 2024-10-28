import 'package:flutter/material.dart';
import 'camerawatching.dart'; // Import the CameraWatching screen

class Noentry extends StatelessWidget {
  const Noentry({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No-Entry',
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
                      'assets/warning_symbols/no_entry.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  'This symbol indicates a warning, caution, or potential hazard ahead. It alerts users to exercise caution, be aware of their surroundings, and proceed with care to avoid potential danger.',
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
                  child: Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CameraWatching(),
                          ),
                        );
                      },
                      child: Text(
                        "Next Symbol",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
