import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/home_screen.dart';

import '../Function/navigate.dart';

class PaymentConfirmScreen extends StatelessWidget {
  const PaymentConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 202.h,
          ),
          Image.asset("assets/Vector/success.png", height: 110.h, width: 110.w,),
            SizedBox(
            height: 46.h,
          ),
          Content(data: "Payment Confirmed !", size: 30.h, weight: FontWeight.w500, family: "Nunito",),
          SizedBox(
            height: 13.h,
          ),
          Content(data: "Congratulations, your payment has been confirmed.", size: 14.h, weight: FontWeight.w400, family: "Nunito",),
          SizedBox(
              height: 245.h,
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
                    navigate(context, HomeScreen());
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 16.h, color: Colors.white, fontFamily: "Lato"),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}