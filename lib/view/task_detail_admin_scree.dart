import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class TaskDetailAdminScreen extends StatefulWidget {
  const TaskDetailAdminScreen({super.key});

  @override
  State<TaskDetailAdminScreen> createState() => _TaskDetailAdminScreenState();
}

class _TaskDetailAdminScreenState extends State<TaskDetailAdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Created at: Wed, 5 Sep",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data: "Order ID: 5ts638393",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Expires: Wed, 12 Sep",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                      Content(
                        data: "Status: [Status_order]",
                        size: 14.h,
                        family: "Nunito",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 47.h,
            ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Video details",
                size: 12.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Content(
                    data: "Birthday Video",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Row(
                    children: [
                      Content(
                        data: "From",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Content(
                        data: "Kilan bella ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Content(
                        data: "To",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Content(
                        data: "Chaele dento",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Content(
                        data: "Delivery day",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Content(
                        data: "7 day ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Content(
                        data: "Description",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      SizedBox(
                        width: 10.w,
                        height: 10.h,
                      ),
                      Content(
                        data:
                            "This video you will make for my friend on\nhis 29th birthday ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 41.h,
            ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Price Detail",
                size: 12.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Content(
                    data: "Video Price",
                    size: 14.h,
                    family: "Lato",
                    weight: FontWeight.w600,
                  ),
                  Content(
                    data: "€ 34.56 ",
                    size: 12.h,
                    family: "Lato",
                    weight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Influencer Detail",
                size: 12.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 31.h,
            ),
            Container(
              width: 375.w,
              height: 31.h,
              color: Color(0xff5271FF).withOpacity(0.3),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
              child: Content(
                data: "Influencer Detail",
                size: 12.h,
                family: "Nunito",
                weight: FontWeight.w700,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30.w, right: 29.w, top: 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Content(
                        data: "Video Price",
                        size: 14.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      ),
                      Content(
                        data: "€ 34.56 ",
                        size: 12.h,
                        family: "Lato",
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
