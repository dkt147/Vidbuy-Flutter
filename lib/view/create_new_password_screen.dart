import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 21.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 43.h), // Space from the top
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Add functionality to go back
              },
            ),
            SizedBox(height: 24.h),
            Text(
              "Create new password",
              style: TextStyle(
                fontSize: 30.h,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 11.h),
            Text(
              "Your new password must be different from previous used passwords.",
              style: TextStyle(
                  fontSize: 14.h,
                  color: Color(0xff908B8B),
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w300),
            ),
            SizedBox(height: 55.h),
            Text(
              "Password.",
              style: TextStyle(
                  fontSize: 14.h,
                  color: Color(0xff908B8B),
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w300),
            ),
            _buildPasswordTextField("Password"),
            SizedBox(height: 8.h),
            Text(
              "Must be at least 6 characters.",
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20.h),
            _buildPasswordTextField("Confirm Password"),
            SizedBox(height: 40.h),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add functionality to reset password
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(
                    horizontal: 120.w,
                    vertical: 15.h,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Reset password",
                  style: TextStyle(fontSize: 16.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordTextField(String label) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(Icons.lock, color: Colors.grey),
        suffixIcon: Icon(Icons.visibility_outlined, color: Colors.grey),
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
    );
  }
}
