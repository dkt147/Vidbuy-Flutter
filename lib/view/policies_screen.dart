import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/profile_tile.dart';
import 'package:vidbuy_app/view/contact_us_screen.dart';

class PoliciesScreen extends StatelessWidget {
  const PoliciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/Icon/backarrow.png",
                    height: 25.h,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Content(
                  data: "Policies",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32.h,
          ),
          ProfileTile(
              image: "assets/Icon/layouticon.png",
              text: "Terms and Conditions"),
          SizedBox(
            height: 22.h,
          ),
          ProfileTile(
              image: "assets/Icon/layouticon.png", text: "Cookies Policy"),
          SizedBox(
            height: 22.h,
          ),
          ProfileTile(
              image: "assets/Icon/layouticon.png", text: "Privacy Policy"),
          SizedBox(
            height: 22.h,
          ),
          ProfileTile(
              image: "assets/Icon/layouticon.png", text: "Cookies Policy"),
          SizedBox(
            height: 22.h,
          ),
          ProfileTile(
              image: "assets/Icon/layouticon.png", text: "Platfrom fee"),
          SizedBox(
            height: 22.h,
          ),
          ProfileTile(
              image: "assets/Icon/layouticon.png",
              text: "Contact Inforamation"),
          SizedBox(
            height: 40.h,
          ),
          GestureDetector(
            onTap: () {
              navigate(context, ContactUsScreen());
            },
            child: Content(
              data: "Want to contact support? Contact us",
              size: 14.h,
              weight: FontWeight.w600,
              family: "Nunito",
            ),
          ),
        ],
      ),
    );
  }
}
