import 'package:flutter/material.dart';
import '../common/appbar.dart';
import '../common/bottomnavbar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Search'),
      // drawer: SideDrawer(),
      bottomNavigationBar: MyBottomNavBar(currentIndexValue: 1),
      body: Container(
        color: Color.fromRGBO(235, 234, 234, 1),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  filled: true,
                  fillColor: Colors.white,
                  // prefixIcon: Icon(Icons.mail_outline, color: Colors.grey),
                  suffixIcon:
                      IconButton(icon: Icon(Icons.search), onPressed: () {}),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
