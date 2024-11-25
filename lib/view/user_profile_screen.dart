import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vidbuy_app/Function/navigate.dart';
import 'package:vidbuy_app/resources/componenets/User_order_tab_bar.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/resources/componenets/profile_tile.dart';
import 'package:vidbuy_app/resources/local_data/local_data.dart';
import 'package:vidbuy_app/resources/log_out.dart';
import 'package:vidbuy_app/view/contact_us_screen.dart';
import 'package:vidbuy_app/view/delete_account_screen.dart';
import 'package:vidbuy_app/view/influencer_donations_screen.dart';
import 'package:vidbuy_app/view/language_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
import 'package:vidbuy_app/view/notification_setting_screen.dart';
import 'package:vidbuy_app/view/policies_screen.dart';
import 'package:vidbuy_app/view/user_edit_profile_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  // Future<void> _logoutUser(BuildContext context) async {
  //   StorageService stg = StorageService();

  //   // Clear user session (e.g., token and user data)
  //   await stg.remove('token'); // Remove token from storage
  //   await stg.remove('user'); // Remove user info from storage

  //   // Navigate back to the login screen
  //   Navigator.pushNamedAndRemoveUntil(
  //     context,
  //     Nav.login, // Assuming `Nav.login` is the route name for the login screen
  //     (Route<dynamic> route) => false, // Remove all routes from the stack
  //   );
  // }

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
            decoration: BoxDecoration(color: Color(0xffFFFFFF), boxShadow: [
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
                      navigate(context, NavBarScreen());
                    },
                    child: ProfileTile(
                      height: 18.h,
                      image: "assets/Icon/layouticon.png",
                      text: AppLocalizations.of(context)!.influencers,
                    ),
                  ),
                  SizedBox(
                    height: 17.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      navigate(context, UserOrderTabbar());
                    },
                    child: ProfileTile(
                        height: 18.h,
                        image: "assets/Icon/layouticon.png",
                        text: AppLocalizations.of(context)!.orders),
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
                        text: AppLocalizations.of(context)!.donation),
                  ),
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
                        text:
                            AppLocalizations.of(context)!.notificationSettings),
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
                      navigate(context, ContactUsScreen());
                    },
                    child: ProfileTile(
                        height: 25.h,
                        image: "assets/Icon/help.png",
                        text: AppLocalizations.of(context)!.support),
                  ),
                  SizedBox(
                    height: 17.h,
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
                    height: 17.h,
                  ),
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
