import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/viewmodel/forgot_password_view_model.dart';
import 'package:vidbuy_app/viewmodel/verify_otp_view_model.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  final int userId;
  final int code;
  ForgotPasswordOtpScreen(
      {super.key, required this.code, required this.userId});

  @override
  _ForgotPasswordOtpScreenState createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<ForgotPasswordViewModel>(context, listen: false);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 108.h, left: 21.w),
            child: Column(
              children: [
                Text(
                  "Check your inbox",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 30.h,
                      color: Colors.black),
                ),
                Text(
                  "We have sent a verification code by email",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.h,
                      fontFamily: "Nunito",
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(height: 78.h),
          Center(
            child: Column(
              children: [
                Text(widget.code.toString()),

                Pinput(
                  controller: otpController,
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 55.h,
                    textStyle: TextStyle(
                        fontSize: 20.h,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Color(0xffD9D9D9),
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
                // if (errorMessage != null) // Display error message if exists
                //   Text(
                //     errorMessage!,
                //     style: TextStyle(color: Colors.red),
                //   ),
                SizedBox(height: 18.h),
                Consumer<ForgotPasswordViewModel>(
                  builder: (context, viewModel, child) {
                    return Container(
                      width: 280.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: viewModel.otpLoading
                            ? null // Disable button if loading
                            : () {
                                int number = int.parse(otpController.text);
                                viewModel.fetchOtpResponse(
                                    context, widget.userId, number);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: viewModel.otpLoading
                            ? CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              )
                            : Text(
                                "Create Account",
                                style: TextStyle(
                                  fontSize: 20.h,
                                  fontFamily: "Lato",
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
