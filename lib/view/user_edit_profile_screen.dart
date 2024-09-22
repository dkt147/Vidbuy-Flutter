import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';

class UserEditProfileScreen extends StatefulWidget {
  const UserEditProfileScreen({super.key});

  @override
  State<UserEditProfileScreen> createState() => _UserEditProfileScreenState();
}

class _UserEditProfileScreenState extends State<UserEditProfileScreen> {
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
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 5.h),
                  Content(
                    data:
                        "Below are your profile details",
                    size: 16.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
            Center(
              child: GestureDetector(
                onTap: _pickImage,
                child: Container(
                  height: 89.h,
                  width: 87.w,
                  child: CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.grey[200],
                     backgroundImage: _image != null ? FileImage(_image!) : null,
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
            ),
            SizedBox(height: 30.h),
            Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentField(
                    label: "Your Name",
                    hint: "Enter Your Name",
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
                    prefixIcon: Icon(Icons.person),
                    controller: _usernameController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "The email associated with this account is:",
                    hint: "Enter Your Email",
                    prefixIcon: Icon(Icons.email),
                    controller: _emailController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  // SizedBox(height: 10.h),
                  // ContentFieldPassword(
                  //     label: "Your Password",
                  //     hint: "Password",
                  //     index: 1,
                  //     // textInput: TextInputType.text,
                  //     controller: _passwordController,
                  //     inputFormat: <TextInputFormatter>[
                  //       FilteringTextInputFormatter.singleLineFormatter
                  //     ]),
                ],
              ),
            ),

            // SizedBox(height: 20.h),
            // Row(
            //   children: [
            //     Checkbox(
            //       value: true,
            //       onChanged: (value) {
            //         // Handle checkbox change
            //       },
            //     ),
            //     Expanded(
            //       child: Text(
            //         "I want to receive news and information via email",
            //         style: TextStyle(
            //           color: Colors.black54,
            //           fontSize: 14.sp,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Container(
              margin: EdgeInsets.only(left: 25.w),
              child: TextButton(
                  onPressed: () {
                    // Handle login redirect
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    // );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Change Password?",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ),
            SizedBox(height: 70.h),
            Center(
              child: Container(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // Handle account creation
                    // if (_nameController.text.isEmpty) {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(
                    //       behavior: SnackBarBehavior.floating,
                    //       duration: Duration(microseconds: 1),
                    //       backgroundColor: Colors.red.shade500,
                    //       content: Text(
                    //         'Please Enter Email',
                    //         style: TextStyle(color: Colors.red.shade50),
                    //       ),
                    //     ),
                    //   );
                    //   // }
                    //   // else if (_emailController.text.length < 9 ||
                    //   //     _passwordController.text.length < 6) {
                    //   //   Utils.snackBar("Wrong Credentials", context);
                    // } else if (_usernameController.text.isEmpty) {
                    //   snackBar("Please enter username", context);
                    // } else if (_emailController.text.isEmpty) {
                    //   snackBar("Please enter valid Email", context);
                    // } else if (_passwordController.text.isEmpty) {
                    //   snackBar("Please Enter Password", context);
                    // } else if (_passwordController.text.length < 8) {
                    //   snackBar("Please Enter 8 Digit Password", context);
                    // } else {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => OtpScren()),
                    //   );
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
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
            // SizedBox(height: 20.h),
            // Center(
            //   child: 
            // ),
          ],
        ),
      ),
    );
  }
}