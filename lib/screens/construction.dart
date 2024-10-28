import 'package:flutter/material.dart';
import 'flamable.dart';

class Construction extends StatelessWidget {
  const Construction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Construction Ahead',
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
                      'assets/warning_symbols/construction.png',
                      height: 250,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                Text(
                  'Construction ahead This sign indicates you are entering a construction zone. Drive with extra caution and be prepared for changes in the speed limit. Traffic control.',
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
                          builder: (context) => Flamable(),
                        ),
                      );
                    },
                    child: Text(
                      "Next Symbol",
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
