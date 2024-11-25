import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/model/user_model/change_password_data_model.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/view/change_password_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_profile_view_model.dart';

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

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserProfileViewModel>(context, listen: true);
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
                    onTap: () {
                      viewModel.pickProfileImage();
                    },
                    child: Consumer<UserProfileViewModel>(
                      builder: (context, viewModel, child) {
                        return Container(
                          height: 89.h,
                          width: 87.w,
                          child: CircleAvatar(
                            radius: 40.r,
                            backgroundColor: Colors.grey[200],
                            backgroundImage: viewModel.profileImage != null
                                ? FileImage(viewModel.profileImage!)
                                : null,
                            child: viewModel.profileImage == null
                                ? Icon(Icons.camera_alt,
                                    size: 26, color: Colors.grey)
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
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
                    colorr: Colors.transparent,
                    prefixIcon: Image.asset(
                      "assets/Icon/person.png",
                      height: 25.h,
                    ),
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
                    prefixIcon: Image.asset(
                      "assets/Icon/person.png",
                      height: 25.h,
                    ),
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
                    colorr: Colors.transparent,
                    prefixIcon: Image.asset(
                      "assets/Icon/email.png",
                      height: 25.h,
                    ),
                    controller: _emailController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(left: 25.w),
              child: TextButton(
                onPressed: () {},
                child: GestureDetector(
                  onTap: () {
                    navigate(context, ChangePasswordScreen());
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
            ),
            SizedBox(height: 70.h),
            Center(
              child: Consumer<UserProfileViewModel>(
                builder: (context, viewModel, child) {
                  return Container(
                    width: 280.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: viewModel.userEditProfileLoading
                          ? null // Disable button if loading
                          : () {
                              viewModel.fetchEditProfileResponse(
                                  context,
                                  _nameController.text.toString(),
                                  _usernameController.text.toString(),
                                  _emailController.text.toString(),
                                  viewModel.base64Image.toString(), () {
                                _nameController.clear();
                                _usernameController.clear();
                                _emailController.clear();
                                _passwordController.clear();
                                viewModel.clearProfileImage();
                              });
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5271FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: viewModel.userEditProfileLoading
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
