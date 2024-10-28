import 'package:flutter/material.dart';
import 'package:sign_vision/screens/aboutusscreen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,
          style: TextStyle(
              // color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w700)),
      centerTitle: true,
      // backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      backgroundColor: Color.fromRGBO(114, 204, 253, 1),

      // For Sidebar Menu Button
      iconTheme: IconThemeData(
        color: Color.fromARGB(194, 0, 0, 0),
        size: 30,
      ),

      actions: title == "SignVision"
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AboutUsScreen()));
                    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //     content: Expanded(
                    //   child:
                    //       Container(child: Card(child: Text('Card clicked!'))),
                    // )));
                  },
                  icon: Icon(Icons.info_outline),
                ),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
