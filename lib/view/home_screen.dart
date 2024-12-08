import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/data/response/status.dart';
import 'package:vidbuy_app/notification_services/notification_services.dart';
import 'package:vidbuy_app/resources/componenets/carousel_slider_category.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/giveaway_screen.dart';
import 'package:vidbuy_app/view/influencer_profile_screen.dart';
import 'package:vidbuy_app/view/notification_screen.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/home_screen_view_model.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  final TextEditingController _searchController = TextEditingController();

  List<dynamic> categories = [];

  HomeScreenViewModel viewModel = HomeScreenViewModel();
  NotificationServices notificationServices = NotificationServices();

  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
    // final viewModel = Provider.of<HomeScreenViewModel>(context, listen: false);
    viewModel.fetchCategoryList();
    viewModel.fetchTrendingInfluencerList();
    viewModel.fetchGiveAwayList();
    viewModel.fetchRecentlyAddedList();
    notificationServices.getDeviceToken().then((value) {
      viewModel.fetchNotificationUpdate(value.toString());
      print("device token");
      print(value);
    });
  }

  String getGreeting() {
    int hour = DateTime.now().hour;

    if (hour < 12) {
      return AppLocalizations.of(context)!.userHomeTitleGoodMorning;
      // "Good Morning";
    } else if (hour < 17) {
      return AppLocalizations.of(context)!.userHomeTitleGoodAfternoon;
    } else if (hour < 20) {
      return AppLocalizations.of(context)!.userHomeTitleGoodEvening;
    } else {
      return AppLocalizations.of(context)!.userHomeTitleGoodNight;
    }
  }

  // v

  @override
  Widget build(BuildContext context) {
    // final viewModel = Provider.of<HomeScreenViewModel>(context, listen: false);
    // viewModel.fetchCategoryList();
    // viewModel.fetchTrendingInfluencerList();
    // viewModel.fetchGiveAwayList();
    // viewModel.fetchRecentlyAddedList();
    super.build(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 48.h),
          Container(
            margin: EdgeInsets.only(right: 18.w, left: 11.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // navigate(
                    //   context,
                    //   MainTabbarAdminWidget(
                    //     tabTitles: const [
                    //       "Pending Request",
                    //       "Approved",
                    //       "Canceled"
                    //     ],
                    //     screens: const [
                    //       PendingAdminScreen(),
                    //       PendingAdminScreen(),
                    //       CancelScreen(),
                    //     ],
                    //   ),
                    // );
                  },
                  child: CircleAvatar(
                    radius: 22.r,
                    backgroundImage: NetworkImage(LocalData.image),
                  ),
                ),
                SizedBox(width: 5.w),
                Column(
                  children: [
                    Content(
                      data: getGreeting(),
                      size: 14.h,
                      family: "Nunito",
                      color: const Color(0xff161436),
                      weight: FontWeight.w400,
                    ),
                    Content(
                      data: LocalData.name,
                      size: 16.h,
                      family: "Nunito",
                      color: const Color(0xff0A071E),
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // navigate(context, InfluencerDonationsTabbarWidget());
                      },
                      child: Image.asset(
                        "assets/Icon/Hand.png",
                        height: 25.h,
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () {
                        navigate(context, const NotificationScreen());
                      },
                      child: badges.Badge(
                        position:
                            badges.BadgePosition.topEnd(top: -10, end: -12),
                        showBadge: true,
                        // ignorePointer: false,
                        onTap: () {},
                        badgeContent: Content(data: "3", size: 10.h),
                        badgeAnimation: badges.BadgeAnimation.rotation(
                          animationDuration: Duration(seconds: 1),
                          colorChangeAnimationDuration: Duration(seconds: 1),
                          loopAnimation: false,
                          curve: Curves.fastOutSlowIn,
                          colorChangeAnimationCurve: Curves.easeInCubic,
                        ),
                        // badgeStyle: badges.BadgeStyle(
                        //   // shape: badges.BadgeShape.square,
                        //   badgeColor: Colors.black,
                        //   padding: EdgeInsets.all(5.h),
                        //   // borderRadius: BorderRadius.circular(4),
                        //   borderSide: BorderSide(color: Colors.white, width: 2),
                        //   // borderGradient: badges.BadgeGradient.linear(
                        //   //     colors: [Colors.red, Colors.black]),
                        //   // badgeGradient: badges.BadgeGradient.linear(
                        //   //     colors: [Colors.blue, Colors.yellow],
                        //   //     begin: Alignment.topCenter,
                        //   //     end: Alignment.bottomCenter,
                        //   // ),
                        //   elevation: 0,
                        // ),
                        child: Image.asset(
                          "assets/Icon/Notification.png",
                          height: 25.h,
                        ),
                      ),

                      // Image.asset(
                      //   "assets/Icon/Notification.png",
                      //   height: 25.h,
                      // ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) =>
                viewModel, // Assuming viewModel is an instance of HomeScreenViewModel
            child: Consumer<HomeScreenViewModel>(
              builder: (context, value, child) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 23.h),
                    Center(
                      child: SizedBox(
                        width: 335.w,
                        height: 50.h,
                        child: TypeAheadField(
                          textFieldConfiguration: TextFieldConfiguration(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 0),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                    color: Color(0xff908B8B), width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                    color: Color(0xff908B8B), width: 2.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                    color: Color(0xff908B8B), width: 2.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.r),
                                borderSide: const BorderSide(
                                    color: Color(0xff908B8B), width: 2.0),
                              ),
                              suffixIcon: Image.asset("assets/Icon/cancel.png",
                                  height: 20.h),
                              prefixIcon: Image.asset(
                                  "assets/Icon/searchIcon.png",
                                  height: 18.h),
                              border: InputBorder.none,
                              hintText: AppLocalizations.of(context)!
                                  .userHomeSearchText,
                              hintStyle: TextStyle(
                                fontFamily: "Nunito",
                                fontSize: 14.h,
                                color: const Color(0xff8E8E8E),
                              ),
                            ),
                            onChanged: (text) =>
                                viewModel.onSearchTextChanged(text),
                          ),
                          suggestionsCallback: (pattern) async {
                            // Trigger the search based on the pattern
                            if (viewModel.searchInfluencerList.status ==
                                Status.COMPLETED) {
                              return viewModel.searchInfluencerList.data!.data!
                                      .where((user) => user.name
                                          .toString()
                                          .toLowerCase()
                                          .contains(pattern.toLowerCase()))
                                      .toList() ??
                                  [];
                            }
                            return [];
                          },
                          itemBuilder: (context, suggestion) {
                            if (viewModel.searchInfluencerList.status ==
                                Status.LOADING) {
                              // Show loader when data is being fetched
                              return ListTile(
                                title: Row(
                                  children: [
                                    CircularProgressIndicator(), // Loader inside the list item
                                    SizedBox(width: 10),
                                    Text(
                                        "Loading..."), // Optional: Additional text to indicate loading
                                  ],
                                ),
                              );
                            } else {
                              // Display the suggestion result once loaded
                              return GestureDetector(
                                onTap: () {
                                  navigate(
                                      context,
                                      InfluencerProfileScreen(
                                          influencerId:
                                              suggestion.id.toString()));
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: suggestion.image != null
                                        ? NetworkImage(suggestion.image)
                                        : AssetImage(
                                                "assets/placeholder_image.png")
                                            as ImageProvider,
                                  ),
                                  title: Text(suggestion.name ??
                                      'No Name'), // Fallback if name is null
                                ),
                              );
                            }
                          },
                          onSuggestionSelected: (suggestion) {
                            // Handle when a suggestion is selected
                            print("Selected: ${suggestion.name}");
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 13.h),

                    // First part: Influencer Category List
                    value.influencerCategoryList.status == Status.LOADING
                        ? Center(child: CircularProgressIndicator())
                        : value.influencerCategoryList.status == Status.ERROR
                            ? Center(
                                child: Content(
                                    data: value.influencerCategoryList.message
                                        .toString(),
                                    size: 18))
                            : value.influencerCategoryList.status ==
                                    Status.COMPLETED
                                ? StyledCarouselSlider(
                                    categories: value.categories)
                                : Container(),

                    SizedBox(height: 30.h),
                    Container(
                      margin: EdgeInsets.only(left: 12.w),
                      child: Content(
                        data: AppLocalizations.of(context)!
                            .userHomeTitleTrendingInfluencers,
                        size: 22.h,
                        family: "Nunito",
                        color: Color(0xff0A071E),
                        weight: FontWeight.w700,
                      ),
                    ),

                    // Second part: Trending Influencer List
                    Container(
                        margin:
                            EdgeInsets.only(left: 14.w, right: 14.w, top: 17.h),
                        child: value.trendingInfluencerList.status ==
                                Status.LOADING
                            ? const Center(child: CircularProgressIndicator())
                            : value.trendingInfluencerList.status ==
                                    Status.ERROR
                                ? Center(
                                    child: Content(
                                        data: value
                                            .trendingInfluencerList.message
                                            .toString(),
                                        size: 18))
                                : value.trendingInfluencerList.status ==
                                        Status.COMPLETED
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: value.trendingInfluencerList
                                            .data!.result!
                                            .map((influencer) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      InfluencerProfileScreen(
                                                    influencerId: influencer.id
                                                        .toString(),
                                                  ),
                                                ),
                                              );
                                            },
                                            child: InfluencerCardWidget(
                                              image:
                                                  influencer.image.toString(),
                                              influencerName:
                                                  influencer.name.toString(),
                                              categoryName: influencer
                                                  .influencerCategory!
                                                  .first
                                                  .name
                                                  .toString(),
                                            ),
                                          );
                                        }).toList(),
                                      )
                                    : Container()),
                    SizedBox(
                      height: 23.h,
                    ),

                    // Third part: GiveAway List
                    value.giveAwayList.status == Status.LOADING
                        ? Center(child: CircularProgressIndicator())
                        : value.giveAwayList.status == Status.ERROR
                            ? Center(
                                child: Content(
                                    data: value.giveAwayList.message.toString(),
                                    size: 18))
                            : value.giveAwayList.status == Status.COMPLETED
                                ? Column(
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          radius: 22.r,
                                          backgroundImage: NetworkImage(value
                                              .giveAwayList
                                              .data!
                                              .result!
                                              .first
                                              .image
                                              .toString()),
                                        ),
                                        title: Text(value.giveAwayList.data!
                                            .result!.first.price
                                            .toString()),
                                        subtitle: Content(
                                          data: value.giveAwayList.data!.result!
                                              .first.title
                                              .toString(),
                                          size: 12.h,
                                          weight: FontWeight.w400,
                                          family: "Nunito",
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          navigate(context, GivewayScreen());
                                        },
                                        child: Center(
                                          child: Stack(
                                            children: [
                                              Container(
                                                width: 331.w,
                                                height: 165.h,
                                                decoration: BoxDecoration(
                                                    color: Colors.amber,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.r)),
                                                child: Image.network(
                                                  value.giveAwayList.data!
                                                      .result!.first.image
                                                      .toString(),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      left: 300.w),
                                                  child: Image.asset(
                                                      "assets/Icon/bookmark.png",
                                                      height: 31.h)),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 16.63.h,
                                            width: 45.w,
                                            margin: EdgeInsets.only(
                                                left: 21.w, top: 7.h),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
                                              color: Color(0xffB0ABAB),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                    "assets/Icon/Heart.png"),
                                                Content(
                                                  data: value.giveAwayList.data!
                                                      .result!.first.like
                                                      .toString(),
                                                  size: 10.h,
                                                  weight: FontWeight.w700,
                                                  family: "Nunito",
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 60.h,
                                            width: 150
                                                .w, // Adjust based on your image size
                                            child: Stack(
                                              children: [
                                                for (int i = 0;
                                                    i < 4;
                                                    i++) // Loop to create multiple images
                                                  Positioned(
                                                    left: i *
                                                        15.0.w, // Adjust to control the overlap amount
                                                    child: CircleAvatar(
                                                      radius: 15
                                                          .r, // Adjust the size of the images
                                                      backgroundColor: Colors
                                                          .purple, // Border color
                                                      child: CircleAvatar(
                                                        radius: 28
                                                            .r, // Slightly smaller to create the border effect
                                                        backgroundImage: AssetImage(
                                                            "assets/Vector/girl.png"),
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                : Container(),

                    Container(
                      margin: EdgeInsets.only(left: 12.w),
                      child: Content(
                        data: AppLocalizations.of(context)!
                            .userHomeTitleRecentlyAdded,
                        size: 22.h,
                        family: "Nunito",
                        color: Color(0xff0A071E),
                        weight: FontWeight.w700,
                      ),
                    ),

                    // Recently Added List
                    Container(
                      margin:
                          EdgeInsets.only(left: 14.w, right: 14.w, top: 17.h),
                      child: value.recentlyAddedList.status == Status.LOADING
                          ? Center(child: CircularProgressIndicator())
                          : value.recentlyAddedList.status == Status.ERROR
                              ? Center(
                                  child: Content(
                                      data: value.recentlyAddedList.message
                                          .toString(),
                                      size: 18))
                              : value.recentlyAddedList.status ==
                                      Status.COMPLETED
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: value.recentlyAddedList.data!
                                          .result!.users!
                                          .take(
                                              3) // Only show the first 3 users
                                          .map((influencer) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    InfluencerProfileScreen(
                                                  influencerId:
                                                      influencer.id.toString(),
                                                ),
                                              ),
                                            );
                                          },
                                          child: InfluencerCardWidget(
                                            image: influencer.image
                                                .toString(), // Image URL or asset
                                            influencerName: influencer.name
                                                .toString(), // Influencer name
                                            categoryName: influencer
                                                .influencerCategory!.first.name
                                                .toString(), // Category name
                                          ),
                                        );
                                      }).toList(),
                                    )
                                  : Container(),
                    ),

                    SizedBox(
                      height: 70.h,
                    ),
                  ],
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}

//     Container(
//       margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 14.h),
//       child: ChangeNotifierProvider(
// create: (BuildContext context) => viewModel,
//         child: Consumer<HomeScreenViewModel>(
//           // Assume data is in HomeScreenViewModel
//           builder: (context, value, child) {
//             switch (value.recentlyAddedList.status) {
//               case Status.INIT:
//                 return Container();
//               case Status.LOADING:
//                 return Center(
//                     child: const CircularProgressIndicator());
//               case Status.ERROR:
//                 return Center(
//                   child: Content(
//                       data:
//                           value.recentlyAddedList.message.toString(),
//                       size: 18),
//                 );
//               case Status.COMPLETED:
//                 final users =
//                     value.recentlyAddedList.data!.result!.users!;
//                 final firstThreeUsers = users.take(3).toList();
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: firstThreeUsers.map((influencer) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 InfluencerProfileScreen(
//                               influencerId: influencer.id
//                                   .toString(), // Pass the influencer data to the profile screen
//                             ),
//                           ),
//                         );
//                       },
//                       child: InfluencerCardWidget(
//                           image: influencer.image
//                               .toString(), // Assuming 'image' is a URL or asset path
//                           influencerName: influencer.name
//                               .toString(), // Use actual name from API
//                           categoryName: influencer
//                               .influencerCategory!.first.name
//                               .toString() // Or whichever field you need
//                           ),
//                     );
//                   }).toList(),
//                 );
//               case null:
//             }
//             return Container();
//           },
//         ),
//       ),
//     ),
//             SizedBox(
//               height: 70.h,
//             ),
//           ],
//         ),
//       ],
//     ),
//   ),
// );

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';
// import 'package:provider/provider.dart';
// import 'package:vidbuy_app/Function/navigate.dart';
// import 'package:vidbuy_app/data/response/status.dart';
// import 'package:vidbuy_app/resources/componenets/carousel_slider_category.dart';
// import 'package:vidbuy_app/resources/componenets/content.dart';
// import 'package:vidbuy_app/resources/componenets/influencer_card_widget.dart';
// import 'package:vidbuy_app/resources/local_data/local_data.dart';
// import 'package:vidbuy_app/view/influencer_profile_screen.dart';
// import 'package:vidbuy_app/view/notification_screen.dart';
// import 'package:vidbuy_app/viewmodel/user_view_model/home_screen_view_model.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();

//   List<dynamic> categories = [];

//    HomeScreenViewModel viewModel = HomeScreenViewModel();

//   @override
//   void initState() {
//     super.initState();
//         // final viewModel = Provider.of<HomeScreenViewModel>(context, listen: false);
//     viewModel.fetchCategoryList();
//     viewModel.fetchTrendingInfluencerList();
//     viewModel.fetchGiveAwayList();
//     viewModel.fetchRecentlyAddedList();
//   }
//   String getGreeting() {
//     int hour = DateTime.now().hour;

//     if (hour < 12) {
//       return "Good Morning";
//     } else if (hour < 17) {
//       return "Good Afternoon";
//     } else if (hour < 20) {
//       return "Good Evening";
//     } else {
//       return "Good Night";
//     }
//   }

//   // v

//   @override
//   Widget build(BuildContext context) {
//     // final viewModel = Provider.of<HomeScreenViewModel>(context, listen: false);
//     // viewModel.fetchCategoryList();
//     // viewModel.fetchTrendingInfluencerList();
//     // viewModel.fetchGiveAwayList();
//     // viewModel.fetchRecentlyAddedList();
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: 48.h),
//             Container(
//               margin: EdgeInsets.only(right: 18.w, left: 11.w),
//               child: Row(
//                 children: [
//                   // GestureDetector(
//                   //   onTap: () {
//                   //     navigate(
//                   //       context,
//                   //       MainTabbarAdminWidget(
//                   //         tabTitles: const [
//                   //           "Pending Request",
//                   //           "Approved",
//                   //           "Canceled"
//                   //         ],
//                   //         screens: const [
//                   //           PendingAdminScreen(),
//                   //           PendingAdminScreen(),
//                   //           CancelScreen(),
//                   //         ],
//                   //       ),
//                   //     );
//                   //   },
//                   //   child: CircleAvatar(
//                   //     radius: 22.r,
//                   //     backgroundImage: NetworkImage(LocalData.image),
//                   //   ),
//                   // ),
//                   SizedBox(width: 5.w),
//                   Column(
//                     children: [
//                       Content(
//                         data: getGreeting(),
//                         size: 14.h,
//                         family: "Nunito",
//                         color: const Color(0xff161436),
//                         weight: FontWeight.w400,
//                       ),
//                       Content(
//                         data: LocalData.name,
//                         size: 16.h,
//                         family: "Nunito",
//                         color: const Color(0xff0A071E),
//                         weight: FontWeight.w600,
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () {
//                           // navigate(context, InfluencerDonationsTabbarWidget());
//                         },
//                         child: Image.asset(
//                           "assets/Icon/Hand.png",
//                           height: 25.h,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       GestureDetector(
//                         onTap: () {
//                           navigate(context, const NotificationScreen());
//                         },
//                         child: Image.asset(
//                           "assets/Icon/Notification.png",
//                           height: 25.h,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 23.h),
//             Center(
//               child: SizedBox(
//                 width: 335.w,
//                 height: 50.h,
//                 child: TypeAheadField(
//                   textFieldConfiguration: TextFieldConfiguration(
//                     decoration: InputDecoration(
//                       contentPadding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 0),
//                       focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide:
//                             BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide:
//                             BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                       errorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide:
//                             BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                       focusedErrorBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(30.r),
//                         borderSide:
//                             BorderSide(color: Color(0xff908B8B), width: 2.0),
//                       ),
//                       suffixIcon:
//                           Image.asset("assets/Icon/cancel.png", height: 20.h),
//                       prefixIcon: Image.asset("assets/Icon/searchIcon.png",
//                           height: 18.h),
//                       border: InputBorder.none,
//                       hintText: 'Discover celebrities...',
//                       hintStyle: TextStyle(
//                         fontFamily: "Nunito",
//                         fontSize: 14.h,
//                         color: const Color(0xff8E8E8E),
//                       ),
//                     ),
//                     onChanged: (text) => viewModel.onSearchTextChanged(text),
//                   ),
//                   suggestionsCallback: (pattern) async {
//                     // Trigger the search based on the pattern
//                     if (viewModel.searchInfluencerList.status ==
//                         Status.COMPLETED) {
//                       return viewModel.searchInfluencerList.data!.data!
//                               .where((user) => user.name
//                                   .toString()
//                                   .toLowerCase()
//                                   .contains(pattern.toLowerCase()))
//                               .toList() ??
//                           [];
//                     }
//                     return [];
//                   },
//                   itemBuilder: (context, suggestion) {
//                     if (viewModel.searchInfluencerList.status ==
//                         Status.LOADING) {
//                       // Show loader when data is being fetched
//                       return ListTile(
//                         title: Row(
//                           children: [
//                             CircularProgressIndicator(), // Loader inside the list item
//                             SizedBox(width: 10),
//                             Text(
//                                 "Loading..."), // Optional: Additional text to indicate loading
//                           ],
//                         ),
//                       );
//                     } else {
//                       // Display the suggestion result once loaded
//                       return GestureDetector(
//                         onTap: () {
//                           navigate(
//                               context,
//                               InfluencerProfileScreen(
//                                   influencerId: suggestion.id.toString()));
//                         },
//                         child: ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: suggestion.image != null
//                                 ? NetworkImage(suggestion.image)
//                                 : AssetImage("assets/placeholder_image.png")
//                                     as ImageProvider,
//                           ),
//                           title: Text(suggestion.name ??
//                               'No Name'), // Fallback if name is null
//                         ),
//                       );
//                     }
//                   },
//                   onSuggestionSelected: (suggestion) {
//                     // Handle when a suggestion is selected
//                     print("Selected: ${suggestion.name}");
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(height: 13.h),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                 ChangeNotifierProvider(
//             create: (BuildContext context) => viewModel,
//                   child: Consumer<HomeScreenViewModel>(
//                     builder: (context, value, child) {
//                       switch (value.influencerCategoryList.status) {
//                         case Status.INIT:
//                           return Container();
//                         case Status.LOADING:
//                           return Center(child: const CircularProgressIndicator());
//                         case Status.ERROR:
//                           return Center(
//                             child: Content(
//                                 data: value.influencerCategoryList.message
//                                     .toString(),
//                                 size: 18),
//                           );
//                         case Status.COMPLETED:
//                           return Center(
//                             child: Column(children: [
//                               StyledCarouselSlider(
//                                   categories: viewModel.categories)
//                             ]),
//                           );
//                         case null:
//                       }
//                       return Container();
//                     },
//                   ),
//                 ),

//                 SizedBox(height: 40.h),
//                 Container(
//                   margin: EdgeInsets.only(left: 12.w),
//                   child: Content(
//                     data: "Trending Influencers",
//                     size: 22.h,
//                     family: "Nunito",
//                     color: Color(0xff0A071E),
//                     weight: FontWeight.w700,
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 14.h),
//                   child: ChangeNotifierProvider(
//             create: (BuildContext context) => viewModel,
//                     child: Consumer<HomeScreenViewModel>(
//                       // Assume data is in HomeScreenViewModel
//                       builder: (context, value, child) {
//                         switch (value.trendingInfluencerList.status) {
//                           case Status.INIT:
//                             return Container();
//                           case Status.LOADING:
//                             return Center(
//                                 child: const CircularProgressIndicator());
//                           case Status.ERROR:
//                             return Center(
//                               child: Content(
//                                   data: value.trendingInfluencerList.message
//                                       .toString(),
//                                   size: 18),
//                             );
//                           case Status.COMPLETED:
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: value.trendingInfluencerList.data!.result!
//                                   .map((influencer) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             InfluencerProfileScreen(
//                                           influencerId: influencer.id
//                                               .toString(), // Pass the influencer data to the profile screen
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: InfluencerCardWidget(
//                                     image: influencer.image
//                                         .toString(), // Assuming 'image' is a URL or asset path
//                                     influencerName: influencer.name
//                                         .toString(), // Use actual name from API
//                                     categoryName: influencer
//                                         .influencerCategory!.first.name
//                                         .toString(), // Or whichever field you need
//                                   ),
//                                 );
//                               }).toList(),
//                             );
//                           case null:
//                         }
//                         return Container();
//                       },
//                     ),
//                   ),
//                 ),

//                 SizedBox(
//                   height: 23.h,
//                 ),

//             //     ChangeNotifierProvider(
//             // create: (BuildContext context) => viewModel,
//             //       child: Consumer<HomeScreenViewModel>(
//             //         // Assume data is in HomeScreenViewModel
//             //         builder: (context, value, child) {
//             //           switch (value.giveAwayList.status) {
//             //             case Status.INIT:
//             //               return Container();
//             //             case Status.LOADING:
//             //               return Center(child: const CircularProgressIndicator());
//             //             case Status.ERROR:
//             //               return Center(
//             //                 child: Content(
//             //                     data: value.giveAwayList.message.toString(),
//             //                     size: 18),
//             //               );
//             //             case Status.COMPLETED:
//             //               return Column(
//             //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             //                   children: [
//             //                     ListTile(
//             //                         leading: CircleAvatar(
//             //                           radius: 22.r,
//             //                           backgroundImage: NetworkImage(value
//             //                               .giveAwayList.data!.result!.first.image
//             //                               .toString()),
//             //                         ),
//             //                         title: Text(
//             //                           value.giveAwayList.data!.result!.first.price
//             //                               .toString(),
//             //                           // textScaleFactor: 1.5,
//             //                         ),
//             //                         // trailing: Icon(Icons.done),
//             //                         subtitle: Content(
//             //                           data: value
//             //                               .giveAwayList.data!.result!.first.title
//             //                               .toString(),
//             //                           size: 12.h,
//             //                           weight: FontWeight.w400,
//             //                           family: "Nunito",
//             //                         )
//             //                         // selected: true,
//             //                         ),
//             //                     GestureDetector(
//             //                       onTap: () {
//             //                         navigate(context, GivewayScreen());
//             //                       },
//             //                       child: Center(
//             //                         child: Stack(
//             //                           children: [
//             //                             Container(
//             //                               width: 331.w,
//             //                               height: 165.h,
//             //                               decoration: BoxDecoration(
//             //                                   color: Colors.amber,
//             //                                   borderRadius:
//             //                                       BorderRadius.circular(10.r)),
//             //                               child: Image.network(
//             //                                 value.giveAwayList.data!.result!.first
//             //                                     .image
//             //                                     .toString(),
//             //                                 fit: BoxFit.contain,
//             //                               ),
//             //                             ),
//             //                             Container(
//             //                                 margin: EdgeInsets.only(
//             //                                   left: 300.w,
//             //                                 ),
//             //                                 child: Image.asset(
//             //                                   "assets/Icon/bookmark.png",
//             //                                   height: 31.h,
//             //                                 )),
//             //                           ],
//             //                         ),
//             //                       ),
//             //                     ),
//             //                     Row(
//             //                       crossAxisAlignment: CrossAxisAlignment.start,
//             //                       children: [
//             //                         Container(
//             //                           height: 16.63.h,
//             //                           width: 45.w,
//             //                           margin:
//             //                               EdgeInsets.only(left: 21.w, top: 7.h),
//             //                           // padding: EdgeInsets.all(50.w),
//             //                           decoration: BoxDecoration(
//             //                             borderRadius: BorderRadius.circular(20.r),
//             //                             color: Color(0xffB0ABAB),
//             //                           ),
//             //                           child: Row(
//             //                             mainAxisAlignment:
//             //                                 MainAxisAlignment.spaceEvenly,
//             //                             children: [
//             //                               Image.asset("assets/Icon/Heart.png"),
//             //                               Content(
//             //                                 data: value.giveAwayList.data!.result!
//             //                                     .first.like
//             //                                     .toString(),
//             //                                 size: 10.h,
//             //                                 weight: FontWeight.w700,
//             //                                 family: "Nunito",
//             //                               ),
//             //                             ],
//             //                           ),
//             //                         ),
//             //                         SizedBox(
//             //                           height: 60.h,
//             //                           width: 150
//             //                               .w, // Adjust based on your image size
//             //                           child: Stack(
//             //                             children: [
//             //                               for (int i = 0;
//             //                                   i < 4;
//             //                                   i++) // Loop to create multiple images
//             //                                 Positioned(
//             //                                   left: i *
//             //                                       15.0.w, // Adjust to control the overlap amount
//             //                                   child: CircleAvatar(
//             //                                     radius: 15
//             //                                         .r, // Adjust the size of the images
//             //                                     backgroundColor:
//             //                                         Colors.purple, // Border color
//             //                                     child: CircleAvatar(
//             //                                       radius: 28
//             //                                           .r, // Slightly smaller to create the border effect
//             //                                       backgroundImage: AssetImage(
//             //                                           "assets/Vector/girl.png"),
//             //                                     ),
//             //                                   ),
//             //                                 ),
//             //                             ],
//             //                           ),
//             //                         ),
//             //                       ],
//             //                     ),
//             //                   ]);
//             //             case null:
//             //           }
//             //           return Container();
//             //         },
//             //       ),
//             //     ),

//                 Container(
//                   margin: EdgeInsets.only(left: 12.w),
//                   child: Content(
//                     data: "Recently Added",
//                     size: 22.h,
//                     family: "Nunito",
//                     color: Color(0xff0A071E),
//                     weight: FontWeight.w700,
//                   ),
//                 ),

//                 Container(
//                   margin: EdgeInsets.only(left: 14.w, right: 14.w, top: 14.h),
//                   child: ChangeNotifierProvider(
//             create: (BuildContext context) => viewModel,
//                     child: Consumer<HomeScreenViewModel>(
//                       // Assume data is in HomeScreenViewModel
//                       builder: (context, value, child) {
//                         switch (value.recentlyAddedList.status) {
//                           case Status.INIT:
//                             return Container();
//                           case Status.LOADING:
//                             return Center(
//                                 child: const CircularProgressIndicator());
//                           case Status.ERROR:
//                             return Center(
//                               child: Content(
//                                   data:
//                                       value.recentlyAddedList.message.toString(),
//                                   size: 18),
//                             );
//                           case Status.COMPLETED:
//                             final users =
//                                 value.recentlyAddedList.data!.result!.users!;
//                             final firstThreeUsers = users.take(3).toList();
//                             return Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: firstThreeUsers.map((influencer) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             InfluencerProfileScreen(
//                                           influencerId: influencer.id
//                                               .toString(), // Pass the influencer data to the profile screen
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: InfluencerCardWidget(
//                                       image: influencer.image
//                                           .toString(), // Assuming 'image' is a URL or asset path
//                                       influencerName: influencer.name
//                                           .toString(), // Use actual name from API
//                                       categoryName: influencer
//                                           .influencerCategory!.first.name
//                                           .toString() // Or whichever field you need
//                                       ),
//                                 );
//                               }).toList(),
//                             );
//                           case null:
//                         }
//                         return Container();
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 70.h,
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SliderWidget extends StatelessWidget {
//   final String text;
//   final String picture;

//   const SliderWidget({
//     Key? key,
//     required this.text,
//     required this.picture,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Content(
//           data: text,
//           size: 20.h,
//           family: "Nunito",
//           weight: FontWeight.w900,
//         ),
//         SizedBox(height: 15.h),
//         SizedBox(
//           width: 173.w,
//           height: 173.h,
//           child: Stack(
//             children: [
//               Image.network(
//                 picture, // Use dynamic image
//                 height: 173.h,
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return const Icon(
//                     Icons.error,
//                     size: 50,
//                     color: Colors.red,
//                   ); // Dynamic error handling
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               (loadingProgress.expectedTotalBytes ?? 1)
//                           : null,
//                     ),
//                   );
//                 },
//               ),
//               Positioned(
//                 top: 145.h,
//                 child: Container(
//                   width: 173.w,
//                   height: 40.h,
//                   decoration: BoxDecoration(
//                     color: Colors.black
//                         .withOpacity(0.7), // Semi-transparent background
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(7.r),
//                       bottomRight: Radius.circular(7.r),
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Content(
//                         data: text, // Dynamic text
//                         size: 10.h,
//                         family: "Nunito",
//                         weight: FontWeight.w700,
//                         color: Colors.white,
//                       ),
//                       Content(
//                         data:
//                             "Additional Info", // Replace this with any dynamic field if needed
//                         size: 8.h,
//                         family: "Nunito",
//                         weight: FontWeight.w500,
//                         color: Colors.white,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
