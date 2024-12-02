import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/admin_activity_history_screen.dart';
import 'package:vidbuy_app/view/admin_order_detail_screen.dart';
import 'package:vidbuy_app/view/admin_video_screen.dart';

// ignore: must_be_immutable
class AdminTaskDetailTabBar extends StatefulWidget {
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
  String buyerName;
  String buyerUsername;
  String buyerEmail;
  String influencerName;
  String influencerUsername;
  String influencerEmail;
  String? videoUrl;
  String? reason;
  String? videoUploadId;

  AdminTaskDetailTabBar(
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
      required this.buyerName,
      required this.buyerUsername,
      required this.buyerEmail,
      required this.influencerName,
      required this.influencerEmail,
      required this.influencerUsername,
      this.videoUrl,
      this.videoUploadId,
      this.reason,
      super.key});

  @override
  _AdminTaskDetailTabBarState createState() => _AdminTaskDetailTabBarState();
}

class _AdminTaskDetailTabBarState extends State<AdminTaskDetailTabBar>
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
          AdminVideoScreen(
            status: widget.status.toString(),
            videoTypeId: widget.videoUploadId.toString(),
            videoUrl: widget.videoUrl.toString(),
            influencerId: widget.influencerId.toString(),
          ),
          AdminOrdersDetailsScreen(
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
            totalPrice: widget.totalPrice.toString(),
            buyerName: widget.buyerName.toString(),
            buyerEmail: widget.buyerEmail.toString(),
            buyerUsername: widget.buyerUsername.toString(),
            influencerName: widget.influencerName.toString(),
            influencerUsername: widget.influencerUsername.toString(),
            influencerEmail: widget.influencerEmail.toString(),
            reason: widget.reason.toString(),
          ),

          AdminActiveHistoryScreen(
            status: widget.status,
            videoTypeId: widget.videoTypeId.toString(),
          ),
        ],
      ),
    );
  }
}
