import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_vision/screens/singupscreen.dart'; // Adjust the import as needed // Adjust the import as needed

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _changePassword() async {
    String newPassword = ''; // You need to get this value from a form or input
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(newPassword);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error changing password: ${e.toString()}')),
      );
    }
  }

  Future<void> _deleteAccount() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.delete();
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => SignUpScreen(createAccount: true)),
          (Route<dynamic> route) => false,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Account deleted successfully')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error deleting account: ${e.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Color.fromRGBO(235, 234, 234, 1),
        //    actions: [
        //     IconButton(
        //       icon: Icon(Icons.arrow_back),
        //      onPressed: () {
        //       Navigator.of(context).pop();
        //    },
        //    ),
        //  ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Settings',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 30),
            ListTile(
              title: Text('Change Password'),
              onTap: () {
                _changePassword();
                // Navigate to a new screen or show a dialog to input the new password
              },
            ),
            Divider(),
            ListTile(
              title: Text('Delete Account'),
              onTap: () {
                _deleteAccount();
              },
            ),
          ],
        ),
      ),
    );
  }
}
