import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/resources/componenets/tab_bar_widget.dart';
import 'package:vidbuy_app/view/choose_category_screen.dart.dart';
import 'package:vidbuy_app/view/create_user_account_screen.dart';
import 'package:vidbuy_app/view/forgot_password_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52.h), // To give some top spacing
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "Welcome Back,",
                    size: 30.h,
                  ),
                  Content(
                    data:
                        "We are happy to see you here again. Enter your email address and\npassword",
                    size: 10.h,
                    family: "Nunito",
                  ),
                ],
              ),
            ),
            SizedBox(height: 75.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Content(
                  //   data: "Your Email",
                  //   size: 16.h,
                  //   family: "Lato",
                  //   weight: FontWeight.w500,
                  // ),
                  ContentField(
                    label: "Your Email",
                    hint: "example@gmail.com",
                    prefixIcon: Icon(Icons.email),
                    controller: _emailController,
                    colorr: Colors.transparent,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    // validate: validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  // Content(
                  //   data: "Your Password",
                  //   size: 16.h,
                  //   family: "Lato",
                  //   weight: FontWeight.w500,
                  // ),
                  ContentFieldPassword(
                      label: "Your Password",
                      hint: "Password",
                      index: 1,
                      // textInput: TextInputType.text,
                      controller: _passwordController,
                      inputFormat: <TextInputFormatter>[
                        FilteringTextInputFormatter.singleLineFormatter,
                      ]),
                  // Container(
                  //   height: 50.h,
                  //   width: 335.w,
                  //   child: TextField(
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       hintText: "********",
                  //       hintStyle: TextStyle(
                  //           fontFamily: "Lato",
                  //           fontSize: 16.h,
                  //           color: Color(0xff908B8B)),
                  //       prefixIcon: Icon(Icons.lock),
                  //       suffixIcon: IconButton(
                  //         icon: Icon(Icons.visibility),
                  //         onPressed: () {},
                  //       ),
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Color(0xffFFFFFF)),
                  //         borderRadius: BorderRadius.circular(30.r),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Container(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_emailController.text.isEmpty) {
                      snackBar("Enter Valid Email", context);
                    } else if (_passwordController.text.isEmpty) {
                      snackBar(
                        "Enter Password",
                        context,
                      );
                    } else if (_passwordController.text.length < 8) {
                      snackBar(
                          "Enter Minium 8 Characters of Password", context);
                    } else {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => TabBarWidget()));
                      navigate(context, NavBarScreen());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 16.h, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ForgotPasswordScreen()));
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontSize: 12.h),
                ),
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  indent: 30.w,
                )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Text("or"),
                ),
                Expanded(
                    child: Divider(
                  endIndent: 30.w,
                )),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateUserAccountScreen()),
                  );
                },
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Lato",
                    fontSize: 20.h,
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
