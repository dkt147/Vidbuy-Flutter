import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/view/otp_scren.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class InfluencerEditProfileScreen extends StatefulWidget {
  const InfluencerEditProfileScreen({super.key});

  @override
  State<InfluencerEditProfileScreen> createState() =>
      _InfluencerEditProfileScreenState();
}

class _InfluencerEditProfileScreenState
    extends State<InfluencerEditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _usernameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  File? _image;

  Future<void> _pickImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        setState(() {
          _image = File(image.path);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  File? _media;
  final ImagePicker _picker = ImagePicker();
  bool _isImage = true;

  Future<void> _pickMedia() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );

    if (pickedFile == null) {
      // If no image is selected, try to pick a video
      final XFile? pickedVideo =
          await _picker.pickVideo(source: ImageSource.gallery);
      if (pickedVideo != null) {
        setState(() {
          _media = File(pickedVideo.path);
          _isImage = false; // Mark as video
        });
      }
    } else {
      setState(() {
        _media = File(pickedFile.path);
        _isImage = true; // Mark as image
      });
    }
  }

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 52.h), // Space from top
            Container(
              margin: EdgeInsets.only(top: 55.h, left: 21.w),
              child: Row(
                children: [
                  Image.asset(
                    "assets/Icon/backarrow.png",
                    height: 25.h,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Content(
                    data: "Edit Profile",
                    size: 14.h,
                    weight: FontWeight.w600,
                    family: "Nunito",
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   "Create user account",
                  //   style: TextStyle(
                  //     fontSize: 28.h,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  Content(
                    data: "Edit profile",
                    size: 30.h,
                    weight: FontWeight.w300,
                  ),
                  SizedBox(height: 5.h),
                  Content(
                    data: "Below are your profile details",
                    size: 16.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      height: 89.h,
                      width: 87.w,
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.grey[200],
                        backgroundImage:
                            _image != null ? FileImage(_image!) : null,
                        child: _image == null
                            ? Icon(
                                Icons.camera_alt,
                                size: 26,
                                color: Colors.grey,
                              )
                            : null,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _pickMedia,
                    child: Container(
                      height: 89.h,
                      width: 87.w,
                      child: CircleAvatar(
                        radius: 40.r,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: _isImage
                            ? (_media != null ? FileImage(_media!) : null)
                            : null,
                        child: _media == null
                            ? Icon(
                                Icons.camera_alt,
                                size: 26,
                                color: Colors.grey,
                              )
                            : _isImage
                                ? null
                                : Icon(
                                    Icons.video_library,
                                    size: 26,
                                    color: Colors.grey,
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Profile Photo",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  "Intro Video",
                  style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: 12.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            // Container(
            //   height: 89.h,
            //   width: 87.w,
            //   child: CircleAvatar(
            //     radius: 40.r,
            //     backgroundColor: Colors.grey[200],
            //     child: Icon(
            //       Icons.camera_alt,
            //       size: 26.h,
            //       color: Colors.grey,
            //     ),
            //   ),
            // ),
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentField(
                    label: "Your Name",
                    hint: "Enter Your Name",
                    colorr: Colors.transparent,
                    prefixIcon: Icon(Icons.person),
                    controller: _nameController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "Your username",
                    hint: "Enter Your Username",
                    colorr: Colors.transparent,
                    prefixIcon: Icon(Icons.person),
                    controller: _usernameController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "Your category",
                    hint: "[CATEGORY]",
                    colorr: Colors.transparent,
                    // prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.arrow_drop_down_circle),
                    controller: _emailController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "Your Country",
                    hint: "[Country]",
                    colorr: Colors.transparent,
                    // prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.arrow_drop_down_circle),
                    controller: _emailController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "The email associated with this account is:",
                    hint: "Email",
                    colorr: Colors.transparent,
                    // prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.arrow_drop_down_circle),
                    controller: _emailController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),

            // SizedBox(height: 20.h),
            Container(
              margin: EdgeInsets.only(left: 27.w),
              child: Text(
                "Change Password?",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14.h,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Container(
                width: 335.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle account creation
                    if (_nameController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(microseconds: 1),
                          backgroundColor: Colors.black,
                          content: Text(
                            'Please Enter Email',
                            style: TextStyle(color: Colors.red.shade50),
                          ),
                        ),
                      );
                      // }
                      // else if (_emailController.text.length < 9 ||
                      //     _passwordController.text.length < 6) {
                      //   Utils.snackBar("Wrong Credentials", context);
                    } else if (_usernameController.text.isEmpty) {
                      snackBar("Please enter username", context);
                    } else if (_emailController.text.isEmpty) {
                      snackBar("Please enter valid Email", context);
                    } else if (_passwordController.text.isEmpty) {
                      snackBar("Please Enter Password", context);
                    } else if (_passwordController.text.length < 8) {
                      snackBar("Please Enter 8 Digit Password", context);
                    } else {
                      Navigator.pop(context);
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
                    "Save",
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
            SizedBox(
              height: 15.h,
            ),
          ],
        ),
      ),
    );
  }
}
