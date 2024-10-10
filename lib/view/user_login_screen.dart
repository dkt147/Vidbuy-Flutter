import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/view/create_user_account_screen.dart';
import 'package:vidbuy_app/view/forgot_password_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
import 'package:vidbuy_app/services/api.service.dart';
import 'package:vidbuy_app/services/network.service.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Logger _logger = Logger();

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  // NetworkService instance
  late NetworkService _networkService;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    // Initialize NetworkService
    _networkService = NetworkService(
      api: ApiService(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login(BuildContext context) async {
    // Input validation
    if (_emailController.text.isEmpty) {
      snackBar("Enter Valid Email", context);
      return;
    }
    if (_passwordController.text.isEmpty) {
      snackBar("Enter Password", context);
      return;
    }
    if (_passwordController.text.length < 8) {
      snackBar("Enter Minimum 8 Characters for Password", context);
      return;
    }

    // Show loading indicator
    setState(() {
      _isLoading = true;
    });

    // Prepare data for the API call
    Map<String, dynamic> data = {
      'email': _emailController.text,
      'password': _passwordController.text,
      'role_id': "2"
    };

    try {
      // Call the login API
      var response = await _networkService.login(data);
      log('Login Response: $response'); // Log the response for debugging
      setState(() {
        _isLoading = false;
      });

      // Handle the response
      if (response['bool'] == true) {

        final prefs = await SharedPreferences.getInstance();
          // Extract user ID from response
          int token = response['user']['token'];
          await prefs.setString(
              'token', token.toString());
        // Navigate to the NavBarScreen upon successful login
        //

        // Check if the widget is still mounted before navigating
        if (!mounted) return;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const NavBarScreen()),
        );
      } else {
        if (!mounted) return;
        // Show error message if login fails
        snackBar(
            response['message'] ?? 'Login failed. Please try again.', context);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      if (!mounted) return;
      // Log error instead of using print
      _logger.e('Login failed', error: e);
      snackBar('Error: $e', context); // Show error if the API call fails
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 52.h),
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
                  ContentField(
                    label: "Your Email",
                    hint: "example@gmail.com",
                    prefixIcon:
                        Image.asset("assets/Icon/email.png", height: 25.h),
                    controller: _emailController,
                    colorr: Colors.transparent,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentFieldPassword(
                    label: "Your Password",
                    hint: "Password",
                    index: 0, // Add this line
                    controller: _passwordController,
                    inputFormat: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType
                        .visiblePassword, // This line is also included
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Center(
              child: Container(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () => _login(context), // Pass context here
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: _isLoading
                      ? CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        )
                      : Text(
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
