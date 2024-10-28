import 'package:flutter/material.dart';
import 'package:sign_vision/screens/blue.dart';
import 'package:sign_vision/screens/bread.dart';
import 'package:sign_vision/screens/hi.dart';
import 'package:sign_vision/screens/howcanihelpyou.dart';
import '../common/appbar.dart';
import 'A.dart';

class SignLessonsScreen extends StatelessWidget {
  const SignLessonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Lessons"),
      // drawer: SideDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(235, 234, 234, 1),
        child: ListView(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          children: [
            Text(
              'Lessons on Sign Language',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20),
            customListTile(
              context: context,
              leading: Image.asset(
                'assets/alphabet.png',
                width: 40,
                height: 40,
              ),
              title: 'Level-1',
              subtitle: 'English Alphabets',
              screen: A(),
            ),
            customListTile(
              context: context,
              leading: Image.asset(
                'assets/hand.png',
                width: 35,
                height: 35,
              ),
              title: 'Level-2',
              subtitle: 'Greetings',
              screen: Hi(),
            ),
            customListTile(
              context: context,
              leading: Image.asset(
                'assets/chat_bubble.png',
                width: 40,
                height: 40,
              ),
              title: 'Level-3',
              subtitle: 'Common Phrases',
              screen: Howcanihelpyou(),
            ),
            customListTile(
              context: context,
              leading: Image.asset(
                'assets/activities.png',
                width: 35,
                height: 37,
              ),
              title: 'Level-4',
              subtitle: 'Activities & Yes/No',
              screen: Bread(),
            ),
            customListTile(
              context: context,
              leading: Image.asset(
                'assets/document.png',
                width: 35,
                height: 30,
              ),
              title: 'Level-5',
              subtitle: 'Colors & Simple Sentences',
              screen: Blue(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget customListTile({
  required BuildContext context,
  required Widget leading,
  required String title,
  required String subtitle,
  required Widget screen,
}) {
  return Container(
    height: 100,
    // color: Colors.white,
    child: Card(
      surfaceTintColor: Colors.white,
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: ListTile(
          leading: leading,
          title: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          trailing: Icon(Icons.arrow_forward,
              color: Color.fromRGBO(114, 204, 253, 1)),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          },
        ),
      ),
    ),
  );
}
