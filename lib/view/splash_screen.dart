import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/view/select_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToSelectScreen();
  }

  _navigateToSelectScreen() async {
    await Future.delayed(
        Duration(seconds: 3), () {}); // Display splash for 3 seconds
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => SelectScreen()), // Navigate to HomeScreen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:
        //  Image.asset("assets/UI/grouppicture.jpg", height: 177.h, width: 128.w,),
         Image.asset('assets/UI/giveaway.png', height: 177.h, width: 128.w,), // Splash logo
      ),
    );
  }
}
