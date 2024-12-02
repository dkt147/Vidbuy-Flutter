import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/view/admin_setting_screen.dart';
import 'package:vidbuy_app/view/approved_admin_screen.dart';
import 'package:vidbuy_app/view/cancel_screen.dart';
import 'package:vidbuy_app/view/pending_admin_screen.dart';

class MainTabbarAdminWidget extends StatefulWidget {
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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  navigatePushReplace(context, AdminProfileScreen());
                },
                child: Image.asset(
                  "assets/Icon/backarrow.png",
                  height: 25.h,
                ),
              ),
              SizedBox(width: 8.w),
              // Text("Influencer Requests", style: T,),
              if (!showSearchField)
                Content(
                  data: "Influencer Request",
                  size: 14.h,
                  weight: FontWeight.w400,
                  family: "Nunito",
                ),
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: 40
                      .h, // Ensure this matches the intrinsic height of the TextField
                  width: showSearchField ? 270.w : 0,
                  child: showSearchField
                      ? TextField(
                          textAlignVertical:
                              TextAlignVertical.center, // Align text vertically
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h), // Adjust padding
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  showSearchField = false;
                                });
                              },
                              icon: Icon(Icons.cancel),
                            ),
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
          ),
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
              tabs: [
                Tab(
                  child: Text(
                    "Pending Request",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Tab(
                  child: Text(
                    "Approved",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
                Tab(
                  child: Text(
                    "Cancelled",
                    style: TextStyle(color: Colors.black45),
                  ),
                ),
              ]
              // Non-clickable tab (displayed as plain text)

              )),
      body: TabBarView(
        controller: _tabController,
        children: [
          PendingAdminScreen(search: searchText),
          ApprovedAdminScreen(search: searchText),
          CancelScreen(search: searchText),
        ],
      ),
    );
  }
}
