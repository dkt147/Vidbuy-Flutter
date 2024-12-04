import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/admin_canceled_order_tab_bar.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/main_tabbar_admin_widget.dart';
import 'package:vidbuy_app/resources/componenets/profile_tile.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/resources/log_out.dart';
import 'package:vidbuy_app/view/admin_reported_video_screen.dart';
import 'package:vidbuy_app/view/influencer_donations_screen.dart';
import 'package:vidbuy_app/view/language_screen.dart';
import 'package:vidbuy_app/view/notification_setting_screen.dart';
import 'package:vidbuy_app/view/policies_screen.dart';
import 'package:vidbuy_app/view/user_edit_profile_screen.dart';

class AdminProfileScreen extends StatelessWidget {
  const AdminProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Column(
        children: [
          SizedBox(
            height: 42.h,
          ),
          Container(
            width: 375.w,
            height: 143.h,
            decoration:
                const BoxDecoration(color: Color(0xffFFFFFF), boxShadow: [
              BoxShadow(
                color: Color(0xff000000),
                blurRadius: 1,
                offset: Offset(0, 0), // Shadow position
              ),
            ]),
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
                Content(
                  data: "${LocalData.name} \n ${LocalData.email}",
                  size: 18.h,
                  family: "Lato",
                  weight: FontWeight.w700,
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 22.h,
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 260.w),
                        child: Content(
                          data: AppLocalizations.of(context)!.account,
                          size: 18.h,
                          family: "Lato",
                          weight: FontWeight.w600,
                        )),
                    SizedBox(
                      height: 22.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(
                          context,
                          MainTabbarAdminWidget(),
                        );
                      },
                      child: ProfileTile(
                        height: 18.h,
                        image: "assets/Icon/layouticon.png",
                        text: "Approve Influencers",
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, AdminCanceledOrderTabBar());
                      },
                      child: ProfileTile(
                          height: 18.h,
                          image: "assets/Icon/layouticon.png",
                          text: "Canceled Orders"),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, AdminReportedVideoScreen());
                      },
                      child: ProfileTile(
                          height: 18.h,
                          image: "assets/Icon/layouticon.png",
                          text: "Reported Videos"),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, InfluencerDonationsScreen());
                      },
                      child: ProfileTile(
                          height: 20.h,
                          image: "assets/Icon/simpleheart.png",
                          text: "Analysis"),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                        onTap: () {
                          navigate(context, LanguageScreen());
                        },
                        child: ProfileTile(
                            height: 20.h,
                            image: "assets/Icon/world.png",
                            text: AppLocalizations.of(context)!.language)),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, NotificationSettingScreen());
                      },
                      child: ProfileTile(
                          height: 25.h,
                          image: "assets/Icon/bell.png",
                          text: AppLocalizations.of(context)!
                              .notificationSettings),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        navigate(context, UserEditProfileScreen());
                      },
                      child: ProfileTile(
                          height: 25.h,
                          image: "assets/Icon/editprofile.png",
                          text: AppLocalizations.of(context)!.editProfile),
                    ),
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
                        navigate(context, PoliciesScreen());
                      },
                      child: ProfileTile(
                          height: 25.h,
                          image: "assets/Icon/lock.png",
                          text: AppLocalizations.of(context)!.policies),
                    ),
                    // ProfileTile(image: "assets/Icon/layouticon.png", text: "Logout"),
                    SizedBox(
                      height: 17.h,
                    ),
                    GestureDetector(
                      onTap: () async {
                        // await _logoutUser(context);
                      },
                      child: GestureDetector(
                        onTap: () {
                          logOut(context, true);
                        },
                        child: ProfileTile(
                            height: 25.h,
                            image: "assets/Icon/Logout.png",
                            text: AppLocalizations.of(context)!.logOut),
                      ),
                    ),

                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
