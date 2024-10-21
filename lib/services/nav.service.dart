import 'package:flutter/material.dart';
import 'package:vidbuy_app/view/home_screen.dart';
import 'package:vidbuy_app/view/nav_bar.dart';
import 'package:vidbuy_app/view/select_login_screen.dart';
import 'package:vidbuy_app/view/splash_screen.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

class Nav {
  static const String splash = '/';
  static const String home = '/home';
  static const String navBar = '/navbar';
  static const String login = '/login';
  static const String register = '/register';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case navBar:
        return MaterialPageRoute(builder: (_) => const NavBarScreen());
      case login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case register:
        return MaterialPageRoute(builder: (_) => const SelectLoginScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => SplashScreen()); // Default case
    }
  }
}
