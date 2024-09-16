import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/view/Proof_identity_screen.dart';

class ReviewSelectionScreen extends StatelessWidget {
  final String selectedCategory;
  final List<String> selectedVideos;
  final Map<String, double> prices;

  ReviewSelectionScreen({
    required this.selectedCategory,
    required this.selectedVideos,
    required this.prices,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56.h),
            Text("Review Your Selection",
                style: TextStyle(fontSize: 30.h, fontWeight: FontWeight.w300)),
            SizedBox(height: 20.h),
            Text("Category: $selectedCategory",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: "lato")),
            SizedBox(height: 26.h),
            Text("Videos you will accept:",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: "lato")),
            Container(
              width: 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30.r)),
              child: Center(
                  child: Text(selectedCategory,
                      style: TextStyle(
                          fontSize: 18.h,
                          fontWeight: FontWeight.w500,
                          fontFamily: "lato",
                          color: Colors.white))),
            ),
            SizedBox(height: 26.h),
            Text("Prices For Each Video:",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: "lato")),
            Text("Birthday: €${prices["Birthday"]}",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: "lato")),
            Text("Special Day: €${prices["Special Day"]}",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: "lato")),
            Text("Other: €${prices["Other"]}",
                style: TextStyle(
                    fontSize: 18.h,
                    fontWeight: FontWeight.w500,
                    fontFamily: "lato")),
            // Spacer(),
            SizedBox(
              height: 149.h,
            ),
            Container(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                onPressed: () {
                  navigate(context, ProofIdentityScreen());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "finish",
                      style: TextStyle(
                          fontSize: 20.h,
                          fontWeight: FontWeight.w700,
                          fontFamily: "Lato",
                          color: Colors.white),
                    ),
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
