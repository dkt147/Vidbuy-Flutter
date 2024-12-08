import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/view/check_email_screen.dart';
import 'package:vidbuy_app/viewmodel/forgot_password_view_model.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();

  // Email validation function
  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ForgotPasswordViewModel>(context, listen: false);
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
                Navigator.pop(context);
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
            // Text(
            //   "Enter Your Email Address",
            //   style: TextStyle(
            //     fontSize: 16.h,
            //     fontFamily: "lato",
            //     color: Colors.black,
            //   ),
            // ),
            ContentField(
              label: "Enter Your Email Address",
              hint: "example@gmail.com",
              prefixIcon: Image.asset(
                "assets/Icon/email.png",
                height: 25.h,
              ),
              colorr: Colors.transparent,
              controller: _emailController,
              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 40.h),
            // Center(
            //   child: Container(
            //     height: 50.h,
            //     width: 335.w,
            //     child: ElevatedButton(
            //       onPressed: () {
            //         if (_emailController.text.isEmpty) {
            //           snackBar("Please Enter Email", context);
            //         } else {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //                 builder: (context) => CheckEmailScreen()),
            //           );
            //         }
            //       },
            //       style: ElevatedButton.styleFrom(
            //         backgroundColor: Color(0xff5271FF),
            //         // padding: EdgeInsets.symmetric(
            //         //   horizontal: 120.w,
            //         //   vertical: 15.h,
            //         // ),
            //         shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(30.r),
            //         ),
            //       ),
            //       child: Text(
            //         "Send Link",
            //         style: TextStyle(
            //             fontSize: 20.h,
            //             color: Color(0xffFFFFFF),
            //             fontWeight: FontWeight.w500,
            //             fontFamily: "Lato"),
            //       ),
            //     ),
            //   ),
            // ),

            Center(
              child: Consumer<ForgotPasswordViewModel>(
                  builder: (context, viewModel, child) {
                return Container(
                  width: 335.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: viewModel.emailLoading
                        ? null // Disable button if loading
                        : () {
                            final email = _emailController.text.trim();

                            if (email.isEmpty) {
                              Utils.snackBar(
                                  "Please enter your email.", context);
                            } else if (!_isValidEmail(email)) {
                              Utils.snackBar(
                                  "Please enter a valid email address.",
                                  context);
                            } else {
                              viewModel.fetchEmailResponse(context, email);
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: viewModel.emailLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            "Send Link",
                            style: TextStyle(
                                fontSize: 20.h,
                                color: Color(0xffFFFFFF),
                                fontWeight: FontWeight.w500,
                                fontFamily: "Lato"),
                          ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
