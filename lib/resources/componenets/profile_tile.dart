import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class ProfileTile extends StatelessWidget {
  String image;
  String text;
  ProfileTile({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
           width: 340.w,
      height: 55.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          // boxShadow: bo
          color: Color(0xffFFFFFF)),
      child: ListTile(
        leading: Image.asset(
              image,
              height: 18.h,
            ),
        title: Content(
              data: text,
              size: 20.h,
              family: "Lato",
              weight: FontWeight.w600,
            ),
        trailing: Image.asset(
                  "assets/Icon/forwordicon.png",
                  height: 30.h,
                ),
      ),
    );

    // Container(
    //   width: 340.w,
    //   height: 55.h,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.circular(10.r),
    //       // boxShadow: bo
    //       color: Color(0xffFFFFFF)),
    //   child: Row(
    //     // mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     //             mainAxisAlignment: MainAxisAlignment.end,
    //         // crossAxisAlignment: CrossAxisAlignment.end,
    //         // crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       SizedBox(
    //         width: 11.w,
    //       ),
    //       Image.asset(
    //         image,
    //         height: 18.h,
    //       ),
    //       SizedBox(
    //         width: 11.w,
    //       ),
    //       Content(
    //         data: text,
    //         size: 20.h,
    //         family: "Lato",
    //         weight: FontWeight.w600,
    //       ),
    //       // SizedBox(
    //       //   width: 150.w,
    //       // ),
    //       Row(
    //         // mainAxisAlignment: MainAxisAlignment.end,
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         // verticalDirection:VerticalDirection.up ,
    //         children: [
    //           Image.asset(
    //             "assets/Icon/forwordicon.png",
    //             height: 30.h,
    //           ),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
  }
}
