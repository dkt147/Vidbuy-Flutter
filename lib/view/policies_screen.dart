import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/profile_tile.dart';
import 'package:vidbuy_app/view/contact_information_page.dart';
import 'package:vidbuy_app/view/contact_us_screen.dart';
import 'package:vidbuy_app/view/cookies_policy_screen.dart';
import 'package:vidbuy_app/view/platform_fees_page.dart';
import 'package:vidbuy_app/view/privacy_policy_screen.dart';
import 'package:vidbuy_app/view/terms_and_conditions_screen.dart';

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
          GestureDetector(
            onTap: () {
              navigate(context, TermsAndConditionsPage());
            },
            child: ProfileTile(
                height: 25.h,
                image: "assets/Icon/lock.png",
                text: "Terms and Conditions"),
          ),
          SizedBox(
            height: 22.h,
          ),
          GestureDetector(
            onTap: () {
              navigate(context, CookiesPolicyScreen());
            },
            child: ProfileTile(
                height: 25.h,
                image: "assets/Icon/lock.png",
                text: "Cookies Policy"),
          ),
          SizedBox(
            height: 22.h,
          ),
          GestureDetector(
            onTap: () {
              navigate(context, PrivacyPolicyPage());
            },
            child: ProfileTile(
                height: 25.h,
                image: "assets/Icon/lock.png",
                text: "Privacy Policy"),
          ),
          SizedBox(
            height: 22.h,
          ),
          GestureDetector(
            onTap: () {
              navigate(context, PlatformFeesPage());
            },
            child: ProfileTile(
                height: 25.h,
                image: "assets/Icon/lock.png",
                text: "Platfrom fee"),
          ),
          SizedBox(
            height: 22.h,
          ),
          GestureDetector(
            onTap: () {
              navigate(context, ContactInformationPage());
            },
            child: ProfileTile(
                height: 25.h,
                image: "assets/Icon/lock.png",
                text: "Contact Inforamation"),
          ),
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
