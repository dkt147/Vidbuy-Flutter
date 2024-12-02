import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class CancelTile extends StatelessWidget {
  String influencerName;
  VoidCallback func;
  CancelTile({super.key, required this.influencerName, required this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Content(
                data: influencerName,
                size: 18.h,
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
                    data: "Canceled",
                    size: 16.h,
                    family: "Lato",
                    weight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: func,
                    child: Content(
                      data: "Revert",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
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
