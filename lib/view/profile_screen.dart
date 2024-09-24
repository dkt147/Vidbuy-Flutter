import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/profile_tile.dart';
import 'package:vidbuy_app/view/contact_us_screen.dart';
import 'package:vidbuy_app/view/delete_account_screen.dart';
import 'package:vidbuy_app/view/language_screen.dart';
import 'package:vidbuy_app/view/notification_setting_screen.dart';
import 'package:vidbuy_app/view/policies_screen.dart';
import 'package:vidbuy_app/view/user_edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 42.h,
          ),
          Container(
            width: 375.w,
            height: 143.h,
            color: Color(0xffFFFFFF),
            child: Row(
              children: [
                Container(
                  width: 98.w,
                  height: 99.h,
                  margin: EdgeInsets.only(left: 21.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset("assets/Vector/girl.png"),
                ),
                SizedBox(
                  width: 17.w,
                ),
                Content(
                  data: "Benji hovl\nBenji@gmail.com",
                  size: 18.h,
                  family: "Lato",
                  weight: FontWeight.w700,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 22.h,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 260.w),
                      child: Content(
                        data: "Account",
                        size: 18.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      )),
                  ProfileTile(
                      image: "assets/Icon/layouticon.png", text: "Orders"),
                  SizedBox(
                    height: 17.h,
                  ),
                  ProfileTile(
                      image: "assets/Icon/layouticon.png", text: "Donations"),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, NotificationSettingScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: "Notification Setting"),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, UserEditProfileScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: "Edit Profile"),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 260.w),
                      child: Content(
                        data: "General",
                        size: 18.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 11.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        navigate(context, LanguageScreen());
                      },
                      child: ProfileTile(
                          image: "assets/Icon/layouticon.png",
                          text: "Language")),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, ContactUsScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png", text: "Support"),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, PoliciesScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png", text: "Policies"),
                  ),
                  // ProfileTile(image: "assets/Icon/layouticon.png", text: "Logout"),
                  SizedBox(
                    height: 17.h,
                  ),
                  ProfileTile(
                      image: "assets/Icon/layouticon.png", text: "Logout"),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, DeleteAccountScreen());
                    },
                    child: Center(
                        child: Content(
                            data: "Do you want to delete the account? Delete",
                            size: 12.h,
                            weight: FontWeight.w300)),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
