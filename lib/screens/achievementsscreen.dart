import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../common/card.dart';
import '../common/appbar.dart';
import '../common/bottomnavbar.dart';
import '../common/sidedrawer.dart';

class AchievementsScreen extends StatelessWidget {
  const AchievementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: "Achievements"),
      drawer: SideDrawer(),
      bottomNavigationBar: MyBottomNavBar(currentIndexValue: 2),
      body: Container(
        color: Color.fromRGBO(235, 234, 234, 1),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          padding: EdgeInsets.fromLTRB(
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.width * 0.2,
            MediaQuery.of(context).size.width * 0.1,
            MediaQuery.of(context).size.width * 0.1,
          ),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MediumCard(
                  title: 'Quizzes',
                  numValue: 55,
                  imagePath: "assets/quiz.png",
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MediumCard(
                    title: "Leaderboard",
                    numValue: 2,
                    imagePath: "assets/bar_chart.png"),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MediumCard(
                    title: "Recall",
                    numValue: 86,
                    imagePath: "assets/recall.png"),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MediumCard(
                    title: "Accuracy",
                    numValue: 83,
                    imagePath: "assets/accuracy.png")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
