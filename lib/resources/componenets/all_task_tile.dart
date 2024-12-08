import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class AllTaskTile extends StatelessWidget {
  final String price;
  final String category;
  final String date;
  final String status;
  final String orderId;

  AllTaskTile(
      {required this.price,
      required this.category,
      required this.date,
      required this.orderId,
      required this.status,
      super.key});

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
                        data: "€${price}",
                        size: 16.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                      SizedBox(width: 8),
                      Content(
                        data: category,
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
                        data: "Expires:",
                        size: 16.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                      SizedBox(width: 8),
                      Content(
                        data: Utils.dateFormat1(date.toString()),
                        size: 16.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                    ],
                  ),
                  // SizedBox(height: 8),
                  // Row(
                  //   children: [
                  //     Content(
                  //       data: "OrderID:",
                  //       size: 11.h,
                  //       weight: FontWeight.w500,
                  //       family: "Lato",
                  //     ),
                  //     SizedBox(width: 8),
                  //     Content(
                  //       data: orderId,
                  //       size: 11.h,
                  //       weight: FontWeight.w500,
                  //       family: "Lato",
                  //     ),
                  //   ],
                  // ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Content(
                        data: "Status:",
                        size: 11.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                      SizedBox(width: 8),
                      Content(
                        data: status,
                        size: 11.h,
                        weight: FontWeight.w500,
                        family: "Lato",
                      ),
                    ],
                  ),
                ],
              ),
              // Status Order Button
              Container(
                // margin: EdgeInsets.only(bottom: 20.h),
                width: 120.w,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xff5271FF).withOpacity(0.8),
                ),
                child: Center(
                    child: Content(
                  data: "Task Details",
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
