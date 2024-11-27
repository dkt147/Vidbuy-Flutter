import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/influencer_order_tabbar.dart';
import 'package:vidbuy_app/resources/componenets/influencer_video_price_tab_bar.dart';
import 'package:vidbuy_app/resources/componenets/profile_tile.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/view/balance_screen.dart';
import 'package:vidbuy_app/view/contact_us_screen.dart';
import 'package:vidbuy_app/view/delete_account_screen.dart';
import 'package:vidbuy_app/view/influencer_donations_sent_screen.dart';
import 'package:vidbuy_app/view/influencer_edit_profile_screen.dart';
import 'package:vidbuy_app/view/language_screen.dart';
import 'package:vidbuy_app/view/notification_setting_screen.dart';
import 'package:vidbuy_app/view/policies_screen.dart';
import 'package:vidbuy_app/view/update_category_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vidbuy_app/viewmodel/user_view_model/user_profile_view_model.dart';

class InfluencerUniqueProfile extends StatefulWidget {
  const InfluencerUniqueProfile({super.key});

  @override
  State<InfluencerUniqueProfile> createState() =>
      _InfluencerUniqueProfileState();
}

class _InfluencerUniqueProfileState extends State<InfluencerUniqueProfile> {
  late TabController _tabController;
  String selectedCategory = "Actor";
  Map<String, double> prices = {"Birthday": 0, "Special Day": 0, "Other": 0};
  List<String> selectedVideos = [];
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

  void goToNextTab() {
    setState(() {
      _tabController.index += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserProfileViewModel>(context, listen: false);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 42.h,
          ),
          Container(
            width: 375.w,
            height: 43.h,
            color: Color(0xffF1F4F8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon(Icons.)
                Image.asset(
                  "assets/Icon/holiday.png",
                  height: 30.h,
                ),
                Content(
                  data: "You are in Vacation Mode",
                  size: 20.h,
                  weight: FontWeight.w300,
                  color: Color(0xff8E8E8E),
                ),
              ],
            ),
          ),
          Container(
            width: 375.w,
            height: 143.h,
            color: Color(0xffFFFFFF),
            child: Row(
              children: [
                Container(
                  width: 98.w,
                  height: 99.h,
                  margin: EdgeInsets.only(left: 21.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(LocalData.image.toString()),
                      fit: BoxFit
                          .cover, // Ensures the image covers the entire circle
                    ),
                  ),
                ),
                SizedBox(
                  width: 17.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 39.h,
                    ),
                    Content(
                      data: LocalData.name.toString(),
                      size: 18.h,
                      family: "Lato",
                      weight: FontWeight.w700,
                    ),
                    Content(
                      data: LocalData.email.toString(),
                      size: 18.h,
                      family: "Lato",
                      weight: FontWeight.w700,
                    ),
                    Container(
                      width: 112.w,
                      height: 17.h,
                      color: Color(0xffD9D9D9),
                      child: Center(
                        child: Content(
                          data: LocalData.id.toString(),
                          size: 12.h,
                          family: "Lato",
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 22.h,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 260.w),
                      child: Content(
                        data: AppLocalizations.of(context)!.account,
                        size: 20.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      )),

                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, InfluencerOrderTabbar());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.task),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, InfluencerDonationsSentScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.donation),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, InfluencerVideoPriceTabBarWidget());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.updateVideoPrice),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, UpdateCategoryScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.updateCategory),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  // Container(
                  //     margin: EdgeInsets.only(right: 260.w),
                  //     child: Content(
                  //       data: "General",
                  //       size: 18.h,
                  //       family: "Lato",
                  //       weight: FontWeight.w600,
                  //     )),
                  // SizedBox(
                  //   height: 11.h,
                  // ),
                  // Text(LocalData.image.toString()),
                  GestureDetector(
                      onTap: () {
                        navigate(context, BalanceScreen());
                      },
                      child: ProfileTile(
                          image: "assets/Icon/layouticon.png",
                          text: AppLocalizations.of(context)!.balance)),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, InfluencerEditProfileScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.editProfile),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      // navigate(context, PoliciesScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.vacationMode),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        navigate(context, NotificationSettingScreen());
                      },
                      child: ProfileTile(
                          image: "assets/Icon/layouticon.png",
                          text: AppLocalizations.of(context)!
                              .notificationSettings)),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, InfluencerOrderTabbar());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.orders),
                  ),
                  // SizedBox(
                  //   height: 17.h,
                  // ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 260.w),
                      child: Content(
                        data: AppLocalizations.of(context)!.general,
                        size: 18.h,
                        family: "Lato",
                        weight: FontWeight.w600,
                      )),
                  SizedBox(
                    height: 11.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, LanguageScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.language),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, ContactUsScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.support),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, PoliciesScreen());
                    },
                    child: ProfileTile(
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.policies),
                  ),
                  SizedBox(
                    height: 11.h,
                  ),
                  Consumer<UserProfileViewModel>(
                      builder: (context, viewModel, child) {
                    return GestureDetector(
                      onTap: () {
                        viewModel.fetchLogOutAccountResponse(context);
                      },
                      child: ProfileTile(
                          image: "assets/Icon/layouticon.png",
                          text: AppLocalizations.of(context)!.logOut),
                    );
                  }),
                  SizedBox(
                    height: 11.h,
                  ),
                  //               ProfileTile(
                  // image: "assets/Icon/layouticon.png", text: "Support"),

                  GestureDetector(
                    onTap: () {
                      navigate(context, DeleteAccountScreen());
                    },
                    child: Center(
                        child: Content(
                            data:
                                "${AppLocalizations.of(context)!.doYouWantToDelete} ${AppLocalizations.of(context)!.delete}",
                            size: 12.h,
                            weight: FontWeight.w300)),
                  ),
                  SizedBox(
                    height: 100.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
