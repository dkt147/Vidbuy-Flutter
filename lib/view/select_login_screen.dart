import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/resources/componenets/header_widget.dart';
import 'package:vidbuy_app/view/create_influencer_account_screen.dart';
import 'package:vidbuy_app/view/create_user_account_screen.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class SelectLoginScreen extends StatelessWidget {
  const SelectLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HeaderWidget(bottomMargin: 8, )
          // SizedBox(
          //   height: 108.h,
          // ),
          // Icon(Icons.arrow_back_ios)
          Container(
              margin: EdgeInsets.only(top: 55.h, left: 21.w),
              child: Image.asset(
                "assets/Icon/backarrow.png",
                height: 25.h,
              )),

          Center(
            child: Container(
              margin: EdgeInsets.only(top: 108.h),
              child: Text(
                "Enjoy Vidbuy",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 44.h,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 161.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 66.w),
            child: Text(
              "Create account as",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.h,
                  fontFamily: "lato",
                  color: Colors.black),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 18.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CreateUserAccountScreen()));
                  },
                  child: Container(
                      height: 50.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Color(0xff5271FF),
                      ),
                      // padding: EdgeInsets.all(20),
                      // margin: EdgeInsets.only(left: 20, top: 30),
                      // decoration:
                      //     BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "User Account",
                          style: TextStyle(
                              fontSize: 18.h,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      )),
                ),
                SizedBox(
                  height: 17.h,
                ),
                GestureDetector(
                  onTap: () {
                    navigate(context, CreateInfluencerAccountScreen());
                  },
                  child: Container(
                      height: 50.h,
                      width: 280.w,
                      decoration: BoxDecoration(
                          // color: Colors.blue,

                          borderRadius: BorderRadius.circular(30.r),
                          border: Border.all(
                              color: Colors.black,
                              width: 2.0,
                              style: BorderStyle.solid,
                              strokeAlign: BorderSide.strokeAlignCenter)),
                      // ),
                      // padding: EdgeInsets.all(20),
                      // margin: EdgeInsets.only(left: 20, top: 30),
                      // decoration:
                      //     BoxDecoration(borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "Influencer Account",
                          style: TextStyle(
                              fontSize: 18.h,
                              fontFamily: "lato",
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
