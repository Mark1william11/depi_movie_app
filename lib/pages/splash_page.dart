import 'package:flutter/material.dart';
import 'auth/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const AuthPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Set background color to blueAccent
      body: SafeArea(
        child: Center(
          child: Image.asset(
            'images/splash_image.png', // Ensure this path is correct
            width: 500,
          ),
        ),
      ),
    );
  }
}
