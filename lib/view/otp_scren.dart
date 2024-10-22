import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/viewmodel/verify_otp_view_model.dart';

class OtpScren extends StatefulWidget {
  final String id;
  final String code;
  OtpScren({super.key, required this.code, required this.id});

  @override
  _OtpScrenState createState() => _OtpScrenState();
}

class _OtpScrenState extends State<OtpScren> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<OtpVerificationViewModel>(context, listen: false);
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
                Text(widget.id.toString()),
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
                Consumer<OtpVerificationViewModel>(
                  builder: (context, viewModel, child) {
                    return Container(
                      width: 280.w,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: viewModel.loading
                            ? null // Disable button if loading
                            : () {
                                viewModel.fetchOtpVerificationData(context,
                                    userId: widget.id,
                                    code: otpController.text);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        child: viewModel.loading
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

  // Future<void> verifySignup(String otp) async {
  //   try {
  //     // Retrieve user ID from local storage
  //     final prefs = await SharedPreferences.getInstance();
  //     String? userId = prefs.getString('user_id'); // Get user ID

  //     // Prepare the data for verification
  //     final data = {
  //       'code': otp,
  //       'user_id': userId, // Include user ID in the request
  //     };

  //     // Call the verifySignUp API
  //     final response = await networkService.verifySignUp(data);
  //     print(response);

  //     // Handle the response
  //     if (response['user']['bool'] == true) {
  //       navigate(
  //           context, LoginScreen()); // Navigate to the login screen on success
  //     } else {
  //       setState(() {
  //         errorMessage = response['message'] ?? 'Unknown error occurred';
  //       });
  //     }
  //   } catch (error) {
  //     setState(() {
  //       errorMessage = 'Error: $error'; // Handle the error appropriately
  //     });
  //   }
  // }
}
