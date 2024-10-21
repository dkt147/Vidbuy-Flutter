import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class CancelTile extends StatelessWidget {
  const CancelTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 18.h,
        ),
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Content(
              data: "Influencers Name",
              size: 16.h,
              weight: FontWeight.w500,
              family: "Lato",
            ),
            SizedBox(
              width: 88.w,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Content(
                  data: "Cancel",
                  size: 14.h,
                  family: "Lato",
                  weight: FontWeight.w500,
                ),
                SizedBox(
                  width: 15.w,
                ),
                Content(
                  data: "Revert",
                  size: 14.h,
                  family: "Lato",
                  weight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Divider(
          color: Colors.black,
          endIndent: 1.w,
          indent: 1.w,
        ),
      ],
    );
  }
}
