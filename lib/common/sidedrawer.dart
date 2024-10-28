import 'package:flutter/material.dart';
import 'package:sign_vision/screens/aboutusscreen.dart';
import 'package:sign_vision/screens/userprofilescreen.dart';
import 'package:sign_vision/screens/helpandsupport.dart';
import 'package:sign_vision/screens/setting.dart';
import '../screens/homescreen.dart';
import '../screens/singupscreen.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: theme.colorScheme.secondary,
      // width: 250,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                  child: Text('SignVision',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)))),
          addMenuTile(context, "Home", Icons.home_outlined, HomeScreen()),
          addMenuTile(
              context, "Profile", Icons.person_outline, UserProfileScreen()),
          addMenuTile(context, "About Us", Icons.info_outline, AboutUsScreen()),
          addMenuTile(
              context, "Settings", Icons.settings_outlined, SettingsScreen()),
          addMenuTile(context, "Help & Support", Icons.help_outline,
              HelpAndSupportScreen()),
          addMenuTile(context, "Logout", Icons.logout_rounded,
              const SignUpScreen(createAccount: false)),
        ],
      ),
    );
  }
}

ListTile addMenuTile(
    BuildContext context, String title, IconData icon, Widget screen) {
  return (ListTile(
    title: Text(title),
    leading: Icon(icon),
    onTap: () {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => screen));
    },
  ));
}
