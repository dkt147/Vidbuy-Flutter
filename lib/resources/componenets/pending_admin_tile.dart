import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class PendingAdminTile extends StatelessWidget {
  const PendingAdminTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(
        //   height: 10.h,
        // ),
        Container(
          margin: EdgeInsets.only(left: 21.w, right: 21.w, top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Content(
                    data: "Influencers Name",
                    size: 16.h,
                    weight: FontWeight.w500,
                    family: "Lato",
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Country name",
                        size: 8.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                      SizedBox(
                        width: 23.w,
                      ),
                      Content(
                        data: "Total Reviews",
                        size: 8.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: 105.w,
                height: 35.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    border: Border.all(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Content(
                      data: "Approve",
                      size: 15.h,
                      family: "Lato",
                      weight: FontWeight.w700,
                    ),
                    Image.asset("assets/Icon/polygon.png"),
                  ],
                ),
              )
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
        // Row(
        //   children: [
        //     Content(data: "Influencers Name", size: 16.h, weight: FontWeight.w500, family: "Lato",),
        //     Content(data: "Influencers Name", size: 16.h, weight: FontWeight.w500, family: "Lato",)
        //   ],
        // ),
      ],
    );
  }
}
