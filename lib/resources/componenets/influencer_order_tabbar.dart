import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/all_orders_screen.dart';
import 'package:vidbuy_app/view/completed_screen.dart';
import 'package:vidbuy_app/view/pending_screen.dart';
import 'package:vidbuy_app/view/rejected_screen.dart';
import 'package:vidbuy_app/view/waiting_video_screen.dart';

class InfluencerOrderTabbar extends StatefulWidget {
  @override
  _InfluencerOrderTabbarState createState() => _InfluencerOrderTabbarState();
}

class _InfluencerOrderTabbarState extends State<InfluencerOrderTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example data storage for user selections
  // String selectedCategory = "Actor";
  // List<String> selectedVideos = [];
  // Map<String, double> prices = {"Birthday": 0, "Special Day": 0, "Other": 0};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  void goToNextTab() {
    setState(() {
      _tabController.index += 1;
    });
  }

  // void saveCategory(String category) {
  //   setState(() {
  //     selectedCategory = category;
  //   });
  //   goToNextTab();
  // }

  // void saveVideos(List<String> videos) {
  //   setState(() {
  //     selectedVideos = videos;
  //   });
  //   goToNextTab();
  // }

  // void savePrices(Map<String, double> newPrices) {
  //   setState(() {
  //     prices = newPrices;
  //   });
  //   goToNextTab();
  // }

  DateTime? selectedDate;

  // Function to open the date picker and select a date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime pickedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ??
              currentDate, // Set to selected date or current date
          firstDate: DateTime(2000), // Optional: set the first selectable date
          lastDate: DateTime(2101), // Optional: set the last selectable date
        ) ??
        currentDate;

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.h),
        child: AppBar(
          backgroundColor: Color(0xffFFFFFF),
          titleSpacing: 20.h,
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Content(
                        data: "Historical ",
                        size: 30.h,
                        weight: FontWeight.w300,
                      ),
                      Content(
                        data: "See all your tasks ",
                        size: 15.h,
                        color: Colors.grey.withOpacity(0.7),
                        weight: FontWeight.w300,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      // margin: EdgeInsets.only(bottom: 20.h),
                      width: 140.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Color(0xff5271FF).withOpacity(0.8),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Content(
                            data: selectedDate != null
                                ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" // Format as dd/mm/yy
                                : "Expire Date",
                            size: 18.h,
                            color: Colors.white,
                            weight: FontWeight.w300,
                          ),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          ),
                          Icon(
                            Icons.arrow_downward,
                            color: Colors.white,
                          ),
                        ],
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // leading: Content(data: "Recent orders ", size: 30.h, weight: FontWeight.w300,),
          bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            indicatorColor: Color(0xff5271FF),
            labelColor: Colors.black,
            dragStartBehavior: DragStartBehavior.start,
            unselectedLabelColor: Colors.black45,
            // indicatorPadding: EdgeInsets.symmetric(horizontal: 10.w),
            labelPadding: EdgeInsets.only(right: 20.w),
            indicatorPadding: EdgeInsets.zero,
            // indicatorSize: 10,
            // indicatorWeight: 3.w,

            labelStyle: TextStyle(
              fontFamily: "Lato",
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
            ),
            tabs: const [
              Tab(text: 'All Orders'),
              // Tab(text: 'Pending', ),
              // Tab(text: 'Waiting Video', ),
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Waiting Video',
              ),
              Tab(
                text: 'Completed',
              ),
              Tab(
                text: 'Rejected',
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          AllOrdersScreen(
              date: selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : ""),
          // PendingScreen(),
          // WaitingVideoScreen(),
          PendingScreen(
              date: selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : ""),
          WaitingVideoScreen(
              date: selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : ""),
          CompleteOrderScreen(
              date: selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : ""),
          RejectedScreen(
              date: selectedDate != null
                  ? DateFormat('dd/MM/yyyy').format(selectedDate!)
                  : "")
          // ActiveHistoryScreen(),
          // ChooseCategoryScreen(onSave: saveCategory),
          // VIdeosAcceptScreen(onSave: saveVideos),
          // ChoosePricesScreen(onSave: savePrices),
          // ReviewSelectionScreen(
          //   selectedCategory: selectedCategory,
          //   selectedVideos: selectedVideos,
          //   prices: prices,
          // ),
        ],
      ),
    );
  }
}
