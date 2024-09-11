import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/check_email_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 41.h), // Space from top
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Add functionality to go back
              },
            ),
            SizedBox(height: 20.h),
            Text(
              "Forgot Password",
              style: TextStyle(
                fontSize: 30.h,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "We’ll send you an email with a link to reset your password, please enter the email associated with your account below.",
              style: TextStyle(
                fontSize: 14.h,
                fontFamily: "Nunito",
                color: Color(0xff908B8B),
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "Enter Your Email Address",
              style: TextStyle(
                fontSize: 16.h,
                fontFamily: "lato",
                color: Colors.black,
              ),
            ),
            _buildEmailTextField(),
            SizedBox(height: 40.h),
            Center(
              child: Container(
                height: 50.h,
                width: 335.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckEmailScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 120.w,
                    //   vertical: 15.h,
                    // ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Send Link",
                    style: TextStyle(
                        fontSize: 20.h,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Lato"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return TextField(
      decoration: InputDecoration(
        // labelText: "Enter your email adress",
        hintText: "exemple@gmail.com",
        prefixIcon: Icon(Icons.email, color: Colors.grey),
        hintStyle: TextStyle(color: Color(0xff908B8B), fontFamily: "Lato"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Color(0xff908B8B),
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Color(0xff908B8B),
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Color(0xff908B8B),
            width: 1.5.w,
          ),
        ),
      ),
    );
  }
}
