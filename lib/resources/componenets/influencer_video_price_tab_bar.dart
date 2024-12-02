import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/choose_category_screen.dart.dart';
import 'package:vidbuy_app/view/choose_price_screen.dart';
import 'package:vidbuy_app/view/review_selection_screen.dart';
import 'package:vidbuy_app/view/update_review_selection_screen.dart';
import 'package:vidbuy_app/view/videos_accept_screen.dart';

class InfluencerVideoPriceTabBarWidget extends StatefulWidget {
  @override
  _InfluencerVideoPriceTabBarWidgetState createState() =>
      _InfluencerVideoPriceTabBarWidgetState();
}

class _InfluencerVideoPriceTabBarWidgetState
    extends State<InfluencerVideoPriceTabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  List<Map<String, dynamic>> selectedVideos = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  /// Function to move to the next tab programmatically
  void goToNextTab() {
    if (_tabController.index < _tabController.length - 1) {
      _tabController.animateTo(_tabController.index + 1);
    }
  }

  void goToNextReview([List<Map<String, dynamic>>? videos]) {
    if (videos != null) {
      saveVideos(videos);
    }
    goToNextTab();
  }

  void saveVideos(List<Map<String, dynamic>> videos) {
    setState(() {
      selectedVideos = videos;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: const Color(0xff5271FF),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black45,
          isScrollable: true,
          labelStyle: TextStyle(
            fontFamily: "Lato",
            fontSize: 16.h,
            fontWeight: FontWeight.w500,
          ),
          onTap: (index) {
            // Prevent tab switching when tapping
            if (index != _tabController.index) {
              // Ignore taps and block default behavior
            }
          },
          tabs: const [
            Tab(
              text: "Videos",
            ),
            Tab(
              text: "Price",
            ),
            Tab(
              text: "Review",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(), // Disable swipe gestures
        children: [
          VideosAcceptScreen(
              onNextTab: (selectedVideos) => goToNextReview(selectedVideos)),
          ChoosePricesScreen(
              selectedVideos: selectedVideos, onNextTab: goToNextTab),
          UpdateReviewSelectionScreen(),
        ],
      ),
    );
  }
}
