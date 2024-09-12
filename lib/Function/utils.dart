import 'package:flutter/material.dart';

class  Utils {
  // static const String _loginIdKey = 'loginId';
  // static String loginId = "";

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  // static toastMessage(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //   );
  // }

  // static void flushBarErrorMessage(String message, BuildContext context) {
  //   showFlushbar(
  //       context: context,
  //       flushbar: Flushbar(
  //         forwardAnimationCurve: Curves.bounceIn,
  //         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 19),
  //         padding: EdgeInsets.all(15),
  //         icon: Icon(Icons.error),
  //         // title: "Flush Bar",
  //         message: message,
  //         backgroundColor: Colors.red,
  //         duration: Duration(seconds: 3),
  //       )..show(context));
  }

  snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  // static dateFormat1(value) {
  //   //Output: 01/Jan/23
  //   return DateFormat('dd/MMM/yy').format(DateTime.parse(value.toString()));
  // }

  // static dateFormat2(value) {
  //   // Output: Sun, 01 Jan 23
  //   return DateFormat('E, dd MMM yy').format(DateTime.parse(value.toString()));
  // }

  // static dateTimeFormat(value) {
  //   // Output: Sun, 01 Jan 23
  //   // return
  //   //  DateFormat(' HH:mm, E, dd MMM yy')
  //   return dateFormat1('dd MMM yy, E | HH:mm')
  //       .format(DateTime.parse(value.toString()));
  // }

  // static TimeFormat(value) {
  //   // Output: Sun, 01 Jan 23
  //   return dateFormat2('hh:mm a').format(DateTime.parse(value.toString()));
  // }
  // //  "Jan 30, Mon | 7:32pm",

  // static getMonth(value) {
  //   // Output: Sun, 01 Jan 23
  //   return dateFormat1('MMM').format(DateTime.parse(value.toString()));
  // }
