import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'screens/aboutusscreen.dart';
import 'screens/achievementsscreen.dart';
import 'screens/userprofilescreen.dart';
import 'screens/homescreen.dart';
import 'screens/welcomescreen.dart';
import 'screens/singupscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(SignVisionApp());
}

class SignVisionApp extends StatelessWidget {
  const SignVisionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignVision',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => WelcomeScreen(),
        '/homescreen': (context) => HomeScreen(),
        '/profilescreen': (context) => UserProfileScreen(),
        '/achievementsscreen': (context) => AchievementsScreen(),
        '/aboutusscreen': (context) => AboutUsScreen(),
        '/signup': (context) =>
            SignUpScreen(createAccount: true), // Add SignUpScreen route
      },
      initialRoute: '/',
    );
  }
}
