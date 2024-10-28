import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'noentry.dart';
import 'lessonsscreen.dart';
import '../common/bottomnavbar.dart';
import '../common/appbar.dart';
import '../common/card.dart';
import '../common/sidedrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String userName = "Loading...";

  @override
  void initState() {
    super.initState();
    _getUserName();
  }

  Future<void> _getUserName() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();
        if (userDoc.exists) {
          setState(() {
            userName = userDoc['name'];
          });
        } else {
          setState(() {
            userName = "User";
          });
        }
      }
    } catch (e) {
      setState(() {
        userName = "User";
      });
      print("Error fetching user name: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "SignVision"),
      drawer: SideDrawer(),
      bottomNavigationBar: MyBottomNavBar(currentIndexValue: 0),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(235, 234, 234, 1),
        child: Center(
          child: Column(
            children: [
              Container(
                height: 85,
                width: MediaQuery.of(context).size.width * 0.99,
                child: Card(
                  surfaceTintColor: Color.fromRGBO(235, 234, 234, 1),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Text("Hey",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700)),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Image.asset(
                                    "assets/hand.png",
                                    width: 22,
                                    height: 22,
                                  ),
                                ],
                              ),
                              Text(userName,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                          ),
                          child: CircleAvatar(
                            radius: 35,
                            backgroundImage:
                                AssetImage("assets/profile_image.jpg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BigCard(
                            title:
                                "Level wise sign language detection & learning",
                            imagePath: "assets/progress.png",
                            Screen: SignLessonsScreen(),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      BigCard(
                        title: "General warning symbols",
                        imagePath: "assets/general_symbol.png",
                        Screen: Noentry(),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
