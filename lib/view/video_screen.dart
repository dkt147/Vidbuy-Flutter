import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/view/feedback_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Image.asset("assets/Vector/boy.png", width: 305.w, height: 527.h,),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: 280.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  // if (_emailController.text.isEmpty) {
                  //   snackBar("Enter Valid Email", context);
                  // } else if (_passwordController.text.isEmpty) {
                  //   snackBar(
                  //     "Enter Password",
                  //     context,
                  //   );
                  // } else if (_passwordController.text.length < 8) {
                  //   snackBar(
                  //       "Enter Minium 8 Characters of Password", context);
                  // } else {
                  //   // Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (_) => TabBarWidget()));
                    navigate(context, FeedbackScreen());
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Accepet",
                  style: TextStyle(fontSize: 16.h, color: Colors.white),
                ),
              ),
            ),
                SizedBox(
              height: 8.h,
            ),
                Center(
                  child: Container(
                    width: 280.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // if (_emailController.text.isEmpty) {
                        //   snackBar("Enter Valid Email", context);
                        // } else if (_passwordController.text.isEmpty) {
                        //   snackBar(
                        //     "Enter Password",
                        //     context,
                        //   );
                        // } else if (_passwordController.text.length < 8) {
                        //   snackBar(
                        //       "Enter Minium 8 Characters of Password", context);
                        // } else {
                        //   // Navigator.push(
                        //   //     context,
                        //   //     MaterialPageRoute(
                        //   //         builder: (_) => TabBarWidget()));
                        //   navigate(context, NavBarScreen());
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5271FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Something is not right",
                        style: TextStyle(fontSize: 16.h, color: Colors.white),
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}