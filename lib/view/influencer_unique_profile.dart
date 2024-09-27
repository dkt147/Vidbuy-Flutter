// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vidbuy_app/Function/navigate.dart';
// import 'package:vidbuy_app/resources/componenets/content.dart';
// import 'package:vidbuy_app/resources/componenets/profile_tile.dart';
// import 'package:vidbuy_app/resources/componenets/tab_bar_widget.dart';
// import 'package:vidbuy_app/view/balance_screen.dart';
// import 'package:vidbuy_app/view/choose_category_screen.dart.dart';
// import 'package:vidbuy_app/view/choose_price_screen.dart';
// import 'package:vidbuy_app/view/contact_us_screen.dart';
// import 'package:vidbuy_app/view/delete_account_screen.dart';
// import 'package:vidbuy_app/view/influencer_edit_profile_screen.dart';
// import 'package:vidbuy_app/view/language_screen.dart';
// import 'package:vidbuy_app/view/notification_setting_screen.dart';
// import 'package:vidbuy_app/view/policies_screen.dart';
// import 'package:vidbuy_app/view/review_selection_screen.dart';
// import 'package:vidbuy_app/view/user_edit_profile_screen.dart';
// import 'package:vidbuy_app/view/videos_accepet_screen.dart';

// class InfluencerUniqueProfile extends StatefulWidget {
//   const InfluencerUniqueProfile({super.key});

//   @override
//   State<InfluencerUniqueProfile> createState() =>
//       _InfluencerUniqueProfileState();
// }

// class _InfluencerUniqueProfileState extends State<InfluencerUniqueProfile> {
//   late TabController _tabController;
//   String selectedCategory = "Actor";
//   Map<String, double> prices = {"Birthday": 0, "Special Day": 0, "Other": 0};
//   List<String> selectedVideos = [];
//   void saveCategory(String category) {
//     setState(() {
//       selectedCategory = category;
//     });
//     goToNextTab();
//   }

//   void saveVideos(List<String> videos) {
//     setState(() {
//       selectedVideos = videos;
//     });
//     goToNextTab();
//   }

//   void savePrices(Map<String, double> newPrices) {
//     setState(() {
//       prices = newPrices;
//     });
//     goToNextTab();
//   }

//   void goToNextTab() {
//     setState(() {
//       _tabController.index += 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           SizedBox(
//             height: 42.h,
//           ),
//           Container(
//             width: 375.w,
//             height: 43.h,
//             color: Color(0xffF1F4F8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Icon(Icons.)
//                 Image.asset(
//                   "assets/Icon/holiday.png",
//                   height: 30.h,
//                 ),
//                 Content(
//                   data: "You are in Vacation Mode",
//                   size: 20.h,
//                   weight: FontWeight.w300,
//                   color: Color(0xff8E8E8E),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 375.w,
//             height: 143.h,
//             color: Color(0xffFFFFFF),
//             child: Row(
//               children: [
//                 Container(
//                   width: 98.w,
//                   height: 99.h,
//                   margin: EdgeInsets.only(left: 21.w),
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                   ),
//                   child: Image.asset("assets/Vector/girl.png"),
//                 ),
//                 SizedBox(
//                   width: 17.w,
//                 ),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height: 39.h,
//                     ),
//                     Content(
//                       data: "Benji hovl",
//                       size: 18.h,
//                       family: "Lato",
//                       weight: FontWeight.w700,
//                     ),
//                     Content(
//                       data: "Benji@gmail.com",
//                       size: 18.h,
//                       family: "Lato",
//                       weight: FontWeight.w700,
//                     ),
//                     Container(
//                       width: 112.w,
//                       height: 17.h,
//                       color: Color(0xffD9D9D9),
//                       child: Center(
//                         child: Content(
//                           data: "1234567",
//                           size: 12.h,
//                           family: "Lato",
//                           weight: FontWeight.w700,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 // crossAxisAlignment: CrossAxisAlignment.start,
//                 // mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 22.h,
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(right: 260.w),
//                       child: Content(
//                         data: "Account",
//                         size: 18.h,
//                         family: "Lato",
//                         weight: FontWeight.w600,
//                       )),
//                   ProfileTile(
//                       image: "assets/Icon/layouticon.png", text: "Tasks"),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   ProfileTile(
//                       image: "assets/Icon/layouticon.png", text: "Donations"),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       // navigate(context, VIdeosAcceptScreen(onSave: saveVideos));
//                       navigate(
//                           context,
//                           TabBarWidget(screens: [
//                             VIdeosAcceptScreen(onSave: saveVideos),
//                             ChoosePricesScreen(onSave: savePrices),
//                             ReviewSelectionScreen(
//                                 selectedCategory: selectedCategory,
//                                 selectedVideos: selectedVideos,
//                                 prices: prices),
//                           ], tabTitles: [
//                             'Videos',
//                             'Prices',
//                             'Review'
//                           ]));
//                     },
//                     child: ProfileTile(
//                         image: "assets/Icon/layouticon.png",
//                         text: "Update Videos & prices"),
//                   ),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       navigate(
//                           context,
//                           ChooseCategoryScreen(
//                             onSave: saveCategory,
//                           ));
//                     },
//                     child: ProfileTile(
//                         image: "assets/Icon/layouticon.png",
//                         text: "Update Categorie"),
//                   ),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   // Container(
//                   //     margin: EdgeInsets.only(right: 260.w),
//                   //     child: Content(
//                   //       data: "General",
//                   //       size: 18.h,
//                   //       family: "Lato",
//                   //       weight: FontWeight.w600,
//                   //     )),
//                   // SizedBox(
//                   //   height: 11.h,
//                   // ),
//                   GestureDetector(
//                       onTap: () {
//                         navigate(context, BalanceScreen());
//                       },
//                       child: ProfileTile(
//                           image: "assets/Icon/layouticon.png",
//                           text: "Balance")),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       navigate(context, InfluencerEditProfileScreen());
//                     },
//                     child: ProfileTile(
//                         image: "assets/Icon/layouticon.png",
//                         text: "Edit Profile"),
//                   ),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       navigate(context, PoliciesScreen());
//                     },
//                     child: ProfileTile(
//                         image: "assets/Icon/layouticon.png",
//                         text: "Vacation Mode"),
//                   ),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   GestureDetector(
//                       onTap: () {
//                         navigate(context, NotificationSettingScreen());
//                       },
//                       child: ProfileTile(
//                           image: "assets/Icon/layouticon.png",
//                           text: "Notification Settings")),
//                   SizedBox(
//                     height: 17.h,
//                   ),
//                   ProfileTile(
//                       image: "assets/Icon/layouticon.png", text: "Orders"),
//                   // SizedBox(
//                   //   height: 17.h,
//                   // ),
//                   SizedBox(
//                     height: 25.h,
//                   ),
//                   Container(
//                       margin: EdgeInsets.only(right: 260.w),
//                       child: Content(
//                         data: "General",
//                         size: 18.h,
//                         family: "Lato",
//                         weight: FontWeight.w600,
//                       )),
//                   SizedBox(
//                     height: 11.h,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       navigate(context, LanguageScreen());
//                     },
//                     child: ProfileTile(
//                         image: "assets/Icon/layouticon.png", text: "Language"),
//                   ),
//                   SizedBox(
//                     height: 11.h,
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       navigate(context, ContactUsScreen());
//                     },
//                     child: ProfileTile(
//                         image: "assets/Icon/layouticon.png", text: "Support"),
//                   ),
//                   SizedBox(
//                     height: 11.h,
//                   ),
//                   ProfileTile(
//                       image: "assets/Icon/layouticon.png", text: "Plicies"),
//                   SizedBox(
//                     height: 11.h,
//                   ),
//                   ProfileTile(
//                       image: "assets/Icon/layouticon.png", text: "Logout"),
//                   SizedBox(
//                     height: 11.h,
//                   ),
//                   //               ProfileTile(
//                   // image: "assets/Icon/layouticon.png", text: "Support"),

//                   GestureDetector(
//                     onTap: () {
//                       navigate(context, DeleteAccountScreen());
//                     },
//                     child: Center(
//                         child: Content(
//                             data: "Do you want to delete the account? Delete",
//                             size: 12.h,
//                             weight: FontWeight.w300)),
//                   ),
//                   SizedBox(
//                     height: 100.h,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
