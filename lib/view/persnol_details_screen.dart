import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class PersnolDetailsScreen extends StatefulWidget {
  const PersnolDetailsScreen({super.key});

  @override
  State<PersnolDetailsScreen> createState() => _PersnolDetailsScreenState();
}

class _PersnolDetailsScreenState extends State<PersnolDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Container(
            width: 375.w,
            height: 31.h,
            color: Color(0xffD9D9D9).withOpacity(0.3),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            child: Content(
              data: "Persnol Detail",
              size: 12.h,
              family: "Nunito",
              weight: FontWeight.w700,
            ),
            
          ),
          Container(
              margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
            height: 18.h,
          ),
          Container(
            width: 375.w,
            height: 31.h,
            color: Color(0xffD9D9D9).withOpacity(0.3),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            child: Content(
              data: "Persnol Detail",
              size: 12.h,
              family: "Nunito",
              weight: FontWeight.w700,
            ),
            
          ),
          Container(
              margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 26.h,
            ),
                        Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
              width: 156.w,
              height: 40.h,
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
                    // navigate(context, FeedbackScreen());
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff908B8B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Reject",
                  style: TextStyle(fontSize: 16.h, color: Colors.white),
                ),
              ),
            ),
                SizedBox(
              width: 8.h,
            ),
                Container(
                  width: 156.w,
                              height: 40.h,
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
                        // navigate(context, OrderCancelScreen());
                      // }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: Text(
                      "Approve",
                      style: TextStyle(fontSize: 16.h, color: Colors.white),
                    ),
                  ),
                ),

              ],
            ),
        ],
      ),
    );
  }
}
