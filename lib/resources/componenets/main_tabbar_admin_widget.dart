import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';

class MainTabbarAdminWidget extends StatefulWidget {
  final List<Widget> screens;
  final List<String> tabTitles;

  MainTabbarAdminWidget({required this.screens, required this.tabTitles});

  @override
  _MainTabbarAdminWidgetState createState() => _MainTabbarAdminWidgetState();
}

class _MainTabbarAdminWidgetState extends State<MainTabbarAdminWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool showSearchField = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabTitles.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == widget.tabTitles.indexOf("Pending Request")) {
          showSearchField = false; // Reset search field when switching tabs
        } else if (_tabController.index == widget.tabTitles.indexOf("Canceled")) {
          showSearchField = false; // Reset search field when switching tabs
        }
      });
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
        automaticallyImplyLeading: false,
        title: _tabController.index == widget.tabTitles.indexOf("Pending Request")
            ? Row(
                children: [
                  Image.asset("assets/Icon/backarrow.png", height: 25.h,),
                  SizedBox(width: 8.w),
                  // Text("Influencer Requests", style: T,),
                  Content(data: "Influencer Request", size: 14.h, weight: FontWeight.w400,family: "Nunito",),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        showSearchField = false;
                      });
                    },
                  ),
                ],
              )
            : _tabController.index == widget.tabTitles.indexOf("Canceled")
                ? Row(
                    children: [
                      Image.asset("assets/Icon/backarrow.png", height: 25.h,),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          height: 30.h,
                          width: showSearchField ? 270.w : 0,
                          child: showSearchField
                              ? TextField(
                                  decoration: InputDecoration(
                                    // hintText: "Search...",
                                    prefixIcon: Icon(Icons.search),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                )
                              : null,
                        ),
                      ),
                      if (!showSearchField)
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            setState(() {
                              showSearchField = true;
                            });
                          },
                        ),
                    ],
                  )
                : null,
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Color(0xff5271FF),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.black45,
          labelStyle: TextStyle(
            fontFamily: "Lato",
            fontSize: 16.h,
            fontWeight: FontWeight.w500,
          ),
          tabs: widget.tabTitles.map((title) {
            if (title.startsWith("_")) {
              // Non-clickable tab (displayed as plain text)
              return Tab(
                child: Text(
                  title.substring(1),
                  style: TextStyle(color: Colors.black45),
                ),
              );
            } else {
              return Tab(text: title);
            }
          }).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: widget.screens,
      ),
    );
  }
}
