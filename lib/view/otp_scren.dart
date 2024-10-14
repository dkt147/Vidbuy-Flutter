import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';
import 'package:vidbuy_app/services/api.service.dart';
import 'package:vidbuy_app/services/network.service.dart';

class OtpScren extends StatefulWidget {
  const OtpScren({super.key});

  @override
  _OtpScrenState createState() => _OtpScrenState();
}

class _OtpScrenState extends State<OtpScren> {
  final NetworkService networkService = NetworkService(api: ApiService());
  final TextEditingController otpController = TextEditingController();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
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
                if (errorMessage != null) // Display error message if exists
                  Text(
                    errorMessage!,
                    style: TextStyle(color: Colors.red),
                  ),
                SizedBox(height: 18.h),
                Container(
                  width: 280.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () async {
                      await verifySignup(otpController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      "Verify and Create Account",
                      style: TextStyle(fontSize: 16.h, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> verifySignup(String otp) async {
    try {
      // Retrieve user ID from local storage
      final prefs = await SharedPreferences.getInstance();
      String? userId = prefs.getString('user_id'); // Get user ID

      // Prepare the data for verification
      final data = {
        'code': otp,
        'user_id': userId, // Include user ID in the request
      };

      // Call the verifySignUp API
      final response = await networkService.verifySignUp(data);
      print(response);

      // Handle the response
      if (response['user']['bool'] == true) {
        navigate(context, LoginScreen()); // Navigate to the login screen on success
      } else {
        setState(() {
          errorMessage = response['message'] ?? 'Unknown error occurred';
        });
      }
    } catch (error) {
      setState(() {
        errorMessage = 'Error: $error'; // Handle the error appropriately
      });
    }
  }
}
