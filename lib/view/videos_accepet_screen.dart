import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VIdeosAcceptScreen extends StatefulWidget {
  final Function(List<String>) onSave;
  VIdeosAcceptScreen({super.key, required this.onSave});

  @override
  State<VIdeosAcceptScreen> createState() => _VIdeosAcceptScreenState();
}

class _VIdeosAcceptScreenState extends State<VIdeosAcceptScreen> {
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
      backgroundColor: Color(0xffFFFFFF),
      body: Container(
        margin: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 47.h,
            ),

            Text(
              "Videos you will accept",
              style: TextStyle(
                fontSize: 30.h,
                fontWeight: FontWeight.w300,
                // fontFamily:
              ),
            ),
            Text(
              "The more options, the more attractive the profile will be to the public",
              style: TextStyle(
                fontSize: 10.h,
                color: Color(0xff000000),
                fontWeight: FontWeight.w400,
                fontFamily: 'Nunito',
              ),
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 5.w,
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
                          ? Color(0xff000000)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: Color(0xff000000),
                        width: 1.w,
                      ),
                    ),
                    child: Text(
                      type,
                      style: TextStyle(
                        fontSize: 15.h,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                        color: selectedVideoType == type
                            ? Colors.white
                            : Color(0xff000000),
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
                fontSize: 30.h,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 5.w,
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
                        fontSize: 15.h,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w700,
                        color: selectedPriceRange == range
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            // Spacer(),
            SizedBox(
              height: 150.h,
            ),
            Container(
              width: 335.w,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () {
                  // Handle Save & Continue
                  widget.onSave(priceRanges);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff5271FF),
                  // padding:
                  //     EdgeInsets.symmetric(horizontal: 80.w, vertical: 15.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Save & Continue",
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
