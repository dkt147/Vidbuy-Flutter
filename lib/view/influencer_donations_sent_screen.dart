import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/donation_message_alert.dart';

class InfluencerDonationsSentScreen extends StatelessWidget {
  const InfluencerDonationsSentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
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
                  data: "Donations  ",
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: "Historic",
                  size: 30.h,
                  weight: FontWeight.w300,
                ),
                Content(
                  data: "Below are all your donations",
                  size: 14.h,
                  weight: FontWeight.w300,
                  color: Color(0xff908B8B),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              donationMessageAlert(context);
            },
            child: Center(
              child: Container(
                width: 335.w,
                height: 81.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.black),
                ),
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        // margin: EdgeInsets.only(left: 30.w),
                        child: Content(
                      data: "[user_name]",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    )),
                    Container(
                      // margin: EdgeInsets.only(left: 30.w, right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Content(
                            data: "Click to see",
                            size: 14.h,
                            family: "Lato",
                            weight: FontWeight.w300,
                          ),
                          Content(
                            data: "€ 1234.56",
                            size: 14.h,
                            family: "Lato",
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                    Container(
                        // margin: EdgeInsets.only(left: 30.w),
                        child: Content(
                      data: "MMMEd",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w300,
                    )),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
