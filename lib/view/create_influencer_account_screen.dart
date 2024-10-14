import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/services/api.service.dart';
import 'package:vidbuy_app/services/network.service.dart';
import 'package:vidbuy_app/view/otp_scren.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class CreateInfluencerAccountScreen extends StatefulWidget {
  const CreateInfluencerAccountScreen({super.key});

  @override
  State<CreateInfluencerAccountScreen> createState() =>
      _CreateInfluencerAccountScreenState();
}

class _CreateInfluencerAccountScreenState
    extends State<CreateInfluencerAccountScreen> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _countryController;

  late NetworkService _networkService;

  File? _profileImage;
  String? _base64Image;

  @override
  void initState() {
    super.initState();
    _networkService = NetworkService(api: ApiService());

    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _countryController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  Future<void> _pickProfileImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      print(image);

      if (image != null) {
        setState(() {
          _profileImage = File(image.path);
          _base64Image = base64Encode(_profileImage!.readAsBytesSync());
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _createAccount() async {
    if (_nameController.text.isEmpty) {
      _showSnackBar('Please enter your name');
      return;
    }
    if (_usernameController.text.isEmpty) {
      _showSnackBar('Please enter your username');
      return;
    }
    if (_emailController.text.isEmpty) {
      _showSnackBar('Please enter your email');
      return;
    }
    if (_passwordController.text.isEmpty) {
      _showSnackBar('Please enter your password');
      return;
    }
    if (_countryController.text.isEmpty) {
      _showSnackBar('Please enter your country');
      return;
    }

    // Prepare the registration data
    Map<String, dynamic> registrationData = {
      'name': _nameController.text,
      'username': _usernameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'country': 1,
      'profile_image': _base64Image,
      'role_id': "3",
    };

    print(registrationData);

    var response = await _networkService.register(registrationData);
    print(response);
    if (response['user']['bool'] == true) {
      // Save user ID in local storage
      final prefs = await SharedPreferences.getInstance();

      // Extract the user object from the response
      Map<String, dynamic> user = response['user'];

      // Save user details in local storage
      await prefs.setString('user', user.toString());

      // Extract user ID from the user object
      int userId = user['id'];

      await prefs.setString('user_id', userId.toString());

      // Navigate to the OTP screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OtpScren()),
      );
    } else {
      snackBar(response['message'] ?? 'Registration failed', context);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red.shade500,
        content: Text(
          message,
          style: TextStyle(color: Colors.red.shade50),
        ),
      ),
    );
  }

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
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
            GestureDetector(
              onTap: _pickProfileImage,
              child: Container(
                height: 89.h,
                width: 87.w,
                child: CircleAvatar(
                  radius: 40.r,
                  backgroundColor: Colors.grey[200],
                  backgroundImage:
                      _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.camera_alt, size: 26, color: Colors.grey)
                      : null,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            ContentField(
              label: "Your Name",
              hint: "Enter Your Name",
              colorr: Colors.transparent,
              controller: _nameController,
              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: 10.h),
            ContentField(
              label: "Your Username",
              hint: "Enter Your Username",
              colorr: Colors.transparent,
              controller: _usernameController,
              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10.h),
            ContentField(
              label: "Your Email",
              hint: "Enter Your Email",
              colorr: Colors.transparent,
              controller: _emailController,
              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10.h),
            ContentFieldPassword(
              label: "Your Password",
              hint: "Password",
              index: 1,
              controller: _passwordController,
              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 10.h),
            ContentField(
              label: "Your Country",
              hint: "Enter Your Country",
              colorr: Colors.transparent,
              controller: _countryController,
              inputFormat: <TextInputFormatter>[
                FilteringTextInputFormatter.singleLineFormatter
              ],
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _createAccount,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Create Account",
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(color: Colors.black54),
                    children: [
                      TextSpan(
                        text: "Log in",
                        style: TextStyle(
                          color: Color(0xff810F9E),
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
