import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/create_user_account_screen.dart';
import 'package:vidbuy_app/view/forgot_password_screen.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Container(
//               margin: EdgeInsets.only(top: 100.h, left: 21.w),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Content(data: "Welcome Back,", size: 30.h,weight: FontWeight.w300,),
//                   Content(data: "We are happy to see you here again. Enter your email address and\npassword", size: 10.h,weight: FontWeight.w300,),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 52.h), // To give some top spacing
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          // SizedBox(height: 20),
          // Content(data: "Welcome Back,", size: 30.h,weight: FontWeight.w300,),
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
              )),
          // SizedBox(height: 8),

          SizedBox(height: 65.h),
          Container(
              margin: EdgeInsets.only(left: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "Your Email",
                    size: 16.h,
                    family: "Lato",
                    weight: FontWeight.w500,
                  ),
                  Container(
                    height: 50.h,
                    width: 335.w,
                    child: TextField(
                      decoration: InputDecoration(
                        // labelText: "Your email",
                        hintText: "Enter your email address",
                        hintStyle: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16.h,
                            color: Color(0xff908B8B)),
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Content(
                    data: "Your Password",
                    size: 16.h,
                    family: "Lato",
                    weight: FontWeight.w500,
                  ),
                  Container(
                    height: 50.h,
                    width: 335.w,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        // labelText: "Your password",
                        hintText: "********",
                        hintStyle: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 16.h,
                            color: Color(0xff908B8B)),

                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.visibility),
                          onPressed: () {},
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffFFFFFF00)),
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
          // TextField(
          //   decoration: InputDecoration(
          //     labelText: "Your email",
          //     hintText: "Enter your email address",
          //     prefixIcon: Icon(Icons.email),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(30.r),
          //     ),
          //   ),
          // ),
          // SizedBox(height: 20.h),
          // TextField(
          //   obscureText: true,
          //   decoration: InputDecoration(
          //     labelText: "Your password",
          //     hintText: "********",
          //     prefixIcon: Icon(Icons.lock),
          //     suffixIcon: IconButton(
          //       icon: Icon(Icons.visibility),
          //       onPressed: () {},
          //     ),
          //     border: OutlineInputBorder(
          //       borderSide: BorderSide(color: Color(0xffFFFFFF00)),
          //       borderRadius: BorderRadius.circular(30.r),
          //     ),
          //   ),
          // ),
          SizedBox(height: 30.h),
          Center(
            child: Container(
              width: 280.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  // padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 15.w),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ForgotPasswordScreen()));
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
                // Navigator.push(context, route)
                // navigate(context, CreateUserAccountScreen);
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
    );
  }
}
