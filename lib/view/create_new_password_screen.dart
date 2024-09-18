import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/view/nav_bar.dart';

class CreateNewPasswordScreen extends StatelessWidget {
  CreateNewPasswordScreen({super.key});

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 21.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 43.h), // Space from the top
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
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
              ContentFieldPassword(
                  label: "Password",
                  hint: "Password",
                  index: 1,
                  // textInput: TextInputType.text,
                  controller: _passwordController,
                  inputFormat: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter,
                  ]),
              SizedBox(height: 8.h),
          
              Text(
                "Must be at least 6 characters.",
                style: TextStyle(
                  fontSize: 14.h,
                  fontFamily: "Nunito",
                  color: Color(0xff908B8B),
                ),
              ),
              SizedBox(height: 20.h),
              ContentFieldPassword(
                  label: "Confirm Password",
                  hint: "Password",
                  index: 1,
                  // textInput: TextInputType.text,
                  controller: _confirmPasswordController,
                  inputFormat: <TextInputFormatter>[
                    FilteringTextInputFormatter.singleLineFormatter,
                  ]),
              SizedBox(height: 40.h),
              Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_passwordController.text.isEmpty) {
                      snackBar("Please Enter Pass", context);
                    } else if (_confirmPasswordController.text.isEmpty) {
                      snackBar("Please Enter Confrim Password", context);
                    } else {
                      navigate(context, NavBarScreen());
                    }
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
                    "Reset Password",
                    style: TextStyle(
                      fontSize: 16.h,
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
