import 'package:flutter/cupertino.dart';
import 'package:vidbuy_app/resources/componenets/user_donations_tabbar_widget.dart';
import 'package:vidbuy_app/view/home_screen.dart';
import 'package:vidbuy_app/view/influencer_unique_profile.dart';
import 'package:vidbuy_app/view/search_screen.dart';
import 'package:vidbuy_app/view/user_profile_screen.dart';

final screens = [
  HomeScreen(),
  //  LoginScreen(),
  SearchScreen(),
  //  OtpScren(),
  UserDonationsTabBarWidget(),
  UserProfileScreen(),
  // InfluencerUniqueProfile()
  //  OtpScren(),

  // const HomeScreen(),
  // const GatePassScreen(),
  // TankerScreen(),
  // const BillingScreen()
];

class NavbarProvider with ChangeNotifier {
  int _screen = 0;
  get screen => _screen;

  void changeScreen(int index) {
    _screen = index;
    notifyListeners();
  }
}
