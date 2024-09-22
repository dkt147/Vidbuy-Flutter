import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  data: "Language",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.w),
            child: Content(
              data: "English",
              size: 16.h,
              weight: FontWeight.w400,
              family: "Nunito",
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.w),
            child: Content(
              data: "English",
              size: 16.h,
              weight: FontWeight.w400,
              family: "Nunito",
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.w),
            child: Content(
              data: "English",
              size: 16.h,
              weight: FontWeight.w400,
              family: "Nunito",
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.w),
            child: Content(
              data: "English",
              size: 16.h,
              weight: FontWeight.w400,
              family: "Nunito",
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.w),
            child: Content(
              data: "English",
              size: 16.h,
              weight: FontWeight.w400,
              family: "Nunito",
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.w),
            child: Content(
              data: "English",
              size: 16.h,
              weight: FontWeight.w400,
              family: "Nunito",
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 34.w),
            child: Content(
              data: "English",
              size: 16.h,
              weight: FontWeight.w400,
              family: "Nunito",
            ),
          ),
          Divider(
            color: Colors.black,
            endIndent: 30.w,
            indent: 30.w,
          ),
        ],
      ),
    );
  }
}
