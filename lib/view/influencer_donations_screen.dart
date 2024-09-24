import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/influencer_donations_sent_screen.dart';

class InfluencerDonationsScreen extends StatelessWidget {
  const InfluencerDonationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: cross,
        children: [
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: Row(
              children: [
                Image.asset(
                  "assets/Icon/backarrow.png",
                  height: 25.h,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Content(
                      data: "Historic",
                      size: 30.h,
                      weight: FontWeight.w300,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, InfluencerDonationsSentScreen());
                      },
                      child: Container(
                        width: 98.w,
                        height: 31.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Color(0xff5271FF),
                        ),
                        child: Center(
                            child: Content(
                          data: "Donations sent",
                          size: 14.h,
                          weight: FontWeight.w300,
                          color: Colors.white,
                        )),
                      ),
                    )
                  ],
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
          //   Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   decoration: BoxDecoration(

          //     color: Colors.grey[300], // Adjust background color as needed
          //     borderRadius: BorderRadius.circular(4),
          //   ),
          //   child: Row(
          //     children: [
          //       const Icon(Icons.favorite_border),
          //       const SizedBox(width: 8),
          //       const Text('Click to see'),
          //       const Spacer(),
          //       const Text(
          //         '€ 1234.56',
          //         style: TextStyle(fontWeight: FontWeight.bold),
          //       ),
          //       const SizedBox(width: 8),
          //       const Text('MMMed'),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 15.h,
          ),
          Container(
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
                    margin: EdgeInsets.only(left: 30.w),
                    child: Content(
                      data: "[user_name]",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    )),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/Icon/Heart.png",
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Content(
                      data: "Click to see",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w300,
                    ),
                    SizedBox(
                      width: 150.w,
                    ),
                    Content(
                      data: "€ 1234.56",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.only(left: 30.w),
                    child: Content(
                      data: "MMMEd",
                      size: 14.h,
                      family: "Lato",
                      weight: FontWeight.w300,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
