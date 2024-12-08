import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/personal_details_screen.dart';
import 'package:vidbuy_app/view/video_identity_screen.dart';

class AdminInfluencerDetailTabBarWidget extends StatefulWidget {
  String influencerId;

  AdminInfluencerDetailTabBarWidget({required this.influencerId, super.key});

  @override
  _AdminInfluencerDetailTabBarWidgetState createState() =>
      _AdminInfluencerDetailTabBarWidgetState();
}

class _AdminInfluencerDetailTabBarWidgetState
    extends State<AdminInfluencerDetailTabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example data storage for user selections
  // String selectedCategory = "Actor";
  // List<String> selectedVideos = [];
  // Map<String, double> prices = {"Birthday": 0, "Special Day": 0, "Other": 0};

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
              text: 'Video Identity',
            ),
            Tab(
              text: 'Personal Details',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          VideoIdentityScreen(
            influencerId: widget.influencerId.toString(),
          ),
          PersonalDetailsScreen(
            influencerId: widget.influencerId.toString(),
          )
        ],
      ),
    );
  }
}
