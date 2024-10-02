import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/resources/componenets/order_tile.dart';
import 'package:vidbuy_app/view/active_history_admin_screen.dart';
import 'package:vidbuy_app/view/task_detail_admin_scree.dart';
import 'package:vidbuy_app/view/video_screen_admin.dart';

class CancelRequestScreen extends StatelessWidget {
  const CancelRequestScreen({super.key});

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
                  data: "Cancel Request",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          // Container(
          //   width: 375.w,
          //   height: 75.h,
          //   child: ,
          // )
          SizedBox(
            height: 23.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 28.w, right: 37.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Content(
                      data: "Canceled",
                      size: 16.h,
                      weight: FontWeight.w500,
                      family: "Lato",
                    ),
                  ],
                ),
                Content(
                  data: "Complete",
                  size: 16.h,
                  weight: FontWeight.w500,
                  family: "Lato",
                ),
                Content(
                  data: "Refund",
                  size: 16.h,
                  weight: FontWeight.w500,
                  family: "Lato",
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: GestureDetector(
                onTap: () {
                  navigate(
                      context,
                      MainTabbarAdminWidget(screens: [
                        VideoScreenAdmin(),
                        TaskDetailAdminScreen(),
                        ActiveHistoryAdminScreen(),
                      ], tabTitles: [
                        "Video",
                        "Orders Details",
                        "Active History",
                      ]));
                },
                child: Column(
                  children: [
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                    OrderTile(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
