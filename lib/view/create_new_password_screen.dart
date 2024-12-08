import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/viewmodel/forgot_password_view_model.dart';

// ignore: must_be_immutable
class CreateNewPasswordScreen extends StatelessWidget {
  int userId;
  CreateNewPasswordScreen({super.key, required this.userId});

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<ForgotPasswordViewModel>(context, listen: false);
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
                label: "New Password",
                hint: "Password",
                index: 0, // Add this line
                controller: _passwordController,
                inputFormat: [FilteringTextInputFormatter.singleLineFormatter],
                keyboardType:
                    TextInputType.visiblePassword, // This line is also included
              ),
              SizedBox(height: 8.h),

              Text(
                "Must be at least 8 characters.",
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
                index: 0, // Add this line
                controller: _confirmPasswordController,
                inputFormat: [FilteringTextInputFormatter.singleLineFormatter],
                keyboardType:
                    TextInputType.visiblePassword, // This line is also included
              ),
              SizedBox(height: 40.h),
              Consumer<ForgotPasswordViewModel>(
                  builder: (context, viewModel, child) {
                return SizedBox(
                  width: 335.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: viewModel.forgotPasswordLoading
                        ? null // Disable button if loading
                        : () {
                            if (_passwordController.text.isEmpty) {
                              Utils.snackBar("Please enter password", context);
                            } else if (_confirmPasswordController
                                .text.isEmpty) {
                              Utils.snackBar(
                                  "Please enter confirm password", context);
                            } else if (_passwordController.text.length < 8) {
                              Utils.snackBar(
                                  "Password must be at least 8 characters long",
                                  context);
                            } else if (_confirmPasswordController.text.length <
                                8) {
                              Utils.snackBar(
                                  "Confirm Password must be at least 8 characters long",
                                  context);
                            } else {
                              viewModel.fetchForgotPasswordResponse(
                                  context,
                                  userId,
                                  _passwordController.text.toString(),
                                  _confirmPasswordController.text.toString());
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
                    child: viewModel.forgotPasswordLoading
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            "Reset Password",
                            style: TextStyle(
                              fontSize: 16.h,
                              color: Colors.white,
                              fontFamily: "Lato",
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
