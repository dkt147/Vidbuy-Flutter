import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/user_active_history_screen.dart';
import 'package:vidbuy_app/view/user_order_detail_screen.dart';
import 'package:vidbuy_app/view/user_video_screen.dart';

class UserTaskDetailTabBarWidget extends StatefulWidget {
  String videoTypeId;
  String createdAt;
  String orderId;
  String expiresAt;
  String status;
  String videoTypeName;
  String from;
  String to;
  String requiredDays;
  String description;
  String totalPrice;
  String? videoUrl;

  UserTaskDetailTabBarWidget(
      {required this.videoTypeId,
      required this.createdAt,
      required this.orderId,
      required this.expiresAt,
      required this.status,
      required this.videoTypeName,
      required this.from,
      required this.to,
      required this.requiredDays,
      required this.description,
      required this.totalPrice,
      this.videoUrl,
      super.key});

  @override
  _UserTaskDetailTabBarWidgetState createState() =>
      _UserTaskDetailTabBarWidgetState();
}

class _UserTaskDetailTabBarWidgetState extends State<UserTaskDetailTabBarWidget>
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
          // indicatorSize: 10,
          indicatorWeight: 3.w,
          labelStyle: TextStyle(
            fontFamily: "Lato",
            fontSize: 16.h,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(
              text: 'Video',
            ),
            Tab(
              text: 'Orders Details',
            ),
            Tab(
              text: 'Active History',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // PendingScreen(),
          // WaitingVideoScreen(),
          UserVideoScreen(
            status: widget.status.toString(),
            videoTypeId: widget.videoTypeId.toString(),
            videoUrl: widget.videoUrl.toString(),
          ),
          UserOrdersDetailsScreen(
              videoTypeId: widget.videoTypeId.toString(),
              createdAt: widget.createdAt.toString(),
              orderId: widget.orderId.toString(),
              expiresAt: widget.expiresAt.toString(),
              status: widget.status.toString(),
              videoTypeName: widget.videoTypeName.toString(),
              from: widget.from.toString(),
              to: widget.to.toString(),
              requiredDays: widget.requiredDays.toString(),
              description: widget.description.toString(),
              totalPrice: widget.totalPrice.toString()),
          UserActiveHistoryScreen(
            videoTypeId: widget.videoTypeId.toString(),
          ),
        ],
      ),
    );
  }
}
