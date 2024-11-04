// class CreateUserAccountScreen extends StatelessWidget {
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/content_field.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/services/api.service.dart';
import 'package:vidbuy_app/services/network.service.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';
import 'package:vidbuy_app/viewmodel/influencer_view_model/influencer_signup_view_model.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_signup_view_model.dart';

class CreateUserAccountScreen extends StatefulWidget {
  const CreateUserAccountScreen({super.key});

  @override
  State<CreateUserAccountScreen> createState() =>
      _CreateUserAccountScreenState();
}

class _CreateUserAccountScreenState extends State<CreateUserAccountScreen> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    // _networkService = NetworkService(api: ApiService());
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

  // // Pick image for profile photo
  // Future<void> _pickImage() async {
  //   try {
  //     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  //     if (image != null) {
  //       setState(() {
  //         _image = File(image.path);
  //       });
  //     }
  //   } catch (e) {
  //     print('Error picking image: $e');
  //   }
  // }

  // // Pick media (image or video)
  // Future<void> _pickMedia() async {
  //   final XFile? pickedFile = await _picker.pickImage(
  //     source: ImageSource.gallery,
  //     imageQuality: 100,
  //   );

  //   if (pickedFile == null) {
  //     final XFile? pickedVideo =
  //         await _picker.pickVideo(source: ImageSource.gallery);
  //     if (pickedVideo != null) {
  //       setState(() {
  //         _media = File(pickedVideo.path);
  //         _isImage = false;
  //       });
  //     }
  //   } else {
  //     setState(() {
  //       _media = File(pickedFile.path);
  //       _isImage = true;
  //     });
  //   }
  // }

  // // API integration for registration
  // Future<void> _registerUser() async {
  //   if (_nameController.text.isEmpty) {
  //     snackBar("Please enter your name", context);
  //   } else if (_usernameController.text.isEmpty) {
  //     snackBar("Please enter a username", context);
  //   } else if (_emailController.text.isEmpty ||
  //       !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
  //           .hasMatch(_emailController.text)) {
  //     snackBar("Please enter a valid email", context);
  //   } else if (_passwordController.text.isEmpty) {
  //     snackBar("Please enter a password", context);
  //   } else if (_passwordController.text.length < 8) {
  //     snackBar("Password should be at least 8 characters", context);
  //   } else {
  //     setState(() {
  //       _isLoading = true;
  //     });

  //     Map<String, dynamic> registerData = {
  //       'name': _nameController.text,
  //       'username': _usernameController.text,
  //       'email': _emailController.text,
  //       'password': _passwordController.text,
  //       'role_id': "2",
  //       // Add other fields as required
  //     };

  //     try {
  //       var response = await _networkService.register(registerData);
  //       if (response['bool'] == true) {
  //         // Save user ID in local storage
  //         final prefs = await SharedPreferences.getInstance();
  //         // Extract user ID from response
  //         int user = response['user'];
  //         await prefs.setString('user', user.toString());
  //         int userId = response['user']['id'];
  //         await prefs.setString('user_id', userId.toString());

  //         // Navigator.pushReplacement(
  //         //   context,
  //         // MaterialPageRoute(builder: (context) => OtpScren()),
  //         // );
  //       } else {
  //         snackBar(response['message'] ?? 'Registration failed', context);
  //       }
  //     } catch (e) {
  //       snackBar('Error: $e', context);
  //     } finally {
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

  bool pushNotifications = true;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<UserSignupViewModel>(context, listen: true);
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
                    data: "Create user account",
                    size: 30.h,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(height: 5.h),
                  Content(
                    data:
                        "Create your account to buy, create orders and share videos with\nyour friends",
                    size: 10.h,
                    weight: FontWeight.w400,
                    family: "Nunito",
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
                    child: Consumer<UserSignupViewModel>(
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
              margin: EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ContentField(
                    label: "Your Name",
                    hint: "Enter Your Name",
                    colorr: Colors.transparent,
                    prefixIcon:
                        Image.asset("assets/Icon/person.png", height: 25.h),
                    controller: _nameController,
                    inputFormat: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "Your username",
                    hint: "Enter Your Username",
                    colorr: Colors.transparent,
                    prefixIcon:
                        Image.asset("assets/Icon/person.png", height: 25.h),
                    controller: _usernameController,
                    inputFormat: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 10.h),
                  ContentField(
                    label: "Your email",
                    hint: "Enter Your Email",
                    colorr: Colors.transparent,
                    prefixIcon:
                        Image.asset("assets/Icon/email.png", height: 25.h),
                    controller: _emailController,
                    inputFormat: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.h),
                  ContentFieldPassword(
                    label: "Your Password",
                    hint: "Password",
                    index: 0,
                    controller: _passwordController,
                    inputFormat: [
                      FilteringTextInputFormatter.singleLineFormatter
                    ],
                    keyboardType: TextInputType.visiblePassword,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Center(
              child: Consumer<UserSignupViewModel>(
                builder: (context, viewModel, child) {
                  return Container(
                    width: 280.w,
                    height: 50.h,
                    child: ElevatedButton(
                      onPressed: viewModel.loading
                          ? null // Disable button if loading
                          : () {
                              viewModel.fetchSignupData(context,
                                  name: _nameController.text.toString(),
                                  username: _usernameController.text.toString(),
                                  email: _emailController.text.toString(),
                                  password: _passwordController.text.toString(),
                                  base64Image:
                                      viewModel.base64Image.toString());
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5271FF),
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
            ),
            SizedBox(height: 20.h),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Content(
                  data: "Already have an account? Login",
                  size: 12.h,
                  weight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//   Widget _buildAvatar(File? file, {required bool isImage}) {
//     return Container(
//       height: 89.h,
//       width: 87.w,
//       child: CircleAvatar(
//         radius: 40.r,
//         backgroundColor: Colors.grey[200],
//         backgroundImage: file != null && isImage ? FileImage(file) : null,
//         child: file == null
//             ? Icon(Icons.camera_alt, size: 26, color: Colors.grey)
//             : !isImage
//                 ? Icon(Icons.video_library, size: 26, color: Colors.grey)
//                 : null,
//       ),
//     );
//   }

//   Widget _buildTextFields() {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 21.w),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ContentField(
//             label: "Your Name",
//             hint: "Enter Your Name",
//             colorr: Colors.transparent,
//             prefixIcon: Image.asset("assets/Icon/person.png", height: 25.h),
//             controller: _nameController,
//             inputFormat: [FilteringTextInputFormatter.singleLineFormatter],
//             keyboardType: TextInputType.name,
//           ),
//           SizedBox(height: 10.h),
//           ContentField(
//             label: "Your username",
//             hint: "Enter Your Username",
//             colorr: Colors.transparent,
//             prefixIcon: Image.asset("assets/Icon/person.png", height: 25.h),
//             controller: _usernameController,
//             inputFormat: [FilteringTextInputFormatter.singleLineFormatter],
//             keyboardType: TextInputType.text,
//           ),
//           SizedBox(height: 10.h),
//           ContentField(
//             label: "Your email",
//             hint: "Enter Your Email",
//             colorr: Colors.transparent,
//             prefixIcon: Image.asset("assets/Icon/email.png", height: 25.h),
//             controller: _emailController,
//             inputFormat: [FilteringTextInputFormatter.singleLineFormatter],
//             keyboardType: TextInputType.emailAddress,
//           ),
//           SizedBox(height: 10.h),
//           ContentFieldPassword(
//             label: "Your Password",
//             hint: "Password",
//             index: 0,
//             controller: _passwordController,
//             inputFormat: [FilteringTextInputFormatter.singleLineFormatter],
//             keyboardType: TextInputType.visiblePassword,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSubmitButton() {
//     return Center(
//       child: Container(
//         width: 280.w,
//         height: 50.h,
//         decoration: BoxDecoration(
//           color: Colors.blue,
//           borderRadius: BorderRadius.circular(12.r),
//         ),
//         child: TextButton(
//           onPressed: _isLoading ? null : _registerUser,
//           child: _isLoading
//               ? CircularProgressIndicator(color: Colors.white)
//               : Text(
//                   "Submit",
//                   style: TextStyle(color: Colors.white, fontSize: 16.sp),
//                 ),
//         ),
//       ),
//     );
//   }

//   Widget _buildLoginRedirect() {
//     return Center(
//       child: GestureDetector(
//         onTap: () {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => LoginScreen()),
//           );
//         },
//         child: Content(
//           data: "Already have an account? Login",
//           size: 12.h,
//           weight: FontWeight.w400,
//         ),
//       ),
//     );
//   }
// }
