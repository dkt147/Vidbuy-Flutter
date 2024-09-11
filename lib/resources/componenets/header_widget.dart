import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HeaderWidget extends StatelessWidget {
  final double bottomMargin;
  final String? title;
  // final bool notification;
  final Color? colorr;
  // final stri
  const HeaderWidget({super.key, required this.bottomMargin,  this.title,  this.colorr});

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(top: 6, bottom: bottomMargin),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context,);
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
            // decoration: BoxDecoration(
            //   // color: AppColor.greyTextColor,
            //   borderRadius: BorderRadius.circular(12.r),
            // ),
            child: Icon(Icons.arrow_back)
          ),
        ),
        // Image.asset(
        //     logo,
        //     height: 39.53.h,
        //     width: 49.66.w,
        //     color: notification ? null : Colors.transparent,
        //   ),
        
        Container(
          padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 8.sp),
          // decoration: BoxDecoration(
          //     color: notification ? greyLightBg : null,
          //     borderRadius: BorderRadius.circular(12)),
          child: Text(
          title!,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        )
      ],
    ),
  );
  }
}