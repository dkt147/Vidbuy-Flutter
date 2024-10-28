import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vidbuy_app/main.dart';
import 'package:vidbuy_app/view/user_login_screen.dart';

logOut(context, bool loading) async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences pref = await SharedPreferences.getInstance();

  pref.clear();

  Timer(
      Duration(seconds: loading ? 1 : 0),
      () => Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (route) => false));
}
