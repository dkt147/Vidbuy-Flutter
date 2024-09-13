import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/create_new_password_screen.dart';

class CheckEmailScreen extends StatelessWidget {
  const CheckEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 43.h), // Space from top
          Container(
            margin: EdgeInsets.only(left: 21.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(height: 24.h),
                Text(
                  "Check your email",
                  style: TextStyle(
                    fontSize: 30.h,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                // SizedBox(height: 3.h),
                Text(
                  'We have sent a password recover instructions to your email',
                  style: TextStyle(
                      fontSize: 13.h,
                      color: Color(0xff908B8B),
                      fontFamily: "Nunito"),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          SizedBox(height: 50.h),
          Center(
            child: Icon(
              Icons.email_outlined,
              size: 121.h,
              color: Colors.black54,
            ),
          ),
          SizedBox(height: 23.h),
          Center(
            child: Container(
              width: 218.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to open email app
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateNewPasswordScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  // padding: EdgeInsets.symmetric(
                  //   horizontal: 80.w,
                  //   vertical: 15.h,
                  // ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Open email app",
                  style: TextStyle(
                      fontSize: 20.h, fontFamily: "Lato", color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 260.h),
          // Spacer(),
          Center(
            child: Text(
              "Did not receive the email? Check your spam,\nor try another email address",
              style: TextStyle(
                fontSize: 16.h,
                fontFamily: 'Lato',
                color: Color(0xff908B8B),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
