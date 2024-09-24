import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class NotificationTile extends StatelessWidget {
  String title;
  String message;
  String date;
   NotificationTile({super.key, required this.title, required this.message, required this.date});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 30.w, right: 32.w),
          child: ListTile(
            // leading: Content(data: "data", size: 14.h),
            title: Content(
              data: title,
              size: 16.h,
              family: "Nunito",
              weight: FontWeight.w400,
            ),
            subtitle: Content(
              data: message,
              size: 14.h,
              family: "Nunito",
              weight: FontWeight.w300,
            ),
            trailing: Content(
              data: date,
              size: 14.h,
              family: "Nunito",
              weight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Divider(
          color: Colors.black,
          thickness: 0.9,
          endIndent: 30.w,
          indent: 30.w,
        ),
      ],
    );
  }
}
