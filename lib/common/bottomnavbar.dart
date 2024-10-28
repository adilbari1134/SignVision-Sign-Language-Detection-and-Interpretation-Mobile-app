import 'package:flutter/material.dart';
import 'package:sign_vision/screens/camerascreen.dart';
import '../screens/searchscreen.dart';
import '../screens/a.dart'; // Assuming you have a.dart as the initial practice screen

class MyBottomNavBar extends StatelessWidget {
  final int currentIndexValue;

  const MyBottomNavBar({super.key, required this.currentIndexValue});

  @override
  Widget build(BuildContext context) {
    return Stack(
      // alignment: Alignment.topCenter
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/homescreen');
                },
                icon: Icon(Icons.home_outlined,
                    color: (currentIndexValue == 0 || currentIndexValue == -1)
                        ? Color.fromARGB(255, 47, 46, 46)
                        : Colors.grey[600]),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: Icon(Icons.search,
                    color: currentIndexValue == 1
                        ? Color.fromARGB(255, 47, 46, 46)
                        : Colors.grey[600]),
              ),
              SizedBox(width: 50),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, '/achievementsscreen');
                },
                icon: Icon(Icons.insights_outlined,
                    color: currentIndexValue == 2
                        ? Color.fromARGB(255, 47, 46, 46)
                        : Colors.grey[600]),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/profilescreen');
                },
                icon: Icon(Icons.person_outline,
                    color: currentIndexValue == 3
                        ? Color.fromARGB(255, 47, 46, 46)
                        : Colors.grey[600]),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width / 2 - 30,
            child: Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(235, 234, 234, 1),
              ),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CameraScreen(
                          nextScreen:
                              A()))); // Provide the initial practice screen
                },
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 30,
                ),
                // backgroundColor: Color.fromRGBO(114, 204, 253, 1),
                elevation: 5,
                shape: CircleBorder(),
              ),
            ))
      ],
    );
  }
}
