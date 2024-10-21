import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/order_cancel_screen.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                        data: "Created at::Wed, 5 Sep",
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
                        data: "Expires::Wed, 12 Sep",
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
              color: Color(0xff5271FF).withOpacity(0.8),
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
                    data: "Total price for this video",
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
              height: 153.h,
            ),
            Center(
              child: Container(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_emailController.text.isEmpty) {
                    //   snackBar("Enter Valid Email", context);
                    // } else if (_passwordController.text.isEmpty) {
                    //   snackBar(
                    //     "Enter Password",
                    //     context,
                    //   );
                    // } else if (_passwordController.text.length < 8) {
                    //   snackBar(
                    //       "Enter Minium 8 Characters of Password", context);
                    // } else {
                    //   // Navigator.push(
                    //   //     context,
                    //   //     MaterialPageRoute(
                    //   //         builder: (_) => TabBarWidget()));
                    // navigate(context, OrderCancelScreen());
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Accepet",
                    style: TextStyle(fontSize: 16.h, color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Center(
              child: Container(
                width: 280.w,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_emailController.text.isEmpty) {
                    //   snackBar("Enter Valid Email", context);
                    // } else if (_passwordController.text.isEmpty) {
                    //   snackBar(
                    //     "Enter Password",
                    //     context,
                    //   );
                    // } else if (_passwordController.text.length < 8) {
                    //   snackBar(
                    //       "Enter Minium 8 Characters of Password", context);
                    // } else {
                    //   // Navigator.push(
                    //   //     context,
                    //   //     MaterialPageRoute(
                    //   //         builder: (_) => TabBarWidget()));
                    navigate(context, OrderCancelScreen());
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff5271FF),
                    // backgroundColor: Colors.transparent,
                    // disabledBackgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "Reject",
                    style: TextStyle(fontSize: 16.h, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
