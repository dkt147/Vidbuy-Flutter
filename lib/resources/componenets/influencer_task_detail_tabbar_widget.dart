import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/model/influencer_model/influencer_all_orders_data_model/datum.dart';
import 'package:vidbuy_app/view/active_history_screen.dart';
import 'package:vidbuy_app/view/orders_details_screen.dart';
import 'package:vidbuy_app/view/video_screen.dart';

// ignore: must_be_immutable
class InfluencerTaskDetailTabBarWidget extends StatefulWidget {
  String videoTypeId;

  InfluencerTaskDetailTabBarWidget({required this.videoTypeId, super.key});

  @override
  _InfluencerTaskDetailTabBarWidgetState createState() =>
      _InfluencerTaskDetailTabBarWidgetState();
}

class _InfluencerTaskDetailTabBarWidgetState
    extends State<InfluencerTaskDetailTabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // Changed to 3
  }

  void goToNextTab() {
    setState(() {
      _tabController.index += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Color(0xff5271FF),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black45,
          indicatorWeight: 3.w,
          labelStyle: TextStyle(
            fontFamily: "Lato",
            fontSize: 16.h,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(text: 'Video'),
            Tab(text: 'Orders Details'),
            Tab(text: 'Active History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          VideoScreen(
            videoTypeId: widget.videoTypeId.toString(),
            // "completed",
          ),
          OrdersDetailsScreen(videoTypeId: widget.videoTypeId.toString()),
          ActiveHistoryScreen(
            videoTypeId: widget.videoTypeId.toString(),
          ),
        ],
      ),
    );
  }
}
