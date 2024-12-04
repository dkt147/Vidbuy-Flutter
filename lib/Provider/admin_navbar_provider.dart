import 'package:flutter/material.dart';
import 'package:vidbuy_app/resources/componenets/influencer_order_tabbar.dart';
import 'package:vidbuy_app/view/admin_dashboard_screen.dart';
import 'package:vidbuy_app/view/admin_setting_screen.dart';
import 'package:vidbuy_app/view/influencer_unique_profile.dart';

final screens = [
  // HomeScreen(),
  // //  LoginScreen(),
  // SearchScreen(),
  //  OtpScren(),
  // CreateUserAccountScreen(),
  // InfluencerDonationsTabbarWidget(),
  // UserDonationsTabBarWidget(),
  // InfluencerOrderTabbar(),
  AdminDashboardScreen(),
  const AdminProfileScreen()
  //  OtpScren(),

  // const HomeScreen(),
  // const GatePassScreen(),
  // TankerScreen(),
  // const BillingScreen()
];

class AdminNavbarProvider with ChangeNotifier {
  int _screen = 0;
  get screen => _screen;

  // var influencerScreens;
  // get screen => _screen;

  void changeScreen(int index) {
    _screen = index;
    notifyListeners();
  }
}
