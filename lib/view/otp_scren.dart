import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class OtpScren extends StatelessWidget {
  const OtpScren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 108.h, left: 21.w),
            child: Column(
              children: [
                Text(
                  "Check your inbox",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 30.h,
                      color: Colors.black),
                ),
                Text(
                  "We have sent verification code by email",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.h,
                      fontFamily: "Nunito",
                      color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 78.h,
          ),
          Center(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Pinput(
                  length: 4,
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 55.h,
                    textStyle: TextStyle(
                        fontSize: 20.h,
                        // color: Color.fromRGBO(30, 60, 87, 1),
                        color: Colors.black,
                        // color: Colors.amber,
                        fontWeight: FontWeight.w600),
                    decoration: BoxDecoration(
                        // border:
                        // Border.all(color: Colors.black.withOpacity(0.8)),
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xffD9D9D9)),
                  ),
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                ),
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  "Send Again",
                  style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 12.h,
                      // fontFamily: "Nunito",
                      color: Colors.black),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  width: 280.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle account creation
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => OtpScren()),
                      // );navigat
                      navigate(context, LoginScreen());
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
                      "Create account",
                      style: TextStyle(fontSize: 16.h, color: Colors.white),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     // Navigator.push(context,
                //     //     MaterialPageRoute(builder: (_) => LoginScreen()));
                //   },
                //   child: Container(
                //       height: 50.h,
                //       width: 280.w,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30.r),
                //         color: Colors.blue,
                //       ),
                //       // padding: EdgeInsets.all(20),
                //       // margin: EdgeInsets.only(left: 20, top: 30),
                //       // decoration:
                //       //     BoxDecoration(borderRadius: BorderRadius.circular(15)),
                //       child: Center(
                //         child: Text(
                //           "User Account",
                //           style: TextStyle(
                //               fontSize: 18.h,
                //               fontFamily: "lato",
                //               fontWeight: FontWeight.w700,
                //               color: Colors.white),
                //         ),
                //       )),
                // ),
                // SizedBox(
                //   height: 17.h,
                // ),
                // Container(
                //     height: 50.h,
                //     width: 280.w,
                //     decoration: BoxDecoration(
                //         // color: Colors.blue,

                //         borderRadius: BorderRadius.circular(30.r),
                //         border: Border.all(
                //             color: Colors.black,
                //             width: 2.0,
                //             style: BorderStyle.solid,
                //             strokeAlign: BorderSide.strokeAlignCenter)),
                //     // ),
                //     // padding: EdgeInsets.all(20),
                //     // margin: EdgeInsets.only(left: 20, top: 30),
                //     // decoration:
                //     //     BoxDecoration(borderRadius: BorderRadius.circular(15)),
                //     child: Center(
                //       child: Text(
                //         "Influencer Account",
                //         style: TextStyle(
                //             fontSize: 18.h,
                //             fontFamily: "lato",
                //             fontWeight: FontWeight.w700,
                //             color: Colors.black),
                //       ),
                //     )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
