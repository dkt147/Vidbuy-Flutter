import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/utils.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

// ignore: must_be_immutable
class PersonalDetailsScreen extends StatefulWidget {

 String name;
 String email;
 String country;
 String genera;
String username;
String videosAccepted;
String pricePerVideo;
String totalReviews;
String totalVideosMade;
String totalVideosRejected; 
String createdAt;
 PersonalDetailsScreen({ required this.name ,
  required this.email,
  required this.country,
  required this.genera,
  required this.username,
  required this.videosAccepted,
  required this.pricePerVideo ,
  required this.totalReviews,
  required this.totalVideosMade,
  required this.totalVideosRejected,
  required this.createdAt,

  super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 18.h,
          ),
          Container(
            width: 375.w,
            height: 31.h,
            color: Color(0xffD9D9D9).withOpacity(0.3),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Content(
                  data: "Personal Detail",
                  size: 12.h,
                  family: "Nunito",
                  weight: FontWeight.w700,
                ),
                Content(
                  data: Utils.dateFormat3(widget.createdAt.toString()),
                  size: 12.h,
                  family: "Nunito",
                  weight: FontWeight.w700,
                ),
              ],
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
                      data: "Name",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.name,
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
                      data: "Email",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.email,
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
                      data: "Country",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.country,
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
                      data: "Influencer Genera",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.genera,
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
                      data: "Username",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.username,
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
            height: 18.h,
          ),
          Container(
            width: 375.w,
            height: 31.h,
            color: Color(0xffD9D9D9).withOpacity(0.3),
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
            child: Content(
              data: "Personal Detail",
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
                      data: "Videos accepted",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.videosAccepted,
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
                      data: "Price per video",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.pricePerVideo,
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
                      data: "Total reviews",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.totalReviews,
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
                      data: "Total videos made",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.totalVideosMade,
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
                      data: "Total videos rejected",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w600,
                    ),
                    Content(
                      data: widget.totalVideosRejected,
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
            height: 26.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 156.w,
                height: 40.h,
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
                    // navigate(context, FeedbackScreen());
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff908B8B),
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
              SizedBox(
                width: 8.h,
              ),
              Container(
                width: 156.w,
                height: 40.h,
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
                    "Approve",
                    style: TextStyle(fontSize: 16.h, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
