import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class AllTaskTile extends StatelessWidget {
  const AllTaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: EdgeInsets.only(top: 18.h, left: 42.w, right: 19.w, bottom: 15.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Price and Category Column
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Content(
                        data: "€ 1234.56",
                        size: 16.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                      SizedBox(width: 8),
                      Content(
                        data: "[Category]",
                        size: 16.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Content(
                        data: "Expires",
                        size: 16.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                      SizedBox(width: 8),
                      Content(
                        data: "MMMEd",
                        size: 16.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                    ],
                  ),
                ],
              ),
              // Status Order Button
              Container(
                margin: EdgeInsets.only(bottom: 20.h),
                width: 120.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xff5271FF).withOpacity(0.8),
                ),
                child: Center(
                    child: Content(
                  data: "status order",
                  size: 18.h,
                  color: Colors.white,
                  weight: FontWeight.w300,
                )),
              ),
            ],
          ),
          SizedBox(height: 8),
          Divider(
            thickness: 1,
            color: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
