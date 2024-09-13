import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/choose_category_screen.dart.dart';

class VIdeosAcceptScreen extends StatefulWidget {
  const VIdeosAcceptScreen({super.key});

  @override
  State<VIdeosAcceptScreen> createState() =>
      _VIdeosAcceptScreenState();
}

class _VIdeosAcceptScreenState
    extends State<VIdeosAcceptScreen> {
        String selectedVideoType = "Birthday"; // Initial selected video type
  String selectedPriceRange = "€50 - €100"; // Initial selected price range

  final List<String> videoTypes = [
    "Birthday",
    "Advice",
    "Promotional",
    "Special Day",
    "Other",
    "Questions"
  ];

  final List<String> priceRanges = [
    "€0 - €50",
    "€50 - €100",
    "€100 - €200",
    "€200 - €500",
    "€500 - €700",
    "€700 +"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20.h),
            TabBarWidget(),
            SizedBox(height: 20.h),
            Text(
              "Videos you will accept",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "The more options, the more attractive the profile will be to the public",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: videoTypes.map((type) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedVideoType = type;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: selectedVideoType == type
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.w,
                      ),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: selectedVideoType == type
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30.h),
            Text(
              "What is a range of price?",
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: priceRanges.map((range) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPriceRange = range;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: selectedPriceRange == range
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: Colors.black,
                        width: 1.w,
                      ),
                    ),
                    child: Text(
                      range,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: selectedPriceRange == range
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle Save & Continue
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Save & Continue",
                      style: TextStyle(fontSize: 16.sp),
                    ),
                    SizedBox(width: 10.w),
                    Icon(Icons.arrow_forward),
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
