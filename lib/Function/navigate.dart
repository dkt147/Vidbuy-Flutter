import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

navigate(context, screen) {
  Navigator.push(
      context,
      PageTransition(
          child: screen,
          type: PageTransitionType.leftToRight,
          duration: Duration(milliseconds: 300)));
}

navigateTop(context, screen) {
  Navigator.push(
      context,
      PageTransition(
          child: screen,
          type: PageTransitionType.bottomToTop,
          duration: Duration(milliseconds: 300)));
}

navigatePushReplace(context, screen) {
  Navigator.pushReplacement(
      context,
      PageTransition(
          child: screen,
          type: PageTransitionType.leftToRight,
          duration: Duration(milliseconds: 300)));
}
