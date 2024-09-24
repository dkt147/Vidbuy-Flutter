import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/contentfield_password.dart';
import 'package:vidbuy_app/view/delete_confirm_account_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';

class DeleteAccountScreen extends StatelessWidget {
   DeleteAccountScreen({super.key});
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/Icon/backarrow.png",
                height: 25.h,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 21.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: "Delete account",
                  size: 30.h,
                  weight: FontWeight.w300,
                ),
                Content(
                  data:
                      "To confirm your identity, please insert your password. ",
                  size: 16.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
                SizedBox(
                  height: 40.h,
                ),
                ContentFieldPassword(
                    label: "Your Password",
                    hint: "Password",
                    index: 1,
                    // textInput: TextInputType.text,
                    controller: _passwordController,
                    inputFormat: <TextInputFormatter>[
                      FilteringTextInputFormatter.singleLineFormatter,
                    ]),
              ],
            ),
          ),
          SizedBox(
            height: 31.h,
          ),
          Center(
            child: Container(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  // if (_emailController.text.isEmpty) {
                  //   snackBar("Enter Valid Email", context);
                  // } else if (_passwordController.text.isEmpty) {
                  //   snackBar(
                  //     "Enter Password",
                  //     context,
                  //   );
                  // } else if (_passwordController.text.length < 8) {
                  //   snackBar(
                  //       "Enter Minium 8 Characters of Password", context);
                  // } else {
                  //   // Navigator.push(
                  //   //     context,
                  //   //     MaterialPageRoute(
                  //   //         builder: (_) => TabBarWidget()));
                  navigate(context, DeleteConfirmAccountScreen());
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 16.h, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
