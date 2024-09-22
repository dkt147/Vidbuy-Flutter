import 'package:flutter/cupertino.dart';
import 'package:vidbuy_app/resources/componenets/tab_bar_widget2.dart';
import 'package:vidbuy_app/view/home_screen.dart';
import 'package:vidbuy_app/view/otp_scren.dart';
import 'package:vidbuy_app/view/profile_screen.dart';
import 'package:vidbuy_app/view/search_screen.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

final screens = [
  HomeScreen(),
  //  LoginScreen(),
  SearchScreen(),
  //  OtpScren(),
  TabBarWidget2(),
   ProfileScreen(),
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
