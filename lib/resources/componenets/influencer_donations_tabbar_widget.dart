
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/active_history_screen.dart';
import 'package:vidbuy_app/view/all_orders_screen.dart';
import 'package:vidbuy_app/view/all_task_scereen.dart';
import 'package:vidbuy_app/view/orders_details_screen.dart';
import 'package:vidbuy_app/view/task_details_screen.dart';
import 'package:vidbuy_app/view/video_screen.dart';

class InfluencerDonationsTabbarWidget extends StatefulWidget {
  @override
  _InfluencerDonationsTabbarWidgetState createState() => _InfluencerDonationsTabbarWidgetState();
}

class _InfluencerDonationsTabbarWidgetState extends State<InfluencerDonationsTabbarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example data storage for user selections
  // String selectedCategory = "Actor";
  // List<String> selectedVideos = [];
  // Map<String, double> prices = {"Birthday": 0, "Special Day": 0, "Other": 0};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Influencer Setup"),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Color(0xff5271FF),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black45,
          // dragStartBehavior: DragStartBehavior.start,
          // padding: EdgeInsets.only(right: 30.w),
          // labelPadding: EdgeInsets.only(right: 10.w, left: 10.w),
          indicatorWeight: 5.w,
          labelStyle: TextStyle(
            fontFamily: "Lato",
            fontSize:   16.h,
            fontWeight: FontWeight.w500,
          ),
          tabs: [
            Tab(text: 'All Task'),
            // Tab(text: 'Pending', ),
            // Tab(text: 'Waiting Video', ),
            Tab(text: 'Video', ),
            Tab(text: 'Task Details', ),
            Tab(text: 'Active History', ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // AllOrdersScreen(),
          AllTaskScereen(),
          // PendingScreen(),
          // WaitingVideoScreen(),
          VideoScreen(),
          TaskDetailsScreen(),
          ActiveHistoryScreen(),
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