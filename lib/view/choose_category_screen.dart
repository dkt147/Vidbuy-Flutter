import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



class ChooseCategoryScreen extends StatefulWidget {
  @override
  _ChooseCategoryScreenState createState() => _ChooseCategoryScreenState();
}

class _ChooseCategoryScreenState extends State<ChooseCategoryScreen> {
  String selectedCategory = "Actor";

  final List<String> categories = [
    "Entertainment",
    "Musician",
    "Fitness",
    "Comedian",
    "Gaming",
    "Actor",
    "Artist",
    "Athlete",
    "Reality TV",
    "Kitchen",
    "Business"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 40.h, left: 21.w),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                // Handle back action
              },
            ),
          ),
          // SizedBox(height: 20.h),
          TabBarWidget(),
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.only(left: 21.w),
            child: Column(
              children: [
                Text(
                  "Choose your categorie",
                  style: TextStyle(
                    fontSize: 30.h,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
            "Make it easier for your followers to find you",
            style: TextStyle(
              fontSize: 12.h,
              color: Colors.black,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w400,
            ),
          ),
              ],
            ),
          ),
          
          SizedBox(height: 20.h),
          Container(
            margin: EdgeInsets.only(left: 21.w),
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              children: categories.map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      color: selectedCategory == category
                          ? Colors.black
                          : Colors.white,
                      borderRadius: BorderRadius.circular(30.r),
                      border: Border.all(
                        color: Color(0xff000000),
                        width: 0.6.w,
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        fontSize: 15.h,
                        fontFamily: "Lato",
                        color: selectedCategory == category
                            ? Colors.white
                            : Color(0xff000000),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          Spacer(),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Handle Save & Continue
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff5271FF),
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
    );
  }
}

class TabBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: TabBar(
        isScrollable: true,
        indicatorColor: Colors.blue,
        labelColor: Colors.black,
        unselectedLabelColor: Colors.black45,
        // labelPadding: EdgeInsets.symmetric(horizontal: 20),
        labelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
        ),
        tabs: [
          Tab(text: 'Categorie'),
          Tab(text: 'Videos'),
          Tab(text: 'Prices'),
          Tab(text: 'Review'),
        ],
      ),
    );
  }
}
