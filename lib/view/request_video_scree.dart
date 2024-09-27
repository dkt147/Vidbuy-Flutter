import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/payment_confirm_screen.dart';

import '../Function/navigate.dart';

class RequestVideoScree extends StatefulWidget {
  const RequestVideoScree({super.key});

  @override
  State<RequestVideoScree> createState() => _RequestVideoScreeState();
}

class _RequestVideoScreeState extends State<RequestVideoScree> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 55.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 21.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/Icon/backarrow.png",
                    height: 25.h,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Content(
                  data: "Create Order",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Container(
            margin: EdgeInsets.only(left: 19.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: "When do you need your video?",
                  size: 16.h,
                  weight: FontWeight.w500,
                  family: "Lato",
                ),
                Content(
                  data:
                      "Delivers in up to 7 days but if you want early the extra charges will be required.",
                  size: 14.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 39.h,
          ),
          Center(
            child: Container(
              width: 340.w,
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Container(
                margin: EdgeInsets.only(left: 28.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "7 Days",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                    Content(
                      data: "Included",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Container(
              width: 340.w,
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Container(
                margin: EdgeInsets.only(left: 28.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "7 Days",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                    Content(
                      data: "Included",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Center(
            child: Container(
              width: 340.w,
              height: 50.h,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Container(
                margin: EdgeInsets.only(left: 28.w, right: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "7 Days",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                    Content(
                      data: "Included",
                      size: 16.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 17.w),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "Hide this video from [Influencer Name] profile",
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 14.h,
                        fontFamily: "Lato"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: "Review Order",
                  size: 16.h,
                  weight: FontWeight.w700,
                  family: "Lato",
                ),
                Content(
                  data:
                      "Your request will be delivered to the influencer and they will have to choose whether to accept it or not.",
                  size: 14.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.w, right: 22.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Content(
                        data: "Order Price",
                        size: 16.h,
                        weight: FontWeight.w700,
                        family: "Lato",
                      ),
                      SizedBox(
                        height: 9.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: "Personalized Video",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€100.00",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: "Services charges",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€100.00",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: "Delivery charges",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€100.00",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: "Total",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                          Content(
                            data: "€100.00",
                            size: 16.h,
                            family: "Lato",
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 54.h,
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
                        navigate(context, PaymentConfirmScreen());
                        // }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff5271FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: Text(
                        "Request your Video",
                        style: TextStyle(
                            fontSize: 16.h,
                            color: Colors.white,
                            fontFamily: "Lato"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
