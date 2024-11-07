import 'package:flutter/material.dart';
import 'package:vidbuy_app/resources/componenets/influencer_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/resources/componenets/influencer_order_tabbar.dart';
import 'package:vidbuy_app/resources/componenets/user_task_detail_tabbar_widget.dart';
import 'package:vidbuy_app/view/influencer_unique_profile.dart';
import 'package:vidbuy_app/view/user_profile_screen.dart';

final screens = [
  // HomeScreen(),
  // //  LoginScreen(),
  // SearchScreen(),
  //  OtpScren(),
  // CreateUserAccountScreen(),
  // InfluencerDonationsTabbarWidget(),
  // UserDonationsTabBarWidget(),
  InfluencerOrderTabbar(),
  InfluencerUniqueProfile()
  //  OtpScren(),

  // const HomeScreen(),
  // const GatePassScreen(),
  // TankerScreen(),
  // const BillingScreen()
];

class InfluencerNavbarProvider with ChangeNotifier {
  int _screen = 0;
  get screen => _screen;

  // var influencerScreens;
  // get screen => _screen;

  void changeScreen(int index) {
    _screen = index;
    notifyListeners();
  }
}
