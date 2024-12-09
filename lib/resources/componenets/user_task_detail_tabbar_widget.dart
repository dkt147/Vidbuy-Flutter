import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/user_active_history_screen.dart';
import 'package:vidbuy_app/view/user_order_detail_screen.dart';
import 'package:vidbuy_app/view/user_video_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserTaskDetailTabBarWidget extends StatefulWidget {
  String videoTypeId;
  String influencerId;
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
  String? reason;
  String? videoUploadId;

  UserTaskDetailTabBarWidget(
      {required this.videoTypeId,
      required this.influencerId,
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
      this.videoUploadId,
      this.reason,
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
    _tabController = TabController(length: 3, vsync: this);
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
          tabs: [
            Tab(
              text: AppLocalizations.of(context)!.userVideo,
            ),
            Tab(
              text: AppLocalizations.of(context)!.userOrderDetails,
            ),
            Tab(
              text: AppLocalizations.of(context)!.userActiveHistory,
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
            videoTypeId: widget.videoTypeId.toString(),
          ),
          UserOrdersDetailsScreen(
            videoTypeId: widget.videoTypeId.toString(),
          ),

          UserActiveHistoryScreen(
            status: widget.status,
            videoTypeId: widget.videoTypeId.toString(),
          ),
        ],
      ),
    );
  }
}
