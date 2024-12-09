import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidbuy_app/resources/componenets/content.dart';
import 'package:vidbuy_app/viewmodel/notification_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationSettingScreen extends StatefulWidget {
  const NotificationSettingScreen({super.key});

  @override
  State<NotificationSettingScreen> createState() =>
      _NotificationSettingScreenState();
}

class _NotificationSettingScreenState extends State<NotificationSettingScreen> {
  bool pushNotifications = false;
  bool emailNotifications = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      pushNotifications = prefs.getBool('pushNotifications') ?? false;
      emailNotifications = prefs.getBool('emailNotifications') ?? false;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('pushNotifications', pushNotifications);
    await prefs.setBool('emailNotifications', emailNotifications);
  }

  void _saveSettings(BuildContext context) {
    final viewModel =
        Provider.of<NotificationViewModel>(context, listen: false);
    viewModel.fetchNotificationData(
      context,
      notification: pushNotifications ? 1 : 0,
      email: emailNotifications ? 1 : 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // AppBar-like row
          Container(
            margin: EdgeInsets.only(top: 55.h, left: 21.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    "assets/Icon/backarrow.png",
                    height: 25.h,
                  ),
                ),
                SizedBox(width: 5.w),
                Content(
                  data: AppLocalizations.of(context)!.userNotifications,
                  size: 14.h,
                  weight: FontWeight.w600,
                  family: "Nunito",
                ),
              ],
            ),
          ),

          // Notification settings
          Container(
            margin: EdgeInsets.only(left: 21.w, top: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Content(
                  data: AppLocalizations.of(context)!.userNotifications,
                  size: 30.h,
                  weight: FontWeight.w300,
                ),
                Content(
                  data:
                      AppLocalizations.of(context)!.userChooseWhatNotifications,
                  size: 16.h,
                  weight: FontWeight.w300,
                  family: "Lato",
                ),
              ],
            ),
          ),

          SizedBox(height: 60.h),

          // Push Notifications
          SwitchListTile(
            activeColor: const Color(0xff5271FF),
            contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
            title: Text(
              AppLocalizations.of(context)!.userPushNotifications,
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w600,
                fontFamily: "Nunito",
              ),
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.userRecievePushNotifications,
              style: TextStyle(
                fontSize: 14.h,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              ),
            ),
            value: pushNotifications,
            onChanged: (bool value) {
              setState(() {
                pushNotifications = value;
              });
              _savePreferences();
            },
          ),

          SizedBox(height: 39.h),

          // Email Notifications
          SwitchListTile(
            activeColor: const Color(0xff5271FF),
            contentPadding: EdgeInsets.symmetric(horizontal: 30.w),
            title: Text(
              AppLocalizations.of(context)!.userEmailNotification,
              style: TextStyle(
                fontSize: 18.h,
                fontWeight: FontWeight.w600,
                fontFamily: "Nunito",
              ),
            ),
            subtitle: Text(
              AppLocalizations.of(context)!.userRecieveEmailNotification,
              style: TextStyle(
                fontSize: 14.h,
                fontFamily: "Nunito",
                fontWeight: FontWeight.w400,
              ),
            ),
            value: emailNotifications,
            onChanged: (bool value) {
              setState(() {
                emailNotifications = value;
              });
              _savePreferences();
            },
          ),

          SizedBox(height: 221.h),

          // Save button
          Center(
            child: Consumer<NotificationViewModel>(
              builder: (context, viewModel, child) {
                return Container(
                  width: 335.w,
                  height: 50.h,
                  child: ElevatedButton(
                    onPressed: viewModel.loading
                        ? null
                        : () {
                            _saveSettings(context);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5271FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    child: viewModel.loading
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.white,
                            ),
                          )
                        : Text(
                            AppLocalizations.of(context)!.userSave,
                            style:
                                TextStyle(fontSize: 16.h, color: Colors.white),
                          ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
