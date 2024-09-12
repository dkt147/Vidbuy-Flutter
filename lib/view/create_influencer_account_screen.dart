import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/otp_scren.dart';

class CreateInfluencerAccountScreen extends StatelessWidget {
  const CreateInfluencerAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52.h), // Space from top
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Add functionality to go back
              },
            ),
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Create user account",
                  //   style: TextStyle(
                  //     fontSize: 28.h,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Content(
                    data: "Create Influencer Account",
                    size: 30.h,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 5.h),
                  Content(
                    data:
                        "Create your account to buy, create orders and share videos\nwith your friends",
                    size: 10.h,
                    weight: FontWeight.w400,
                    family: "Nunito",
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 89.h,
                    width: 87.w,
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.camera_alt,
                        size: 26.h,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    height: 89.h,
                    width: 87.w,
                    child: CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey[200],
                      child: Icon(
                        Icons.camera_alt,
                        size: 26.h,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Profile Photo",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Intro Video",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Container(
            //   height: 89.h,
            //   width: 87.w,
            //   child: CircleAvatar(
            //     radius: 40.r,
            //     backgroundColor: Colors.grey[200],
            //     child: Icon(
            //       Icons.camera_alt,
            //       size: 26.h,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "Your name",
                    size: 16.h,
                    weight: FontWeight.w400,
                    family: "Lato",
                  ),
                  _buildTextField(
                    // label: "Your name",
                    hintText: "Enter your name",
                    icon: Icons.person,
                  ),
                  SizedBox(height: 10.h),
                  Content(
                    data: "Your username",
                    size: 16.h,
                    weight: FontWeight.w400,
                    family: "Lato",
                  ),
                  _buildTextField(
                    // label: "Your username",
                    hintText: "Enter your username",
                    icon: Icons.person_outline,
                  ),
                  SizedBox(height: 10.h),
                  Content(
                    data: "Your Email",
                    size: 16.h,
                    weight: FontWeight.w400,
                    family: "Lato",
                  ),
                  _buildTextField(
                    // label: "Your email",
                    hintText: "Enter your email address",
                    icon: Icons.email,
                  ),
                  SizedBox(height: 10.h),
                  Content(
                    data: "Your password",
                    size: 16.h,
                    weight: FontWeight.w400,
                    family: "Lato",
                  ),
                  _buildPasswordField(),
                ],
              ),
            ),

            SizedBox(height: 20.h),
            Row(
              children: [
                Checkbox(
                  value: true,
                  onChanged: (value) {
                    // Handle checkbox change
                  },
                ),
                Expanded(
                  child: Text(
                    "I want to receive news and information via email",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle account creation
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OtpScren()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    // padding: EdgeInsets.symmetric(
                    //   horizontal: 120.w,
                    //   vertical: 15.h,
                    // ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Create account",
                    style: TextStyle(
                      fontSize: 20.h,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle login redirect
                },
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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

Widget _buildTextField({
  // required String label,
  required String hintText,
  required IconData icon,
}) {
  return Container(
    width: 335.w,
    height: 50.h,
    child: TextField(
      decoration: InputDecoration(
        // labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon, color: Colors.grey),
        hintStyle: TextStyle(
            color: Color(0xff908B8B),
            fontFamily: "Lato",
            fontWeight: FontWeight.w500,
            fontSize: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.5.w,
          ),
        ),
      ),
    ),
  );
}

Widget _buildPasswordField() {
  return Container(
    width: 335.w,
    height: 50.h,
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        // labelText: "Your password",
        hintText: "********",
        prefixIcon: Icon(Icons.lock, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility, color: Colors.grey),
          onPressed: () {
            // Handle password visibility toggle
          },
        ),
        hintStyle: TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1.5.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: Colors.blue,
            width: 1.5.w,
          ),
        ),
      ),
    ),
  );
}
