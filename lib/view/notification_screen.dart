import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/notification_tile.dart';
import 'package:vidbuy_app/view/check_email_screen.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
                  data: "Notifications",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 22.h,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                  NotificationTile(
                      title: "Headaer", message: "message", date: "date"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
