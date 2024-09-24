import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() => _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool pushNotifications = true;
  bool emailNotifications = true;
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
                  data: "Notifactions",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 21.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: "Notifications",
                  size: 30.h,
                  weight: FontWeight.w300,
                ),
                Content(
                  data: "Choose what notifcations you want to recieve ",
                  size: 16.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60.h,
          ),

          SwitchListTile(
            // activeColor: Colors.blue,
            activeColor: Color(0xff5271FF),
            contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
            title: Text(
              'Push Notifications',
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w600,
                fontFamily: "Nunito",
              ),
            ),
            subtitle: Text(
              'Receive Push notifications from our application on a semi-regular basis.',
              style: TextStyle(
                  fontSize: 14.h,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400),
            ),
            value: pushNotifications,
            onChanged: (bool value) {
              setState(() {
                pushNotifications = value;
              });
            },
          ),
          SizedBox(
            height: 39.h,
          ),
          SwitchListTile(
            // activeColor: Colors.blue,
            activeColor: Color(0xff5271FF),
            contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
            title: Text(
              'Email Notifications',
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w600,
                fontFamily: "Nunito",
              ),
            ),
            subtitle: Text(
              'Receive email notifications from our marketing team about new features.',
              style: TextStyle(
                  fontSize: 14.h,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400),
            ),
            value: emailNotifications,
            onChanged: (bool value) {
              setState(() {
                emailNotifications = value;
              });
            },
          ),
          // Content(
          //       data: "Push Notifications",
          //       size: 18.h,
          //       family: "Nunito",
          //       weight: FontWeight.w600,
          //     ),
          //     Row(
          //       children: [
          //         Content(
          //                       data: "Receive Push notifications from our\napplication on a semi regular basis. ",
          //                       size: 16.h,
          //                       weight: FontWeight.w300,
          //                       family: "Lato",
          //                     ),
          //       ],
          //     ),
          SizedBox(
            height: 221.h,
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
                  //   navigate(context, NavBarScreen());
                  // }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
                  "Save",
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
