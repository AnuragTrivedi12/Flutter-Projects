import 'dart:async';
import 'package:flutter/material.dart';
import 'auth/Screen/signinSignupScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds:3),() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SigninSignupScreen(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/hairbeauty_logo.png"))
          ),
        ),
      ),
    );
  }
}
