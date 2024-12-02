import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/personal_details_screen.dart';
import 'package:vidbuy_app/view/video_identity_screen.dart';

class AdminInfluencerDetailTabBarWidget extends StatefulWidget {
  final String status;
  final String? videoUrl;
  String influencerId;
  String name;
  String email;
  String country;
  String genera;
  String username;
  String videosAccepted;
  String pricePerVideo;
  String totalReviews;
  String totalVideosMade;
  String totalVideosRejected;
  String createdAt;
  List<String> videoTypes;
  List<String> videoPrices;

  AdminInfluencerDetailTabBarWidget(
      {required this.status,
      required this.influencerId,
      this.videoUrl,
      required this.name,
      required this.email,
      required this.country,
      required this.genera,
      required this.username,
      required this.videosAccepted,
      required this.pricePerVideo,
      required this.totalReviews,
      required this.totalVideosMade,
      required this.totalVideosRejected,
      required this.createdAt,
      required this.videoTypes,
      required this.videoPrices,
      super.key});

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
            status: widget.status.toString(),
            influencerId: widget.influencerId.toString(),
            videoUrl: widget.videoUrl.toString(),
          ),
          PersonalDetailsScreen(
            influencerId: widget.influencerId.toString(),
            status: widget.status.toString(),
            name: widget.name.toString(),
            email: widget.email.toString(),
            country: widget.country.toString(),
            genera: widget.genera.toString(),
            username: widget.username.toString(),
            videosAccepted: "10", // If this needs a check, replace accordingly
            pricePerVideo: "10", // If this needs a check, replace accordingly
            totalReviews: widget.totalReviews.toString(),
            totalVideosMade: "10", // If this needs a check, replace accordingly
            totalVideosRejected:
                "20", // If this needs a check, replace accordingly
            createdAt: widget.createdAt.toString(),
            videoTypes: widget.videoTypes,
            videoPrices: widget.videoPrices,
          )
        ],
      ),
    );
  }
}
