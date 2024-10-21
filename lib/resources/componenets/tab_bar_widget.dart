import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/view/choose_category_screen.dart.dart';
import 'package:vidbuy_app/view/choose_price_screen.dart';
import 'package:vidbuy_app/view/review_selection_screen.dart';
import 'package:vidbuy_app/view/videos_accepet_screen.dart';

class TabBarWidget extends StatefulWidget {
  final List<Widget> screens;
  final List<String> tabTitles;

  TabBarWidget({required this.screens, required this.tabTitles});
  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // Example data storage for user selections
  String selectedCategory = "Actor";
  List<String> selectedVideos = [];
  Map<String, double> prices = {"Birthday": 0, "Special Day": 0, "Other": 0};

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

  void saveCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
    goToNextTab();
  }

  void saveVideos(List<String> videos) {
    setState(() {
      selectedVideos = videos;
    });
    goToNextTab();
  }

  void savePrices(Map<String, double> newPrices) {
    setState(() {
      prices = newPrices;
    });
    goToNextTab();
  }

  void dispose() {
    // Dispose the TabController when it's no longer needed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("Influencer Setup"),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xff5271FF),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black45,
            labelStyle: TextStyle(
              fontFamily: "Lato",
              fontSize: 16.h,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Tab(
                text: "Categorie",
              ),
              Tab(
                text: "Videos",
              ),
              Tab(
                text: "Price",
              ),
              Tab(
                text: "Review",
              ),
            ]

            // widget.tabTitles.map((title) => Tab(text: title)).toList(),
            ),
      ),
      body: TabBarView(
        controller: _tabController,
        // children: widget.screens,
        children: [
          ChooseCategoryScreen(onSave: saveCategory),
          VIdeosAcceptScreen(onSave: saveVideos),
          ChoosePricesScreen(onSave: savePrices),
          ReviewSelectionScreen(
            selectedCategory: selectedCategory,
            selectedVideos: selectedVideos,
            prices: prices,
          ),
        ],
      ),
    );
  }
}
